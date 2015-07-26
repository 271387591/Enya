package com.ozstrategy.webapp.controller.system;

import com.ozstrategy.model.exh.ExhNews;
import com.ozstrategy.model.system.FriendLink;
import com.ozstrategy.service.system.FriendLinkManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhNewsCommand;
import com.ozstrategy.webapp.command.system.FriendLinkCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-07-20.
*/
@RestController
@RequestMapping("friendLink")
public class FriendLinkController extends BaseController {
    @Autowired
    private FriendLinkManager friendLinkManager;
    @RequestMapping("list")
    public JsonReaderResponse<FriendLinkCommand> list(HttpServletRequest request){
        List<FriendLinkCommand> commands=new ArrayList<FriendLinkCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<FriendLink> models= friendLinkManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(FriendLink model:models){
                        FriendLinkCommand command=new FriendLinkCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=friendLinkManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/friendList")
    public ModelAndView userList(HttpServletRequest request) {
        return new ModelAndView("system/flinkList");
    }
    @RequestMapping("security/add")
    public ModelAndView games() {
        return new ModelAndView("system/addFriend","command",new FriendLinkCommand());
    }
    @RequestMapping("security/edit/{id}")
    public ModelAndView editNews(@PathVariable Long id) {
        FriendLink friendLink=friendLinkManager.get(id);
        FriendLinkCommand command=null;
        if(friendLink!=null){
            command=new FriendLinkCommand(friendLink);
        }
        return new ModelAndView("system/addFriend","command",command);
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<FriendLinkCommand> save(@RequestBody FriendLinkCommand command){
        try{
            Long id=command.getId();
            FriendLink friendLink=null;
            if(id==null){
                friendLink=new FriendLink();
            }else{
                friendLink=friendLinkManager.get(id);
            }
            friendLink.setName(command.getName());
            friendLink.setUrl(command.getUrl());
            friendLinkManager.saveOrUpdate(friendLink);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("security/delete/{id}")
    public JsonReaderSingleResponse<FriendLinkCommand> delete(@PathVariable Long id){
        try{
            FriendLink friendLink=friendLinkManager.get(id);
            if(friendLink!=null){
                friendLinkManager.delete(friendLink);
            }
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
