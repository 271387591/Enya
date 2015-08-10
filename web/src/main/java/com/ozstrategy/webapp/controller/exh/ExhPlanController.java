package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.model.exh.ExhPlan;
import com.ozstrategy.service.exh.ExhPlanManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhPlanCommand;
import com.ozstrategy.webapp.command.exh.ExhServiceCommand;
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
import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-08-05.
*/
@RestController
@RequestMapping("exhPlan")
public class ExhPlanController extends BaseController {
    @Autowired
    private ExhPlanManager exhPlanManager;
    @RequestMapping("security/index")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("exh/exhplan");
    }
    @RequestMapping("security/add")
    public ModelAndView games(HttpServletRequest request, HttpServletResponse response) {
        ExhPlanCommand command=new ExhPlanCommand();
        return new ModelAndView("exh/addExhplan","command",command);
    }
    @RequestMapping("security/edit/{id}")
    public ModelAndView edit(@PathVariable Long id) {
        ExhPlanCommand command=new ExhPlanCommand();
        try{
            command=new ExhPlanCommand(exhPlanManager.get(id));
        }catch (Exception e){
            logger.error("addAdvert fail",e);
        }
        return new ModelAndView("exh/addExhplan","command",command);
    }
    @RequestMapping("list")
    public JsonReaderResponse<ExhPlanCommand> list(HttpServletRequest request){
        List<ExhPlanCommand> commands=new ArrayList<ExhPlanCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<ExhPlan> models= exhPlanManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(ExhPlan model:models){
                        ExhPlanCommand command=new ExhPlanCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=exhPlanManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<ExhPlanCommand> save(@RequestBody ExhPlanCommand command){
        try{
            Long id=command.getId();
            ExhPlan exhPlan=null;
            if(id==null){
                exhPlan=new ExhPlan();
                exhPlan.setCreateDate(new Date());
            }else{
                exhPlan=exhPlanManager.get(id);
            }
            String description=command.getContent();
            if(isNotEmpty(description)){
                description=description.replaceAll("\r|\n","");
            }
            exhPlan.setTitle(command.getTitle());
            exhPlan.setContent(description);
            exhPlan.setOutUrl(command.getOutUrl());
            exhPlan.setHoldDate(command.getHoldDate());
            exhPlan.setAddress(command.getAddress());
            exhPlanManager.saveOrUpdate(exhPlan);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("security/delete/{id}")
    public JsonReaderSingleResponse<ExhPlanCommand> delete(@PathVariable Long id){
        try{
            ExhPlan exhPlan=exhPlanManager.get(id);
            if(exhPlan!=null){
                exhPlanManager.delete(exhPlan);
            }

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
