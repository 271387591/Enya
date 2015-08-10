package com.ozstrategy.webapp.controller.system;

import com.ozstrategy.model.system.UserSurvey;
import com.ozstrategy.service.system.UserSurveyManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.system.UserSurveyCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-07-27.
*/
@RestController
@RequestMapping("userSurvey")
public class UserSurveyController extends BaseController {
    @Autowired
    private UserSurveyManager userSurveyManager;
    @RequestMapping("list")
    public JsonReaderResponse<UserSurveyCommand> list(HttpServletRequest request){
        List<UserSurveyCommand> commands=new ArrayList<UserSurveyCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<UserSurvey> models= userSurveyManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(UserSurvey model:models){
                        UserSurveyCommand command=new UserSurveyCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=userSurveyManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("save")
    public JsonReaderSingleResponse<UserSurveyCommand> save(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("delete")
    public JsonReaderSingleResponse<UserSurveyCommand> delete(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
