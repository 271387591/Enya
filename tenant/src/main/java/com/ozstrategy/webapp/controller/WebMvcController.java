package com.ozstrategy.webapp.controller;

import com.ozstrategy.Constants;
import com.ozstrategy.model.commend.CommendType;
import com.ozstrategy.model.commend.Comment;
import com.ozstrategy.model.exh.Appraisal;
import com.ozstrategy.model.exh.ExhNews;
import com.ozstrategy.model.exh.ExhPlan;
import com.ozstrategy.model.exh.ExhService;
import com.ozstrategy.model.exh.Exhibition;
import com.ozstrategy.model.exh.ExhibitionHall;
import com.ozstrategy.model.system.Answer;
import com.ozstrategy.model.system.EmailConfig;
import com.ozstrategy.model.system.Question;
import com.ozstrategy.model.system.Survey;
import com.ozstrategy.model.system.UserComments;
import com.ozstrategy.model.system.UserSurvey;
import com.ozstrategy.model.user.Role;
import com.ozstrategy.model.user.User;
import com.ozstrategy.service.EmailEngine;
import com.ozstrategy.service.commend.CommentManager;
import com.ozstrategy.service.exh.AppraisalManager;
import com.ozstrategy.service.exh.ExhNewsManager;
import com.ozstrategy.service.exh.ExhPlanManager;
import com.ozstrategy.service.exh.ExhServiceManager;
import com.ozstrategy.service.exh.ExhibitionHallManager;
import com.ozstrategy.service.exh.ExhibitionManager;
import com.ozstrategy.service.system.AnswerManager;
import com.ozstrategy.service.system.EmailConfigManager;
import com.ozstrategy.service.system.HomePageManager;
import com.ozstrategy.service.system.QuestionManager;
import com.ozstrategy.service.system.SurveyManager;
import com.ozstrategy.service.system.UserCommentsManager;
import com.ozstrategy.service.system.UserSurveyManager;
import com.ozstrategy.service.user.RoleManager;
import com.ozstrategy.service.user.UserManager;
import com.ozstrategy.util.Base64Utils;
import com.ozstrategy.util.ThreeDESUtils;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhNewsCommand;
import com.ozstrategy.webapp.command.exh.UserSurveyCommand;
import com.ozstrategy.webapp.command.user.UserCommand;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.web.bind.annotation.PathVariable;
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
import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@RestController
@RequestMapping("web")
public class WebMvcController extends BaseController implements InitializingBean {

    private final transient Log log = LogFactory.getLog(this.getClass());

    public void afterPropertiesSet() throws Exception {
    }
    @Autowired
    private HomePageManager homePageManager;
    @Autowired
    private ExhibitionManager exhibitionManager;
    @Autowired
    private ExhNewsManager exhNewsManager;
    @Autowired
    private CommentManager commentManager;
    @Autowired
    private ExhibitionHallManager exhibitionHallManager;
    @Autowired
    private UserManager userManager;
    @Autowired
    private RoleManager roleManager;
    @Autowired
    protected AuthenticationManager authenticationManager;
    @Autowired
    protected EmailConfigManager emailConfigManager;
    @Autowired
    protected EmailEngine emailEngine;
    @Autowired
    protected Properties emailProp;
    @Autowired
    protected UserCommentsManager userCommentsManager;
    @Autowired
    protected ExhServiceManager exhServiceManager;
    @Autowired
    protected SurveyManager surveyManager;
    @Autowired
    protected QuestionManager questionManager;
    @Autowired
    protected AnswerManager answerManager;
    @Autowired
    protected UserSurveyManager userSurveyManager;
    @Autowired
    protected ExhPlanManager exhPlanManager;
    @Autowired
    protected AppraisalManager appraisalManager;











