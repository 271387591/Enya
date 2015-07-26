package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.model.exh.ExhDescription;
import com.ozstrategy.model.exh.ExhGuide;
import com.ozstrategy.service.exh.ExhGuideManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhDescriptionCommand;
import com.ozstrategy.webapp.command.exh.ExhGuideCommand;
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
@RequestMapping("exhGuide")
public class ExhGuideController extends BaseController {
    @Autowired
    private ExhGuideManager exhGuideManager;
    @RequestMapping("list")
    public JsonReaderResponse<ExhGuideCommand> list(HttpServletRequest request){
        List<ExhGuideCommand> commands=new ArrayList<ExhGuideCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<ExhGuide> models= exhGuideManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(ExhGuide model:models){
                        ExhGuideCommand command=new ExhGuideCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=exhGuideManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }

    @RequestMapping("security/save")
    public JsonReaderSingleResponse<ExhGuideCommand> save(@RequestBody ExhGuideCommand command){
        try{
            Long exhId=command.getExhId();
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);

            ExhGuide exhDescription=exhGuideManager.getByParam(map);
            if(exhDescription==null){
                exhDescription=new ExhGuide();
            }
            String description=command.getGuide();
            if(isNotEmpty(description)){
                description=description.replaceAll("\r|\n","");
            }

            exhDescription.setGuide(description);
            exhDescription.setExhId(command.getExhId());
            exhGuideManager.saveOrUpdate(exhDescription);

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("delete")
    public JsonReaderSingleResponse<ExhGuideCommand> delete(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
    @RequestMapping("getExhGuide/{exhId}")
    public JsonReaderSingleResponse<ExhGuideCommand> getExhGuide(@PathVariable Long exhId){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);
            ExhGuide exhGuide=exhGuideManager.getByParam(map);
            if(exhGuide!=null){
                return new JsonReaderSingleResponse<ExhGuideCommand>(new ExhGuideCommand(exhGuide),true);
            }
            return new JsonReaderSingleResponse(null,true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"获取失败");
    }

}
