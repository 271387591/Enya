package com.ozstrategy.webapp.controller.user;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ozstrategy.Constants;
import com.ozstrategy.model.user.Role;
import com.ozstrategy.model.user.User;
import com.ozstrategy.service.user.RoleManager;
import com.ozstrategy.service.user.UserManager;
import com.ozstrategy.util.Base64Utils;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.user.RoleCommand;
import com.ozstrategy.webapp.command.user.UserCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
* Created by lihao1 on 2015-06-08.
*/
@RestController
@RequestMapping("user")
public class UserController extends BaseController {
    @Autowired
    private UserManager userManager;
    @Autowired
    private RoleManager roleManager;

    @RequestMapping("security/index")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("user/user");
    }
    @RequestMapping("security/list")
    public JsonReaderResponse<UserCommand> list(HttpServletRequest request){
        List<UserCommand> commands=new ArrayList<UserCommand>();
        Map<String,Object> map=requestMap(request);
        map.put("Q_enabled_EQ",Boolean.TRUE);
        map.put("Q_username_NEQ","admin");
        try{
            List<User> models= userManager.list(map,obtainStart(request),obtainLimit(request));
            if(models!=null && models.size()>0){
                for(User model:models){
                    UserCommand command=new UserCommand(model);
                    Map<String,Object> roleMap=new HashMap<String, Object>();
                    roleMap.put("userId",model.getId());
                    List<Role> roles=userManager.findByNamedQuery("getRoles",Role.class,roleMap);
                    List<RoleCommand> roleCommands=new ArrayList<RoleCommand>();
                    if(roles!=null && roles.size()>0){
                        for(Role role:roles){
                            roleCommands.add(new RoleCommand(role));
                        }
                    }
                    command.getRoles().clear();
                    command.getRoles().addAll(roleCommands);
                    commands.add(command);
                }
            }
            Integer count=userManager.count(map);
            return new JsonReaderResponse(commands,true,count,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/addUser")
    public ModelAndView games(HttpServletRequest request, HttpServletResponse response) {
        UserCommand command=null;
        try{

            String id=request.getParameter("id");
            if(id==null){
                command=new UserCommand();
            }else{
                command=new UserCommand(userManager.get(parseLong(id)));
            }
        }catch (Exception e){
            logger.error("addAdvert fail",e);
        }
        return new ModelAndView("user/addUser","command",command);
    }
    @RequestMapping("security/userList")
    public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) {

        return new ModelAndView("user/userList");
    }


    @RequestMapping("security/save")
    public JsonReaderSingleResponse<UserCommand> save(@RequestBody UserCommand userCommand){
        try{
            User user=null;

            if(userCommand.getId()==null){
                Map<String,Object> map=new HashMap<String, Object>();
                map.put("Q_email_EQ",userCommand.getEmail());
                user=userManager.getByParam(map);
                if(user!=null){
                    return new JsonReaderSingleResponse(null,false,"该用户已存在");
                }
                user=new User();
                user.setCreateDate(new Date());
                user.setPassword(userCommand.getPassword());
            }else{
                user=userManager.get(userCommand.getId());
            }
            user.setLastUpdateDate(new Date());
            user.setMobile(userCommand.getMobile());
            user.setNickName(userCommand.getNickName());
            user.setUsername(userCommand.getEmail());
            user.setRoleId(userCommand.getRoleId());
            user.setEmail(userCommand.getEmail());
            List<RoleCommand> roleCommands=userCommand.getRoles();
            Set<Role> roles=new HashSet<Role>();
            if(roleCommands!=null && roleCommands.size()>0){
                for(RoleCommand roleCommand:roleCommands){
                    Role role=roleManager.get(roleCommand.getId());
                    if(role!=null){
                        roles.add(role);
                    }
                }
            }
            user.getRoles().clear();
            user.getRoles().addAll(roles);
            userManager.saveUser(user);

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("security/delete")
    public JsonReaderSingleResponse<UserCommand> delete(HttpServletRequest request){
        try{
            String ids=request.getParameter("ids");
            List<User> commentses=new ArrayList<User>();
            if(StringUtils.isNotEmpty(ids)){
                String[] ida=ids.split(",");
                for(String id:ida){
                    User comments=userManager.get(parseLong(id));
                    commentses.add(comments);
                }
            }
            userManager.batchDeleteUser(commentses);
            return new JsonReaderSingleResponse("",Boolean.TRUE);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
    @RequestMapping("security/changeAdminPwd")
    public JsonReaderSingleResponse<UserCommand> changeAdminPwd(HttpServletRequest request){
        try{
            String username=request.getRemoteUser();
            User user=userManager.getUserByUsername(username);
            String password=obtain(request,"password");
            userManager.changePassword(user, password, null, true);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"修改失败");
    }
    @RequestMapping("security/changeUserPwd")
    public JsonReaderSingleResponse<UserCommand> changeUserPwd(@RequestBody UserCommand userCommand){
        try{
            User user=userManager.get(userCommand.getId());
            userManager.changePassword(user, userCommand.getPassword(), null, true);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"修改失败");
    }
    @RequestMapping("security/changeUserMobile")
    public JsonReaderSingleResponse<UserCommand> changeUserMobile(@RequestBody UserCommand userCommand){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_mobile_EQ",userCommand.getMobile());
            User oldUser=userManager.getByParam(map);
            if(oldUser!=null){
                return new JsonReaderSingleResponse(null,false,"手机号已存在");
            }
            User user=userManager.get(userCommand.getId());
            user.setLastUpdateDate(new Date());
            user.setMobile(userCommand.getMobile());
            userManager.update(user);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"修改失败");
    }

    @RequestMapping("getBackPwd")
    public JsonReaderSingleResponse<UserCommand> getBackPwd(HttpServletRequest request){
        try{
            String mobile=obtain(request,"mobile");
            String password=obtain(request,"password");
            String validateCode=obtain(request,"validateCode");
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_mobile_EQ",mobile);
            map.put("Q_loseDate_GE",new Date());

            User user=userManager.getUserByUsername(mobile);
            userManager.changePassword(user, password, null, true);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("getBackPwd fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"参数错误");
    }


}
