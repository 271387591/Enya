package com.ozstrategy.webapp.controller.system;

import com.ozstrategy.model.system.Advert;
import com.ozstrategy.service.system.AdvertManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.system.AdvertCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-07-20.
*/
@RestController
@RequestMapping("advert")
public class AdvertController extends BaseController {
    @Autowired
    private AdvertManager advertManager;
    @RequestMapping("list")
    public JsonReaderResponse<AdvertCommand> list(HttpServletRequest request){
        List<AdvertCommand> commands=new ArrayList<AdvertCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<Advert> models= advertManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(Advert model:models){
                        AdvertCommand command=new AdvertCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=advertManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("save")
    public JsonReaderSingleResponse<AdvertCommand> save(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("delete")
    public JsonReaderSingleResponse<AdvertCommand> delete(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
