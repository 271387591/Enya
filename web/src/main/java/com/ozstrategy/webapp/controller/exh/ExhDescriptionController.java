package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.model.exh.ExhDescription;
import com.ozstrategy.model.exh.ExhTravel;
import com.ozstrategy.service.exh.ExhDescriptionManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhDescriptionCommand;
import com.ozstrategy.webapp.command.exh.ExhTravelCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-07-16.
*/
@RestController
@RequestMapping("exhDescription")
public class ExhDescriptionController extends BaseController {
    @Autowired
    private ExhDescriptionManager exhDescriptionManager;
    @RequestMapping("list")
    public JsonReaderResponse<ExhDescriptionCommand> list(HttpServletRequest request){
        List<ExhDescriptionCommand> commands=new ArrayList<ExhDescriptionCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<ExhDescription> models= exhDescriptionManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(ExhDescription model:models){
                        ExhDescriptionCommand command=new ExhDescriptionCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=exhDescriptionManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<ExhDescriptionCommand> save(@RequestBody ExhDescriptionCommand command){
        try{
            Long exhId=command.getExhId();
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);

            ExhDescription exhDescription=exhDescriptionManager.getByParam(map);
            if(exhDescription==null){
                exhDescription=new ExhDescription();
            }
            String description=command.getDescription();
            if(isNotEmpty(description)){
                description=description.replaceAll("\r|\n","");
            }
            exhDescription.setDescription(description);
            exhDescription.setExhId(command.getExhId());
            exhDescriptionManager.saveOrUpdate(exhDescription);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("delete")
    public JsonReaderSingleResponse<ExhDescriptionCommand> delete(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
    @RequestMapping("getExhDescription/{exhId}")
    public JsonReaderSingleResponse<ExhDescriptionCommand> getExhDescription(@PathVariable Long exhId){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);
            ExhDescription exhGuide=exhDescriptionManager.getByParam(map);
            if(exhGuide!=null){
                return new JsonReaderSingleResponse<ExhDescriptionCommand>(new ExhDescriptionCommand(exhGuide),true);
            }
            return new JsonReaderSingleResponse(null,true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"获取失败");
    }
}
