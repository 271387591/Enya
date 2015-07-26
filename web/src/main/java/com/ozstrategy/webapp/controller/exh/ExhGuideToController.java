package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.model.exh.ExhGuide;
import com.ozstrategy.model.exh.ExhGuideTo;
import com.ozstrategy.service.exh.ExhGuideToManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhGuideCommand;
import com.ozstrategy.webapp.command.exh.ExhGuideToCommand;
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
@RequestMapping("exhGuideTo")
public class ExhGuideToController extends BaseController {
    @Autowired
    private ExhGuideToManager exhGuideToManager;
    @RequestMapping("list")
    public JsonReaderResponse<ExhGuideToCommand> list(HttpServletRequest request){
        List<ExhGuideToCommand> commands=new ArrayList<ExhGuideToCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<ExhGuideTo> models= exhGuideToManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(ExhGuideTo model:models){
                        ExhGuideToCommand command=new ExhGuideToCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=exhGuideToManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<ExhGuideToCommand> save(@RequestBody ExhGuideToCommand command){
        try{
            Long exhId=command.getExhId();
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);

            ExhGuideTo exhDescription=exhGuideToManager.getByParam(map);
            if(exhDescription==null){
                exhDescription=new ExhGuideTo();
            }
            String description=command.getGuideTo();
            if(isNotEmpty(description)){
                description=description.replaceAll("\r|\n","");
            }

            exhDescription.setGuideTo(description);
            exhDescription.setExhId(command.getExhId());
            exhGuideToManager.saveOrUpdate(exhDescription);

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("delete")
    public JsonReaderSingleResponse<ExhGuideToCommand> delete(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
    @RequestMapping("getExhGuideTo/{exhId}")
    public JsonReaderSingleResponse<ExhGuideToCommand> getExhGuideTo(@PathVariable Long exhId){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);
            ExhGuideTo exhGuide=exhGuideToManager.getByParam(map);
            if(exhGuide!=null){
                return new JsonReaderSingleResponse<ExhGuideToCommand>(new ExhGuideToCommand(exhGuide),true);
            }
            return new JsonReaderSingleResponse(null,true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"获取失败");
    }
}
