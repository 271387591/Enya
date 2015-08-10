package com.ozstrategy.webapp.controller.system;

import com.ozstrategy.model.system.Survey;
import com.ozstrategy.model.system.UserSurvey;
import com.ozstrategy.service.exh.ExhServiceManager;
import com.ozstrategy.service.system.AnswerManager;
import com.ozstrategy.service.system.QuestionManager;
import com.ozstrategy.service.system.SurveyManager;
import com.ozstrategy.service.system.UserSurveyManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhServiceCommand;
import com.ozstrategy.webapp.command.system.SurveyCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-07-27.
*/
@RestController
@RequestMapping("survey")
public class SurveyController extends BaseController {
    @Autowired
    private SurveyManager surveyManager;
    @Autowired
    private UserSurveyManager userSurveyManager;
    @Autowired
    private QuestionManager questionManager;
    @Autowired
    private AnswerManager answerManager;



    @RequestMapping("security/index")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("system/survey");
    }
    @RequestMapping("security/add")
    public ModelAndView games(HttpServletRequest request, HttpServletResponse response) {
        SurveyCommand command=new SurveyCommand();
        return new ModelAndView("system/addSurvey","command",command);
    }
    @RequestMapping("security/edit/{id}")
    public ModelAndView edit(@PathVariable Long id) {
        SurveyCommand command=new SurveyCommand();
        try{
            command=new SurveyCommand(surveyManager.get(id));
        }catch (Exception e){
            logger.error("addAdvert fail",e);
        }
        return new ModelAndView("system/addSurvey","command",command);
    }

    @RequestMapping("security/list")
    public JsonReaderResponse<SurveyCommand> list(HttpServletRequest request){
        List<SurveyCommand> commands=new ArrayList<SurveyCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<Survey> models= surveyManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(Survey model:models){
                        SurveyCommand command=new SurveyCommand(model);
                        Map<String,Object> objectMap=new HashMap<String, Object>();
                        objectMap.put("Q_surveyId_EQ",command.getId());
                        UserSurvey userSurvey=userSurveyManager.getByParam(objectMap);
                        if(userSurvey!=null){
                            command.setHasUser(true);
                        }
                        commands.add(command);
                    }
                }
                Integer count=surveyManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<SurveyCommand> save(@RequestBody SurveyCommand command){
        try{
            Long id=command.getId();
            Survey survey=null;
            if(id==null){
                survey=new Survey();
                survey.setCreateDate(new Date());
            }else{
                survey=surveyManager.get(id);
            }
            survey.setName(command.getName());
            surveyManager.saveOrUpdate(survey);

            return new JsonReaderSingleResponse(survey,true,"");
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("security/delete/{id}")
    public JsonReaderSingleResponse<SurveyCommand> delete(@PathVariable Long id){
        try{
            Survey survey=surveyManager.get(id);
            if(survey!=null){
                surveyManager.deleteSurvey(survey);
            }
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
    @RequestMapping("security/publish/{id}")
    public JsonReaderSingleResponse<SurveyCommand> publish(@PathVariable Long id){
        try{
            Survey survey=surveyManager.get(id);
            if(survey!=null){
                surveyManager.publishSurvey(survey);
            }
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"发布失败");
    }
     @RequestMapping("security/detail/{id}")
    public ModelAndView detail(@PathVariable Long id){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_id_EQ",id);
            Map<String,Object> survey=surveyManager.queryMap(map);
            if(survey!=null && survey.size()>0){
                map=new HashMap<String, Object>();
                map.put("surveyId",id);
                Integer surveyCount=userSurveyManager.findByNamedQueryClass("getSurveyCount",Integer.class,map);
                map=new HashMap<String, Object>();
                map.put("Q_surveyId_EQ",survey.get("id"));
                map.put("Q_type","ASC");
                List<Map<String,Object>> questions=questionManager.listMap(map);
                if(questions!=null && questions.size()>0){
                    for(Map<String,Object> question:questions){
                        map=new HashMap<String, Object>();
                        map.put("Q_questionId_EQ",question.get("id"));
                        List<Map<String,Object>> answers=answerManager.listMap(map);
                        if(answers!=null && answers.size()>0){
                            for(Map<String,Object> anmap:answers){
                                map=new HashMap<String, Object>();
                                map.put("answerId",anmap.get("id"));
                                Integer anCount=userSurveyManager.findByNamedQueryClass("getAnswerCount",Integer.class,map);
                                anmap.put("answerCount",anCount);
                            }
                        }
                        question.put("answers",answers);
                    }
                }
                survey.put("questions",questions);
                survey.put("surveyCount",surveyCount);

            }



            return new ModelAndView("system/surveyDetail","survey",survey);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
         return new ModelAndView("system/surveyDetail","survey",new HashMap<String,Object>());
    }


}
