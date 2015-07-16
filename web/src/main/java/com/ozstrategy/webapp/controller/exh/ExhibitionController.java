package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.model.exh.Exhibition;
import com.ozstrategy.service.exh.ExhibitionManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhibitionCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-07-13.
*/
@RestController
@RequestMapping("exhibition")
public class ExhibitionController extends BaseController {
    @Autowired
    private ExhibitionManager exhibitionManager;
    @RequestMapping("list")
    public JsonReaderResponse<ExhibitionCommand> list(HttpServletRequest request){
        List<ExhibitionCommand> commands=new ArrayList<ExhibitionCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<Exhibition> models= exhibitionManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(Exhibition model:models){
                        ExhibitionCommand command=new ExhibitionCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=exhibitionManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("save")
    public JsonReaderSingleResponse<ExhibitionCommand> save(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("delete")
    public JsonReaderSingleResponse<ExhibitionCommand> delete(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
