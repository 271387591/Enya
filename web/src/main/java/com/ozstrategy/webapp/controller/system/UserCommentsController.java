package com.ozstrategy.webapp.controller.system;

import com.ozstrategy.model.system.HomePage;
import com.ozstrategy.model.system.UserComments;
import com.ozstrategy.service.system.UserCommentsManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.system.HomePageCommand;
import com.ozstrategy.webapp.command.system.UserCommentsCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-07-27.
*/
@RestController
@RequestMapping("userComments")
public class UserCommentsController extends BaseController {
    @Autowired
    private UserCommentsManager userCommentsManager;
    @RequestMapping("security/index")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("system/usercomment");
    }
    @RequestMapping("security/commentList")
    public ModelAndView coList(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("system/userCommentList");
    }
    @RequestMapping("security/list")
    public JsonReaderResponse<UserCommentsCommand> list(HttpServletRequest request){
        List<Map<String,Object>> commands=new ArrayList<Map<String, Object>>();
            Map<String,Object> map=requestMap(request);
            try{
                commands=userCommentsManager.findByNamedQuery("getComments",map,obtainStart(request),obtainLimit(request));
                Integer count=userCommentsManager.findByNamedQueryClass("getCommentsCount", Integer.class, map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("save")
    public JsonReaderSingleResponse<UserCommentsCommand> save(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("security/delete/{id}")
    public JsonReaderSingleResponse<UserCommentsCommand> delete(@PathVariable Long id,HttpServletRequest request){
        try{
            userCommentsManager.deleteById(id);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
    @RequestMapping("security/getcom/{id}")
    public ModelAndView get(@PathVariable Long id,HttpServletRequest request){
        try{
            Map<String,Object> params=new HashMap<String, Object>();
            params.put("id",id);
            Map<String,Object> map=userCommentsManager.findByNamedQueryMap("getComment",params);
            return new ModelAndView("system/commentDetail","command",map);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new ModelAndView("system/commentDetail","command",new HashMap());
    }

}
