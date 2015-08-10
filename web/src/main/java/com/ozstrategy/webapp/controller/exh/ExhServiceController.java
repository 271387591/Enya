package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.model.exh.ExhService;
import com.ozstrategy.service.exh.ExhServiceManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhServiceCommand;
import com.ozstrategy.webapp.command.exh.ExhibitionHallCommand;
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
* Created by lihao1 on 2015-07-27.
*/
@RestController
@RequestMapping("exhService")
public class ExhServiceController extends BaseController {
    @Autowired
    private ExhServiceManager exhServiceManager;
    @RequestMapping("security/index")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("exh/exhservice");
    }
    @RequestMapping("security/add")
    public ModelAndView games(HttpServletRequest request, HttpServletResponse response) {
        ExhServiceCommand command=new ExhServiceCommand();
        return new ModelAndView("exh/addExhservice","command",command);
    }
    @RequestMapping("security/edit/{id}")
    public ModelAndView edit(@PathVariable Long id) {
        ExhServiceCommand command=new ExhServiceCommand();
        try{
            command=new ExhServiceCommand(exhServiceManager.get(id));
        }catch (Exception e){
            logger.error("addAdvert fail",e);
        }
        return new ModelAndView("exh/addExhservice","command",command);
    }

    @RequestMapping("list")
    public JsonReaderResponse<ExhServiceCommand> list(HttpServletRequest request){
        List<ExhServiceCommand> commands=new ArrayList<ExhServiceCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<ExhService> models= exhServiceManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(ExhService model:models){
                        ExhServiceCommand command=new ExhServiceCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=exhServiceManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<ExhServiceCommand> save(@RequestBody ExhServiceCommand command){
        try{
            Long id=command.getId();
            ExhService exhService=null;
            if(id==null){
                exhService=new ExhService();
                exhService.setCreateDate(new Date());
            }else{
                exhService=exhServiceManager.get(id);
            }
            exhService.setContent(command.getContent());
            exhService.setTitle(command.getTitle());
            exhService.setSource(command.getSource());
            exhService.setLastUpdateDate(new Date());
            exhServiceManager.saveOrUpdate(exhService);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("security/delete/{id}")
    public JsonReaderSingleResponse<ExhServiceCommand> delete(@PathVariable Long id,HttpServletRequest request){
        try{
            exhServiceManager.deleteById(id);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
