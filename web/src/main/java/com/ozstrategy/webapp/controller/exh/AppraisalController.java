package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.model.exh.Appraisal;
import com.ozstrategy.service.exh.AppraisalManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.AppraisalCommand;
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
* Created by lihao1 on 2015-08-13.
*/
@RestController
@RequestMapping("appraisal")
public class AppraisalController extends BaseController {
    @Autowired
    private AppraisalManager appraisalManager;
    @RequestMapping("security/index")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("exh/appraisal");
    }
    @RequestMapping("security/add")
    public ModelAndView games(HttpServletRequest request, HttpServletResponse response) {
        AppraisalCommand command=new AppraisalCommand();
        return new ModelAndView("exh/addAppraisal","command",command);
    }
    @RequestMapping("security/edit/{id}")
    public ModelAndView edit(@PathVariable Long id) {
        AppraisalCommand command=new AppraisalCommand();
        try{
            command=new AppraisalCommand(appraisalManager.get(id));
        }catch (Exception e){
            logger.error("addAdvert fail",e);
        }
        return new ModelAndView("exh/addAppraisal","command",command);
    }
    @RequestMapping("list")
    public JsonReaderResponse<AppraisalCommand> list(HttpServletRequest request){
        List<AppraisalCommand> commands=new ArrayList<AppraisalCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<Appraisal> models= appraisalManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(Appraisal model:models){
                        AppraisalCommand command=new AppraisalCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=appraisalManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<AppraisalCommand> save(@RequestBody AppraisalCommand command){
        try{
            Long id=command.getId();
            Appraisal appraisal=null;
            if(id==null){
                appraisal=new Appraisal();
                appraisal.setCreateDate(new Date());
            }else{
                appraisal=appraisalManager.get(id);
            }
            appraisal.setContent(command.getContent());
            appraisal.setTitle(command.getTitle());
            appraisalManager.saveOrUpdate(appraisal);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("security/delete/{id}")
    public JsonReaderSingleResponse<AppraisalCommand> delete(@PathVariable Long id){
        try{
            appraisalManager.deleteById(id);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
