package com.ozstrategy.webapp.controller.system;

import com.ozstrategy.model.system.Answer;
import com.ozstrategy.model.system.Question;
import com.ozstrategy.service.system.AnswerManager;
import com.ozstrategy.service.system.QuestionManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.system.AnswerCommand;
import com.ozstrategy.webapp.command.system.QuestionCommand;
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
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
* Created by lihao1 on 2015-07-27.
*/
@RestController
@RequestMapping("question")
public class QuestionController extends BaseController {
    @Autowired
    private QuestionManager questionManager;
    @Autowired
    private AnswerManager answerManager;

    @RequestMapping("security/questionList/{surveyId}")
    public ModelAndView games(@PathVariable Long surveyId) {
        QuestionCommand command=new QuestionCommand();
        command.setSurveyId(surveyId);
        return new ModelAndView("system/questionList","question",command);
    }
    @RequestMapping("security/add/{surveyId}")
    public ModelAndView games(@PathVariable Long surveyId,HttpServletRequest request, HttpServletResponse response) {
        QuestionCommand command=new QuestionCommand();
        command.setSurveyId(surveyId);
        return new ModelAndView("system/addQuestion","command",command);
    }
    @RequestMapping("security/edit/{surveyId}/{id}")
    public ModelAndView edit(@PathVariable Long surveyId,@PathVariable Long id) {
        QuestionCommand command=new QuestionCommand();
        try{
            command=new QuestionCommand(questionManager.get(id));
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_questionId_EQ",id);
            List<Answer> answers=answerManager.listAll(map);
            if(answers!=null && answers.size()>0){
                for(Answer answer:answers){
                    command.getAnswers().add(new AnswerCommand(answer));
                }
            }
        }catch (Exception e){
            logger.error("addAdvert fail",e);
        }
        return new ModelAndView("system/addQuestion","command",command);
    }


    @RequestMapping("security/list")
    public JsonReaderResponse<QuestionCommand> list(HttpServletRequest request){
        List<QuestionCommand> commands=new ArrayList<QuestionCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<Question> models= questionManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(Question model:models){
                        QuestionCommand command=new QuestionCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=questionManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<QuestionCommand> save(@RequestBody QuestionCommand command){
        try{
            Long id=command.getId();
            Question question=null;
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_question_EQ",command.getQuestion());
            map.put("Q_surveyId_EQ",command.getSurveyId());
            if(id==null){
                Question exq=questionManager.getByParam(map);
                if(exq!=null){
                    return new JsonReaderSingleResponse(null,false,"该问题已存在");
                }
                question=new Question();
                question.setCreateDate(new Date());
            }else{
                question=questionManager.get(id);
                Question exq=questionManager.getByParam(map);
                if(exq!=null && exq.getId()!=question.getId()){
                    return new JsonReaderSingleResponse(null,false,"该问题已存在");
                }
            }
            question.setSurveyId(command.getSurveyId());
            question.setQuestion(command.getQuestion());
            question.setType(command.getType());
            List<AnswerCommand> answerCommands=command.getAnswers();
            Set<Answer> answers=new HashSet<Answer>();
            if(answerCommands!=null){
                for(AnswerCommand answerCommand:answerCommands){
                    Answer answer=new Answer();
                    answer.setSurveyId(command.getSurveyId());
                    answer.setAnswer(answerCommand.getAnswer());
                    answer.setCreateDate(new Date());
                    answers.add(answer);
                }
            }
            questionManager.saveQuestion(question,answers);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("security/delete/{id}")
    public JsonReaderSingleResponse delete(@PathVariable Long id){
        try{
            Question question=questionManager.get(id);
            if(question!=null){
                questionManager.deleteQuestion(question);
            }
            return new JsonReaderSingleResponse(question,true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
