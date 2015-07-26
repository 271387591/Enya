package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.model.exh.ExhGuideTo;
import com.ozstrategy.model.exh.ExhSponsor;
import com.ozstrategy.model.exh.ExhTravel;
import com.ozstrategy.service.exh.ExhTravelManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhGuideToCommand;
import com.ozstrategy.webapp.command.exh.ExhSponsorCommand;
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
@RequestMapping("exhTravel")
public class ExhTravelController extends BaseController {
    @Autowired
    private ExhTravelManager exhTravelManager;
    @RequestMapping("list")
    public JsonReaderResponse<ExhTravelCommand> list(HttpServletRequest request){
        List<ExhTravelCommand> commands=new ArrayList<ExhTravelCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<ExhTravel> models= exhTravelManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(ExhTravel model:models){
                        ExhTravelCommand command=new ExhTravelCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=exhTravelManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<ExhTravelCommand> save(@RequestBody ExhTravelCommand command){
        try{
            Long exhId=command.getExhId();
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);

            ExhTravel exhDescription=exhTravelManager.getByParam(map);
            if(exhDescription==null){
                exhDescription=new ExhTravel();
            }
            String description=command.getTravel();
            if(isNotEmpty(description)){
                description=description.replaceAll("\r|\n","");
            }
            exhDescription.setTravel(description);
            exhDescription.setExhId(command.getExhId());
            exhTravelManager.saveOrUpdate(exhDescription);

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("delete")
    public JsonReaderSingleResponse<ExhTravelCommand> delete(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
    @RequestMapping("getExhTravel/{exhId}")
    public JsonReaderSingleResponse<ExhTravelCommand> getExhTravel(@PathVariable Long exhId){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);
            ExhTravel exhGuide=exhTravelManager.getByParam(map);
            if(exhGuide!=null){
                return new JsonReaderSingleResponse<ExhTravelCommand>(new ExhTravelCommand(exhGuide),true);
            }
            return new JsonReaderSingleResponse(null,true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"获取失败");
    }
}
