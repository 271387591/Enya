package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.model.exh.ExhGuideTo;
import com.ozstrategy.model.exh.ExhSponsor;
import com.ozstrategy.model.exh.ExhTravel;
import com.ozstrategy.service.exh.ExhSponsorManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
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
@RequestMapping("exhSponsor")
public class ExhSponsorController extends BaseController {
    @Autowired
    private ExhSponsorManager exhSponsorManager;
    @RequestMapping("list")
    public JsonReaderResponse<ExhSponsorCommand> list(HttpServletRequest request){
        List<ExhSponsorCommand> commands=new ArrayList<ExhSponsorCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<ExhSponsor> models= exhSponsorManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(ExhSponsor model:models){
                        ExhSponsorCommand command=new ExhSponsorCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=exhSponsorManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<ExhSponsorCommand> save(@RequestBody ExhSponsorCommand command){
        try{
            Long exhId=command.getExhId();
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);

            ExhSponsor exhDescription=exhSponsorManager.getByParam(map);
            if(exhDescription==null){
                exhDescription=new ExhSponsor();
            }
            String description=command.getSponsor();
            if(isNotEmpty(description)){
                description=description.replaceAll("\r|\n","");
            }

            exhDescription.setSponsor(description);
            exhDescription.setExhId(command.getExhId());
            exhSponsorManager.saveOrUpdate(exhDescription);

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("delete")
    public JsonReaderSingleResponse<ExhSponsorCommand> delete(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
    @RequestMapping("getExhSponsor/{exhId}")
    public JsonReaderSingleResponse<ExhSponsorCommand> getExhSponsor(@PathVariable Long exhId){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);
            ExhSponsor exhGuide=exhSponsorManager.getByParam(map);
            if(exhGuide!=null){
                return new JsonReaderSingleResponse<ExhSponsorCommand>(new ExhSponsorCommand(exhGuide),true);
            }
            return new JsonReaderSingleResponse(null,true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"获取失败");
    }
}
