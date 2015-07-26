package com.ozstrategy.webapp.controller.system;

import com.ozstrategy.model.system.EmailConfig;
import com.ozstrategy.service.system.EmailConfigManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.system.EmailConfigCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-07-25.
*/
@RestController
@RequestMapping("emailConfig")
public class EmailConfigController extends BaseController {
    @Autowired
    private EmailConfigManager emailConfigManager;
    @RequestMapping("list")
    public JsonReaderResponse<EmailConfigCommand> list(HttpServletRequest request){
        List<EmailConfigCommand> commands=new ArrayList<EmailConfigCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<EmailConfig> models= emailConfigManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(EmailConfig model:models){
                        EmailConfigCommand command=new EmailConfigCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=emailConfigManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/getemail")
    public ModelAndView getemail(HttpServletRequest request){
        EmailConfigCommand command=new EmailConfigCommand();
        try{
            List<EmailConfig> models= emailConfigManager.list(new HashMap<String, Object>(),0,1);
            if(models!=null && models.size()>0){
                command=new EmailConfigCommand(models.get(0));
            }
            return new ModelAndView("system/addEmail","command",command);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new ModelAndView("system/addEmail","command",command);
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<EmailConfigCommand> save(@RequestBody EmailConfigCommand configCommand){
        try{
            Long id=configCommand.getId();
            EmailConfig emailConfig=null;
            if(id==null){
                emailConfig=new EmailConfig();
            }else{
                emailConfig=emailConfigManager.get(id);
            }
            emailConfig.setEmail(configCommand.getEmail());
            emailConfig.setPassword(configCommand.getPassword());
            emailConfig.setPort(configCommand.getPort());
            emailConfig.setSmtp(configCommand.getSmtp());
            emailConfigManager.saveOrUpdate(emailConfig);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
