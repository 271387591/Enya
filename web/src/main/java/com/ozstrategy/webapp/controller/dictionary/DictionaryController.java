package com.ozstrategy.webapp.controller.dictionary;

import com.ozstrategy.model.dictionary.Dictionary;
import com.ozstrategy.service.dictionary.DictionaryManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.dictionary.DictionaryCommand;
import com.ozstrategy.webapp.command.user.UserCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
* Created by lihao1 on 2015-07-13.
*/
@RestController
@RequestMapping("dictionary")
public class DictionaryController extends BaseController {
    @Autowired
    private DictionaryManager dictionaryManager;
    @RequestMapping("security/index")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("admin/dictionary/dic");
    }
    @RequestMapping("security/addDic")
    public ModelAndView games(HttpServletRequest request, HttpServletResponse response) {
        DictionaryCommand command=null;
        try{

            String id=request.getParameter("id");
            if(id==null){
                command=new DictionaryCommand();
            }else{
                command=new DictionaryCommand(dictionaryManager.get(parseLong(id)));
            }
        }catch (Exception e){
            logger.error("addAdvert fail",e);
        }
        return new ModelAndView("admin/dictionary/addDic","command",command);
    }
    @RequestMapping("security/dicList")
    public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) {

        return new ModelAndView("admin/dictionary/dicList");
    }
    @RequestMapping("security/list")
    public JsonReaderResponse<DictionaryCommand> list(HttpServletRequest request){
        List<DictionaryCommand> commands=new ArrayList<DictionaryCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<Dictionary> models= dictionaryManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(Dictionary model:models){
                        DictionaryCommand command=new DictionaryCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=dictionaryManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<DictionaryCommand> save(@RequestBody DictionaryCommand command){
        try{
            Dictionary dictionary=null;
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_type_EQ",command.getType());
            map.put("Q_keyValue_EQ",command.getKeyValue());

            if(command.getId()==null){
                dictionary=dictionaryManager.getByParam(map);
                if(dictionary!=null){
                    return new JsonReaderSingleResponse(null,false,"该值已存在");
                }
                dictionary=new Dictionary();
                dictionary.setCreateDate(new Date());
            }else{
                dictionary=dictionaryManager.get(command.getId());
                Dictionary dictionary1=dictionaryManager.getByParam(map);
                if(dictionary1!=null&&dictionary.getId()!=dictionary1.getId()){
                    return new JsonReaderSingleResponse(null,false,"该值已存在");
                }
            }
            dictionary.setType(command.getType());
            dictionary.setKeyValue(command.getKeyValue());
            dictionaryManager.saveOrUpdate(dictionary);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("security/delete/{id}")
    public JsonReaderSingleResponse<DictionaryCommand> delete(@PathVariable Long id){
        try{
            dictionaryManager.deleteById(id);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