    @RequestMapping("login")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("login");
    }
    @RequestMapping("logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("logout");
    }
    @RequestMapping("register")
    public ModelAndView register(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("register");
    }
    @RequestMapping("editUser")
    public ModelAndView editUser(HttpServletRequest request, HttpServletResponse response) {
        String username=request.getRemoteUser();
        User user=userManager.getUserByUsername(username);
        UserCommand userCommand=new UserCommand(user);
        userCommand.setEnEmail(Base64Utils.encode(ThreeDESUtils.encrypt(user.getEmail().getBytes())));
        return new ModelAndView("updateUser","user",userCommand);
    }

    @RequestMapping("registerUser")
    public ModelAndView registerUser(HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> map=new HashMap<String, Object>();
        String email        = request.getParameter("email");
        String password = request.getParameter("password");
        String nickName = request.getParameter("nickName");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        String birth = request.getParameter("birth");
        String id = request.getParameter("id");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
        } catch (IOException e) { }

        if (writer == null) {
            return null;
        }
        User advert=null;
        if(StringUtils.isEmpty(id)){
            advert=userManager.getUserByUsername(email);
            if(advert!=null){
                String msg = "该邮箱已注册";
                writer.print("{\"success\":false,\"msg\":\"" + msg + "!\"}");
                return null;
            }
            advert=new User();
            advert.setCreateDate(new Date());
        }else{
            advert=userManager.get(parseLong(id));
            User hall=userManager.getUserByUsername(email);
            if(hall!=null && hall.getId()!=advert.getId()) {
                String msg = "该邮箱已注册";
                writer.print("{\"success\":false,\"msg\":\"" + msg + "!\"}");
                return null;
            }
        }
        if(isNotEmpty(email)){
            advert.setUsername(email);
            advert.setEmail(email);
        }
        if(isNotEmpty(password)){
            advert.setPassword(password);
        }
        advert.setNickName(nickName);
        advert.setMobile(mobile);
        if(isNotEmpty(gender)){
            advert.setGender(gender);
        }
        if(isNotEmpty(birth)){
            advert.setBirth(parseDate(birth));
        }
        if(isNotEmpty(address)){
            advert.setAddress(address);
        }


        Map<String,Object> roleMap=new HashMap<String, Object>();
        roleMap.put("Q_name_EQ","ROLE_USER");
        Role role=roleManager.getByParam(roleMap);
        if(role!=null){
            advert.getRoles().clear();
            advert.getRoles().add(role);
            advert.setRoleId(role.getId());
        }

        String attachDir = randomAbsolutePath(request, Constants.updloadPortrait);
        File fileOnServer = null;
        String logo1Name=null,logo1Url=null,logo1Path=null;
        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            Iterator list             = multipartRequest.getFileNames();
            while (list.hasNext()) {
                String               controlName = list.next().toString();
                MultipartFile file        = multipartRequest.getFile(controlName);
                CommonsMultipartFile cmf         = (CommonsMultipartFile) file;
                DiskFileItem fileItem    = (DiskFileItem) cmf.getFileItem();

                logo1Name    = fileItem.getName();
                if(isEmpty(logo1Name)){
                    continue;
                }
                String str         = randomName(logo1Name);
                fileOnServer      = new File(attachDir,str);
                logo1Path=fileOnServer.getAbsolutePath();
                logo1Url=toHttpUrl(request,true)+Constants.updloadPortrait+"/"+str;
                if(fileItem.getSize()>200*1024){
                    String msg = "文件不能超过200K";
                    writer.print("{\"success\":false,\"msg\":\"" + msg + "!\"}");
                    return null;
                }
                fileItem.write(fileOnServer);
            }
            if(StringUtils.isNotEmpty(logo1Name)){
                try{
                    FileUtils.forceDelete(new File(advert.getPortraitPath()));
                }catch (Exception e){
                }
                advert.setPortraitName(logo1Name);
                advert.setPortraitPath(logo1Path);
                advert.setPortraitUrl(logo1Url);
            }

            userManager.saveUser(advert);

        } catch (Exception e) {
            if (fileOnServer != null) {
                try {
                    FileUtils.forceDelete(fileOnServer);
                } catch (IOException e1) { }
            }
            logger.error("upload sensor fail", e);
            String msg = "上传头像失败";
            writer.print("{\"success\":false,\"msg\":\"" + msg + "!\"}");
            return null;
        }
        request.getSession().setAttribute("userinfo",new UserCommand(advert));
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(email, password);
        try{
            token.setDetails(new WebAuthenticationDetails(request));
            Authentication authenticatedUser = authenticationManager.authenticate(token);
            SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
            request.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());
        }
        catch( AuthenticationException e ){
            log.error("Authentication failed: ", e);
        }
        String msg="";
        writer.print("{\"success\":true,\"msg\":\"" + msg + "!\"}");
        return null;
    }


    @RequestMapping("getPwd")
    public ModelAndView getPwd(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("getbackpwd");
    }
    @RequestMapping("submitPwd")
    public JsonReaderSingleResponse submitPwd(HttpServletRequest request, HttpServletResponse response) {
        String email=request.getParameter("email");
        User user=userManager.getUserByUsername(email);
        try{
            if(user==null){
                return new JsonReaderSingleResponse(null,false,"该邮箱并未注册");
            }
            List<EmailConfig> emailConfigs=emailConfigManager.listAll();
            EmailConfig emailConfig=null;
            if(emailConfigs!=null && emailConfigs.size()>0){
                emailConfig=emailConfigs.get(0);
            }
            if(emailConfig!=null){
                String email64= Base64Utils.encode(ThreeDESUtils.encrypt(email.getBytes()));
                String url=toHttpUrl(request,true)+"html/web/pwd/"+email64;
                String content=emailProp.getProperty("content");
                String subject=emailProp.getProperty("subject");
                content= MessageFormat.format(content,url);
                emailEngine.sendSimpleEmail(emailConfig, subject, content, email);
                return new JsonReaderSingleResponse(null,true,"");
            }

        }catch (Exception e){
            logger.error("getPwd",e);
        }
        return new JsonReaderSingleResponse(null,false,"该邮箱并未注册");
    }

    @RequestMapping("pwd/{email}")
    public ModelAndView pwd(@PathVariable String email) {
        Map<String,Object> result=new HashMap<String, Object>();
        try{
            String email64= new String(ThreeDESUtils.decrypt(Base64Utils.decode(email)));
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_email_EQ",email64);
            User user=userManager.getByParam(map);
            if(user==null){
                result.put("success",false);
                result.put("message","改邮箱并未注册");
                return null;
            }
            UserCommand userCommand=new UserCommand(user);
            userCommand.setEmail(email);

            return new ModelAndView("changepwd","user",userCommand);
        }catch (Exception e){
        }
        return null;
    }
    @RequestMapping("updatePwd/{email}")
    public JsonReaderSingleResponse updatePwd(@PathVariable String email,HttpServletRequest request) {
        try{
            String email64= new String(ThreeDESUtils.decrypt(Base64Utils.decode(email)));
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_email_EQ",email64);
            User user=userManager.getByParam(map);
            if(user==null){
                return new JsonReaderSingleResponse(null,false,"改邮箱并未注册");
            }
            String password=request.getParameter("password");
            user.setPassword(password);
            userManager.changePassword(user, password, null, true);
            return new JsonReaderSingleResponse(null,true,"");
        }catch (Exception e){
            logger.error("updatePwd error",e);
        }
        return new JsonReaderSingleResponse(null,false,"修改密码失败");
    }


    @RequestMapping("home")
    public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> command=homePageManager.homePage();
        request.getSession().setAttribute("homeCommand",command);
        return new ModelAndView("index");
    }


    @RequestMapping("advertHall")
    public JsonReaderResponse header(HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> map=requestMap(request);
        try{
            map.put("Q_t.updateDate","DESC");
            map.put("Q_t.hot_EQ","1");
            List<Map<String,Object>> models= exhibitionHallManager.findByNamedQuery("getHalls", map, 0, 3);
            return new JsonReaderResponse(models,true,3,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(new ArrayList(),true,0,"");
    }
    @RequestMapping("hotHallList")
    public JsonReaderResponse hotHallList(HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> map=requestMap(request);
        try{
            map.put("Q_t.updateDate","DESC");
            map.put("Q_t.hot_EQ","1");
            List<Map<String,Object>> models= exhibitionHallManager.findByNamedQuery("getHalls", map, 0, 5);
            return new JsonReaderResponse(models,true,5,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(new ArrayList(),true,0,"");
    }
    @RequestMapping("indexExh")
    public JsonReaderResponse indexExh(HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> map=requestMap(request);
        try{
            map.put("Q_exh.createDate","DESC");
            List<Map<String,Object>> models= exhibitionManager.findByNamedQuery("getExhs", map, 0, obtainLimit(request));
            if(models!=null && models.size()>0){
                Calendar calendar=Calendar.getInstance();
                for(Map<String,Object> objectMap:models){
                    Date startDate=parseDate(ObjectUtils.toString(objectMap.get("startDate")));
                    calendar.setTime(startDate);
                    calendar.add(Calendar.DATE,-3);
                    if(calendar.getTime().before(new Date())){
                        objectMap.put("willStart",true);
                    }else{
                        objectMap.put("willStart",false);
                    }
                }
            }
            return new JsonReaderResponse(models,true,5,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(new ArrayList(),true,0,"");
    }


    @RequestMapping("indexNews")
    public JsonReaderResponse indexNews(HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_createDate","DESC");
        try{
            List<ExhNews> models= exhNewsManager.list(map, 0, 10);
            return new JsonReaderResponse(models,true,5,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(new ArrayList(),true,0,"");
    }

    @RequestMapping("indexComment")
    public JsonReaderResponse indexComment(HttpServletRequest request, HttpServletResponse response) {
        List<Map<String,Object>> getComments=new ArrayList<Map<String, Object>>();
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_createDate","DESC");
            getComments=commentManager.findByNamedQuery("getIndexComments",map,0,5);
            return new JsonReaderResponse(getComments,true,0,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(new ArrayList(),true,0,"");
    }


    @RequestMapping("hall")
    public ModelAndView hall(HttpServletRequest request, HttpServletResponse response) {
        if(request.getSession().getAttribute("homeCommand")==null){
            Map<String,Object> command=homePageManager.homePage();
            request.getSession().setAttribute("homeCommand",command);
        }
        Map<String,Object> map=new HashMap<String, Object>();
        String name=request.getParameter("name");
        if(isNotEmpty(name)){
            map.put("Q_t.name_LK",name);
            map.put("name",name);
        }
        Integer count=exhibitionHallManager.count(map);
        map.put("count",count);
        return new ModelAndView("hall","command",map);
    }
    @RequestMapping("hallList/{pageIndex}")
    public ModelAndView hallList(@PathVariable Integer pageIndex,HttpServletRequest request) {
        Integer start=(pageIndex - 1)*obtainLimit(request);
        Map<String,Object> map=requestMap(request);
        map.put("Q_t.createDate","DESC");
        List<Map<String,Object>> models= exhibitionHallManager.findByNamedQuery("getHalls", map, start, obtainLimit(request));
        if(models!=null && models.size()>0){
            Calendar calendar=Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.add(Calendar.DATE,3);
            for(Map<String,Object> objectMap:models){
                map=new HashMap<String, Object>();
                map.put("Q_startDate_LE",calendar.getTime());
                Integer exhibition=exhibitionManager.count(map);
                if(exhibition!=null && exhibition>0){
                    objectMap.put("hasExh",true);
                }else {
                    objectMap.put("hasExh",false);
                }
            }
        }
        return new ModelAndView("hallList","halls",models);
    }
     @RequestMapping("hallDetail/{id}")
    public ModelAndView hallDetail(@PathVariable Long id,HttpServletRequest request) {
         Map<String,Object> model=exhibitionHallManager.hallDetail(id);
         if(model!=null){
             Calendar calendar=Calendar.getInstance();
             calendar.setTime(new Date());
             calendar.add(Calendar.DATE,3);
             Map<String,Object> map=new HashMap<String, Object>();
             map.put("Q_startDate_LE",calendar.getTime());
             Integer exhibition=exhibitionManager.count(map);
             if(exhibition!=null && exhibition>0){
                 model.put("hasExh",true);
             }else {
                 model.put("hasExh",false);
             }

         }
        return new ModelAndView("hallDetail","hall",model);
    }
     @RequestMapping("hallComment/{type}/{id}/{pageIndex}")
    public JsonReaderResponse hallComment(@PathVariable String type,@PathVariable Long id,@PathVariable Integer pageIndex,HttpServletRequest request) {
         Map<String,Object> map=new HashMap<String, Object>();
         map.put("itemId",id);
         map.put("typeId",CommendType.valueOf(type).ordinal());
         map.put("Q_createDate","DESC");
         Integer start=(pageIndex - 1)*obtainLimit(request);
         List<Map<String,Object>> getComments=commentManager.findByNamedQuery("getComments",map,start,obtainLimit(request));
         Integer count=commentManager.findByNamedQueryClass("getCommentsCount", Integer.class,map);
         return new JsonReaderResponse(getComments,true,count,"",pageIndex);
    }
    @RequestMapping("hallPs/{type}/{id}")
    public JsonReaderSingleResponse hallPs(@PathVariable String type,@PathVariable Long id,HttpServletRequest request) {
        ExhibitionHall exhibition=exhibitionHallManager.get(id);
        if(exhibition!=null){
            if(StringUtils.equals("p",type)){
                exhibition.setPreviewCount(exhibition.getPreviewCount()+1);
            }else if(StringUtils.equals("s",type)){
                exhibition.setShareCount(exhibition.getShareCount() + 1);
            }
            exhibitionHallManager.update(exhibition);
        }
        return new JsonReaderSingleResponse(null,true,"");
    }


    @RequestMapping("exh")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        if(request.getSession().getAttribute("homeCommand")==null){
            Map<String,Object> command=homePageManager.homePage();
            request.getSession().setAttribute("homeCommand",command);
        }
        Map<String,Object> map=requestMap(request);
        Integer count=exhibitionManager.findByNamedQueryClass("getExhsCount",Integer.class,map);
        return new ModelAndView("exh","count",count);
    }
    @RequestMapping("exhList/{pageIndex}")
    public ModelAndView exhList(@PathVariable Integer pageIndex,HttpServletRequest request) {
        Map<String,Object> map=requestMap(request);
        map.put("Q_exh.createDate","DESC");
        Integer start=(pageIndex - 1)*obtainLimit(request);
        List<Map<String,Object>> models= exhibitionManager.findByNamedQuery("getExhs", map, start, obtainLimit(request));
        if(models!=null && models.size()>0){
            Calendar calendar=Calendar.getInstance();
            for(Map<String,Object> objectMap:models){
                Date startDate=parseDate(ObjectUtils.toString(objectMap.get("startDate")));
                calendar.setTime(startDate);
                calendar.add(Calendar.DATE,-3);

                if(calendar.getTime().before(new Date())){
                    objectMap.put("willStart",true);
                }else{
                    objectMap.put("willStart",false);
                }
            }
        }
        return new ModelAndView("exhList","exhs",models);
    }
    @RequestMapping("exhDetail/{id}")
    public ModelAndView exhDetail(@PathVariable Long id,HttpServletRequest request) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("id",id);
        Map<String,Object> objectMap=exhibitionManager.findByNamedQueryMap("getExh",map);
        return new ModelAndView("exhDetail","exh",objectMap);
    }
    @RequestMapping("exhPs/{type}/{id}")
    public JsonReaderSingleResponse exhPreview(@PathVariable String type,@PathVariable Long id,HttpServletRequest request) {
        Exhibition exhibition=exhibitionManager.get(id);
        if(exhibition!=null){
            if(StringUtils.equals("p",type)){
                exhibition.setPreviewCount(exhibition.getPreviewCount()+1);
            }else if(StringUtils.equals("s",type)){
                exhibition.setShareCount(exhibition.getShareCount() + 1);
            }
            exhibitionManager.update(exhibition);
        }
        return new JsonReaderSingleResponse(null,true,"");
    }


    @RequestMapping("exhDes/{id}")
    public JsonReaderSingleResponse exhDes(@PathVariable Long id,HttpServletRequest request) {
        String objectMap=exhibitionManager.exhDes(id);
        return new JsonReaderSingleResponse(objectMap,true,objectMap);
    }
    @RequestMapping("exhGuide/{id}")
    public JsonReaderSingleResponse exhGuide(@PathVariable Long id,HttpServletRequest request) {
        String objectMap=exhibitionManager.exhGuide(id);
        return new JsonReaderSingleResponse(objectMap,true,objectMap);
    }
    @RequestMapping("exhGuideTo/{id}")
    public JsonReaderSingleResponse exhGuideTo(@PathVariable Long id,HttpServletRequest request) {
        String objectMap=exhibitionManager.exhGuideTo(id);
        return new JsonReaderSingleResponse(objectMap,true,objectMap);
    }
    @RequestMapping("exhNews/{id}/{pageIndex}")
    public JsonReaderResponse exhNews(@PathVariable Long id,@PathVariable Integer pageIndex,HttpServletRequest request) {
        List<ExhNewsCommand> commands=new ArrayList<ExhNewsCommand>();
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_exhId_EQ",id);
        Integer start=(pageIndex - 1)*obtainLimit(request);
        try{
            List<ExhNews> models= exhNewsManager.list(map,start,obtainLimit(request));
            if(models!=null && models.size()>0){
                for(ExhNews model:models){
                    ExhNewsCommand command=new ExhNewsCommand(model);
                    commands.add(command);
                }
            }
            Integer count=exhNewsManager.count(map);
            return new JsonReaderResponse(commands,true,count,"",pageIndex);
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("exhTrade/{id}/{pageIndex}")
    public JsonReaderResponse exhTrade(@PathVariable Long id,@PathVariable Integer pageIndex,HttpServletRequest request) {
        try{
            Exhibition exhibition=exhibitionManager.get(id);
            Integer start=(pageIndex - 1)*obtainLimit(request);
            if(exhibition!=null){
                String keywordNames = exhibition.getKeywordNames();
                List<Map<String,Object>> list=exhNewsManager.getExhTrade(keywordNames, start, obtainLimit(request));
                Integer count=exhNewsManager.getExhTradeCount(keywordNames);
                return new JsonReaderResponse(list,true,count,"");
            }
            return new JsonReaderResponse(new ArrayList(),true,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(null,false,"请求错误");
    }


    @RequestMapping("exhSponsor/{id}")
    public JsonReaderSingleResponse exhSponsor(@PathVariable Long id,HttpServletRequest request) {
        String objectMap=exhibitionManager.exhSponsor(id);
        return new JsonReaderSingleResponse(objectMap,true,objectMap);
    }
    @RequestMapping("exhTravel/{id}")
    public JsonReaderSingleResponse exhTravel(@PathVariable Long id,HttpServletRequest request) {
        String objectMap=exhibitionManager.exhTravel(id);
        return new JsonReaderSingleResponse(objectMap,true,objectMap);
    }
    @RequestMapping("comment/{type}/{itemId}")
    public JsonReaderSingleResponse comment(@PathVariable Long itemId,@PathVariable String type,HttpServletRequest request){
        try{
            String username=request.getRemoteUser();
            User user=userManager.getUserByUsername(username);
            Comment comment=new Comment();
            comment.setCreateDate(new Date());
            comment.setContent(request.getParameter("content"));
            comment.setItemId(itemId);
            comment.setUserId(user.getId());
            comment.setTypeId(CommendType.valueOf(type).ordinal());
            commentManager.save(comment);
            return new JsonReaderSingleResponse(null,true);
        }catch (Exception e){
            log.error("comment fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"评论失败");
    }
    @RequestMapping("newsDetail/{id}")
    public ModelAndView newsDetail(@PathVariable Long id,HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> params=new HashMap<String, Object>();
        params.put("id",id);
        Map<String,Object> map=exhNewsManager.findByNamedQueryMap("getNew", params);
        return new ModelAndView("newsDetail","news",map);
    }
    @RequestMapping("news")
    public ModelAndView news(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("news");
    }
    @RequestMapping("newsList/{pageIndex}")
    public JsonReaderResponse newsList(@PathVariable Integer pageIndex,HttpServletRequest request) {
        List<Map<String,Object>> commands=new ArrayList<Map<String,Object>>();
        Integer start=(pageIndex - 1)*obtainLimit(request);
        Map<String,Object> map=requestMap(request);
        map.put("Q_en.createDate","DESC");
        try{
            commands= exhNewsManager.findByNamedQuery("getNews",map, start, obtainLimit(request));
            Integer count=exhNewsManager.count(map);
            return new JsonReaderResponse(commands,true,count,"",pageIndex);
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(commands,false,"请求错误");
    }

    @RequestMapping("newsPs/{type}/{id}")
    public JsonReaderSingleResponse newsPs(@PathVariable String type,@PathVariable Long id,HttpServletRequest request) {
        ExhNews exhNews=exhNewsManager.get(id);
        if(exhNews!=null){
            if(StringUtils.equals("p",type)){
                exhNews.setPreviewCount(exhNews.getPreviewCount()+1);
            }else if(StringUtils.equals("s",type)){
                exhNews.setShareCount(exhNews.getShareCount() + 1);
            }
            exhNewsManager.update(exhNews);
        }
        return new JsonReaderSingleResponse(null,true,"");
    }


    @RequestMapping("usercomment")
    public ModelAndView usercomment(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("usercomment");
    }
    @RequestMapping("postComment")
    public JsonReaderSingleResponse postComment(HttpServletRequest request, HttpServletResponse response) {
        String contract=request.getParameter("contract");
        String content=request.getParameter("content");
        Object o=request.getSession().getAttribute("userinfo");
        try{
            UserComments userComments=new UserComments();
            userComments.setContract(contract);
            userComments.setContent(content);
            userComments.setLastUpdateDate(new Date());
            userComments.setCreateDate(new Date());

            if(o!=null){
                UserCommand userCommand=(UserCommand)o;
                userComments.setUserId(userCommand.getId());
            }
            userCommentsManager.save(userComments);
            return new JsonReaderSingleResponse("",true,"");
        }catch (Exception e){
            log.error("postComment",e);
        }
        return new JsonReaderSingleResponse("",false,"");
    }
    @RequestMapping("exhservice")
    public ModelAndView exhservice(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("exhservice");
    }
    @RequestMapping("esdetail/{id}")
    public ModelAndView esdetail(@PathVariable Long id,HttpServletRequest request, HttpServletResponse response) {
        ExhService exhService=exhServiceManager.get(id);
        return new ModelAndView("esdetail","command",exhService);
    }

    @RequestMapping("exhserviceList/{pageIndex}")
    public JsonReaderResponse exhserviceList(@PathVariable Integer pageIndex,HttpServletRequest request) {
        List<Map<String,Object>> commands=new ArrayList<Map<String,Object>>();
        Integer start=(pageIndex - 1)*obtainLimit(request);
        Map<String,Object> map=requestMap(request);
//        map.put("Q_createDate","DESC");
        try{
            commands= exhServiceManager.listPageMap(map, start, obtainLimit(request));
            Integer count=exhServiceManager.count(map);
            return new JsonReaderResponse(commands,true,count,"",pageIndex);
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("survey")
    public ModelAndView survey(HttpServletRequest request) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_enabled_EQ",true);
        Map<String,Object> survey=surveyManager.queryMap(map);
        if(survey!=null && survey.size()>0){
            map=new HashMap<String, Object>();
            map.put("Q_surveyId_EQ",survey.get("id"));
            map.put("Q_type","ASC");
            List<Map<String,Object>> questions=questionManager.listMap(map);
            if(questions!=null && questions.size()>0){
                for(Map<String,Object> question:questions){
                    map=new HashMap<String, Object>();
                    map.put("Q_questionId_EQ",question.get("id"));
                    List<Map<String,Object>> answers=answerManager.listMap(map);
                    question.put("answers",answers);
                }
            }
            survey.put("questions",questions);
        }
        return new ModelAndView("survey","survey",survey);
    }
     @RequestMapping("usersurvey")
    public JsonReaderSingleResponse usersurvey(@RequestBody List<UserSurveyCommand> commands,HttpServletRequest request) {
         try{
             User user=userManager.getUserByUsername(request.getRemoteUser());


             List<UserSurvey> userSurveys=new ArrayList<UserSurvey>();
             if(commands!=null && commands.size()>0){
                 Map<String,Object> map=new HashMap<String, Object>();
                 map.put("Q_userId_EQ",user.getId());
                 map.put("Q_surveyId_EQ",commands.get(0).getSurveyId());
                 UserSurvey userSurvey=userSurveyManager.getByParam(map);
                 if(userSurvey!=null){
                     return new JsonReaderSingleResponse("",false,"你已经参与了该问卷的调查");
                 }
                 for(UserSurveyCommand command:commands){
                     UserSurvey survey=new UserSurvey();
                     survey.setQuestionId(command.getQuestionId());
                     survey.setSurveyId(command.getSurveyId());
                     survey.setAnswerId(command.getAnswerId());
                     survey.setCreateDate(new Date());
                     survey.setAnswerContent(command.getAnswerContent());
                     survey.setUserId(user.getId());
                     userSurveys.add(survey);
                 }
             }
             userSurveyManager.batchSave(userSurveys);
             return new JsonReaderSingleResponse("",true,"");
         }catch (Exception e){
         }
        return new JsonReaderSingleResponse("",false,"");
    }
    @RequestMapping("exhplan")
    public ModelAndView exhplan(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("exhplan");
    }
    @RequestMapping("exhplanList/{pageIndex}")
    public JsonReaderResponse exhplanList(@PathVariable Integer pageIndex,HttpServletRequest request) {
        List<Map<String,Object>> commands=new ArrayList<Map<String,Object>>();
        Integer start=(pageIndex - 1)*obtainLimit(request);
        Map<String,Object> map=requestMap(request);
        map.put("Q_createDate","DESC");
        try{
            commands= exhPlanManager.listPageMap(map, start, obtainLimit(request));
            Integer count=exhPlanManager.count(map);
            return new JsonReaderResponse(commands,true,count,"",pageIndex);
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(commands,false,"请求错误");
    }

    @RequestMapping("exhplanDetail/{id}")
    public ModelAndView exhplanDetail(@PathVariable Long id,HttpServletRequest request, HttpServletResponse response) {
        ExhPlan map=exhPlanManager.get(id);
        return new ModelAndView("exhplanDetail","news",map);
    }
    @RequestMapping("appraisal")
    public ModelAndView appraisal() {
        return new ModelAndView("appraisal");
    }
    @RequestMapping("appraisalList/{pageIndex}")
    public JsonReaderResponse appraisalList(@PathVariable Integer pageIndex,HttpServletRequest request) {
        List<Map<String,Object>> commands=new ArrayList<Map<String,Object>>();
        Integer start=(pageIndex - 1)*obtainLimit(request);
        Map<String,Object> map=requestMap(request);
        map.put("Q_createDate","DESC");
        try{
            commands= appraisalManager.listPageMap(map, start, obtainLimit(request));
            Integer count=appraisalManager.count(map);
            return new JsonReaderResponse(commands,true,count,"",pageIndex);
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(commands,false,"请求错误");
    }

    @RequestMapping("apldetail/{id}")
    public ModelAndView appraisalDetail(@PathVariable Long id) {
        Appraisal map=appraisalManager.get(id);
        return new ModelAndView("apldetail","command",map);
    }
















}
