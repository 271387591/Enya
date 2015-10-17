package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.model.exh.ExhNews;
import com.ozstrategy.model.exh.ExhPlan;
import com.ozstrategy.model.exh.ExhService;
import com.ozstrategy.service.exh.ExhServiceManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhNewsCommand;
import com.ozstrategy.webapp.command.exh.ExhPlanCommand;
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
import java.util.HashMap;
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
    private final static String imgUrl=System.getProperty("img.url");
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
            command.setImgUrl(imgUrl);
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
                Integer pageIndex=obtainStart(request)/obtainLimit(request)+1;
                int i=1;
            List<ExhService> models= exhServiceManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(ExhService model:models){
                        int index=((pageIndex-1)*obtainLimit(request))+i;
                        ExhServiceCommand command=new ExhServiceCommand(model);
                        command.setIndex(index);
                        commands.add(command);
                        i++;
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
    @RequestMapping("security/publish/{id}")
    public JsonReaderSingleResponse<ExhPlanCommand> pub(@PathVariable Long id){
        try{
            ExhService exhPlan=exhServiceManager.get(id);
            if(exhPlan!=null){
                exhPlan.setPublish(Boolean.TRUE);
                exhPlan.setPubDate(new Date());
                Map<String,Object> map=new HashMap<String, Object>();
                map.put("Q_publish_EQ",1);
                Integer maxidx=exhServiceManager.max("idx",map);
                exhPlan.setIdx(maxidx+inxcount+1);
                exhServiceManager.update(exhPlan);
            }

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"操作失败");
    }
    @RequestMapping("security/nopublish/{id}")
    public JsonReaderSingleResponse<ExhPlanCommand> nopublish(@PathVariable Long id){
        try{
            ExhService exhPlan=exhServiceManager.get(id);
            if(exhPlan!=null){
                exhPlan.setPublish(Boolean.FALSE);
                exhServiceManager.update(exhPlan);
            }

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"操作失败");
    }
    @RequestMapping("security/sort")
    public ModelAndView sort() {
        List<ExhServiceCommand> commands=new ArrayList<ExhServiceCommand>();
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_publish_EQ",1);
        map.put("Q_idx","DESC");
        List<ExhService> models= exhServiceManager.list(map,0,inxcount);
        int i=1;
        if(models!=null && models.size()>0){
            for(ExhService model:models){
                int index=i;
                ExhServiceCommand command=new ExhServiceCommand(model);
                command.setIndex(index);
                commands.add(command);
                i++;
            }
        }
        return new ModelAndView("exh/servicesort","commands",commands);
    }

    @RequestMapping("security/idx")
    public JsonReaderSingleResponse<ExhPlanCommand> idx(@RequestBody List<ExhServiceCommand> commands){
        try{
            List<ExhService> plans=new ArrayList<ExhService>();
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_publish_EQ",1);
            Integer max=exhServiceManager.max("idx",map);
            if(commands!=null && commands.size()>0){
                for(ExhServiceCommand command:commands){
                    ExhService exhPlan=exhServiceManager.get(command.getId());
                    exhPlan.setIdx(max-command.getIndex()+1);
                    plans.add(exhPlan);
                }
            }
            exhServiceManager.idx(plans);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"操作失败");
    }
}
