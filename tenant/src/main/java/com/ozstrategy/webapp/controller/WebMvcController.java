package com.ozstrategy.webapp.controller;

import com.ozstrategy.Constants;
import com.ozstrategy.model.appstore.AppStore;
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
import com.ozstrategy.service.appstore.AppStoreManager;
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
import com.ozstrategy.webapp.utils.HttpUtils;
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
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
    @Autowired
    protected AppStoreManager appStoreManager;


    private final static int dayExh=7;
    private final static String imgUrl=System.getProperty("img.url");











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
        String po=userCommand.getPortraitUrl();
        po=imgUrl+po;
        userCommand.setPortraitUrl(po);
        userCommand.setEnEmail(Base64Utils.encode(ThreeDESUtils.encrypt(user.getEmail().getBytes())));
        return new ModelAndView("updateUser","user",userCommand);
    }

    @RequestMapping("registerUser")
    public ModelAndView registerUser(HttpServletRequest request, HttpServletResponse response) {
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
                logo1Url=Constants.updloadPortrait+"/"+str;
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
        if(command!=null){
            command.put("imgUrl",imgUrl);
            String logoUrl=ObjectUtils.toString(command.get("logoUrl"));
            String zxUrl=ObjectUtils.toString(command.get("zxUrl"));
            command.put("logoUrl",imgUrl+logoUrl);
            command.put("zxUrl",imgUrl+zxUrl);
        }
        request.getSession().setAttribute("homeCommand",command);
        return new ModelAndView("index");
    }


    @RequestMapping("advertHall")
    public JsonReaderResponse header(HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> map=requestMap(request);
        try{
            map.put("Q_t.idx","DESC");
            map.put("Q_t.publish_EQ","1");
            List<Map<String,Object>> models= exhibitionHallManager.findByNamedQuery("getHalls", map, 0, 3);
            for (Map<String,Object> objectMap:models){
                String logo1Url=ObjectUtils.toString(objectMap.get("logo1Url"));
                String logo2Url=ObjectUtils.toString(objectMap.get("logo2Url"));
                objectMap.put("logo1Url",imgUrl+logo1Url);
                objectMap.put("logo2Url",imgUrl+logo2Url);
            }
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
            map.put("Q_t.idx","DESC");
            map.put("Q_t.publish_EQ","1");
            List<Map<String,Object>> models= exhibitionHallManager.findByNamedQuery("getHalls", map, 0, 5);
            for (Map<String,Object> objectMap:models){
                String logo1Url=ObjectUtils.toString(objectMap.get("logo1Url"));
                String logo2Url=ObjectUtils.toString(objectMap.get("logo2Url"));
                objectMap.put("logo1Url",imgUrl+logo1Url);
                objectMap.put("logo2Url",imgUrl+logo2Url);
            }
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
            map.put("Q_exh.idx","DESC");
            map.put("Q_exh.publish_EQ","1");
            List<Map<String,Object>> models= exhibitionManager.findByNamedQuery("getExhs", map, 0, obtainLimit(request));
            if(models!=null && models.size()>0){
                Calendar calendar=Calendar.getInstance();
                for(Map<String,Object> objectMap:models){
                    Date startDate=parseDate(ObjectUtils.toString(objectMap.get("startDate")));
                    calendar.setTime(startDate);
                    calendar.add(Calendar.DAY_OF_YEAR,(0-dayExh));
                    if(calendar.getTime().before(new Date())){
                        objectMap.put("willStart",true);
                    }else{
                        objectMap.put("willStart",false);
                    }
                    String picUrl=ObjectUtils.toString(objectMap.get("picUrl"));
                    String logoUrl=ObjectUtils.toString(objectMap.get("logoUrl"));
                    objectMap.put("picUrl",imgUrl+picUrl);
                    objectMap.put("logoUrl",imgUrl+logoUrl);
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
        map.put("Q_idx","DESC");
        map.put("Q_publish_EQ",1);
        try{
            List<Map<String,Object>> models= exhNewsManager.listPageMap(map, 0, 10, "title", "id");
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
        return new JsonReaderResponse(getComments,true,0,"");
    }


    @RequestMapping("hall")
    public ModelAndView hall(HttpServletRequest request, HttpServletResponse response) {
        if(request.getSession().getAttribute("homeCommand")==null){
            Map<String,Object> command=homePageManager.homePage();
            if(command!=null){
                command.put("imgUrl",imgUrl);
                String logoUrl=ObjectUtils.toString(command.get("logoUrl"));
                String zxUrl=ObjectUtils.toString(command.get("zxUrl"));
                command.put("logoUrl",imgUrl+logoUrl);
                command.put("zxUrl",imgUrl+zxUrl);
            }
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
        map.put("Q_t.idx","DESC");
        map.put("Q_t.publish_EQ",1);
        List<Map<String,Object>> models= exhibitionHallManager.findByNamedQuery("getHalls", map, start, obtainLimit(request));
        if(models!=null && models.size()>0){
            Calendar calendar=Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.add(Calendar.DAY_OF_YEAR,dayExh);
            for(Map<String,Object> objectMap:models){
                map=new HashMap<String, Object>();
                map.put("Q_startDate_LE",calendar.getTime());
                map.put("Q_startDate_GE",new Date());
                Integer exhibition=exhibitionManager.count(map);
                if(exhibition!=null && exhibition>0){
                    objectMap.put("hasExh",true);
                }else {
                    objectMap.put("hasExh",false);
                }
                String logo1Url=ObjectUtils.toString(objectMap.get("logo1Url"));
                String logo2Url=ObjectUtils.toString(objectMap.get("logo2Url"));
                objectMap.put("logo1Url",imgUrl+logo1Url);
                objectMap.put("logo2Url",imgUrl+logo2Url);
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
             calendar.add(Calendar.DAY_OF_YEAR,dayExh);
             Map<String,Object> map=new HashMap<String, Object>();
             map.put("Q_startDate_LE",calendar.getTime());
             map.put("Q_startDate_GE",new Date());
             Integer exhibition=exhibitionManager.count(map);
             if(exhibition!=null && exhibition>0){
                 model.put("hasExh",true);
             }else {
                 model.put("hasExh",false);
             }
             String logo1Url=ObjectUtils.toString(model.get("logo1Url"));
             String logo2Url=ObjectUtils.toString(model.get("logo2Url"));
             model.put("logo1Url",imgUrl+logo1Url);
             model.put("logo2Url",imgUrl+logo2Url);

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
            if(command!=null){
                command.put("imgUrl",imgUrl);
                String logoUrl=ObjectUtils.toString(command.get("logoUrl"));
                String zxUrl=ObjectUtils.toString(command.get("zxUrl"));
                command.put("logoUrl",imgUrl+logoUrl);
                command.put("zxUrl",imgUrl+zxUrl);
            }
            request.getSession().setAttribute("homeCommand",command);
        }
        Map<String,Object> map=requestMap(request);
        Integer count=exhibitionManager.findByNamedQueryClass("getExhsCount",Integer.class,map);
        return new ModelAndView("exh","count",count);
    }
    @RequestMapping("exhList/{pageIndex}")
    public ModelAndView exhList(@PathVariable Integer pageIndex,HttpServletRequest request) {
        Map<String,Object> map=requestMap(request);
        map.put("Q_exh.idx","DESC");
        map.put("Q_exh.publish_EQ",1);
        Integer start=(pageIndex - 1)*obtainLimit(request);
        List<Map<String,Object>> models= exhibitionManager.findByNamedQuery("getExhs", map, start, obtainLimit(request));
        if(models!=null && models.size()>0){
            Calendar calendar=Calendar.getInstance();
            for(Map<String,Object> objectMap:models){
                Date startDate=parseDate(ObjectUtils.toString(objectMap.get("startDate")));
                calendar.setTime(startDate);
                calendar.add(Calendar.DAY_OF_YEAR,0-dayExh);

                if(calendar.getTime().before(new Date()) && startDate.after(new Date())){
                    objectMap.put("willStart",true);
                }else{
                    objectMap.put("willStart",false);
                }
                String picUrl=ObjectUtils.toString(objectMap.get("picUrl"));
                String logoUrl=ObjectUtils.toString(objectMap.get("logoUrl"));
                objectMap.put("picUrl",imgUrl+picUrl);
                objectMap.put("logoUrl",imgUrl+logoUrl);
            }
        }
        return new ModelAndView("exhList","exhs",models);
    }
    @RequestMapping("exhDetail/{id}")
    public ModelAndView exhDetail(@PathVariable Long id,HttpServletRequest request) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("id",id);
        Map<String,Object> objectMap=exhibitionManager.findByNamedQueryMap("getExh",map);
        String picUrl=ObjectUtils.toString(objectMap.get("picUrl"));
        String logoUrl=ObjectUtils.toString(objectMap.get("logoUrl"));
        objectMap.put("picUrl",imgUrl+picUrl);
        objectMap.put("logoUrl",imgUrl+logoUrl);
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
//        Map<String,Object> map=new HashMap<String, Object>();
//        map.put("Q_exhId_EQ",id);
        Integer start=(pageIndex - 1)*obtainLimit(request);
        try{
//            List<ExhNews> models= exhNewsManager.list(map,start,obtainLimit(request));
//            if(models!=null && models.size()>0){
//                for(ExhNews model:models){
//                    ExhNewsCommand command=new ExhNewsCommand(model);
//                    commands.add(command);
//                }
//            }
//            Integer count=exhNewsManager.count(map);


            List<Map<String,Object>> models= exhNewsManager.getExhNews(id, start, obtainLimit(request));
//            if(models!=null && models.size()>0){
//                for(ExhNews model:models){
//                    ExhNewsCommand command=new ExhNewsCommand(model);
//                    commands.add(command);
//                }
//            }
            Integer count=exhNewsManager.getExhNewsCount(id);



            return new JsonReaderResponse(models,true,count,"",pageIndex);
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
        map.put("Q_en.idx","DESC");
        map.put("Q_en.publish_EQ",1);
        try{
            commands= exhNewsManager.findByNamedQuery("getNews",map, start, obtainLimit(request));
            map.remove("Q_en.publish_EQ");
            map.put("Q_publish_EQ",1);
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
        map.put("Q_idx","DESC");
        map.put("Q_publish_EQ",1);
        try{
            commands= exhServiceManager.listPageMap(map, start, obtainLimit(request),"id","title","createDate","lastUpdateDate");
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
        map.put("Q_idx","DESC");
        map.put("Q_publish_EQ",1);
        try{
            commands= exhPlanManager.listPageMap(map, start, obtainLimit(request),"id","year","title","holdDate","outUrl","address","createDate");
            Integer count=exhPlanManager.count(map);
            return new JsonReaderResponse(commands,true,count,"",pageIndex);
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("exhplanyear")
    public JsonReaderResponse exhplanyear(HttpServletRequest request) {
        List<Map<String,Object>> commands=exhPlanManager.listYears();
        return new JsonReaderResponse(commands,true,commands.size(),"");
    }


    @RequestMapping("exhplanDetail/{id}")
    public ModelAndView exhplanDetail(@PathVariable Long id,HttpServletRequest request, HttpServletResponse response) {
        ExhPlan map=exhPlanManager.get(id);
        return new ModelAndView("exhplanDetail","news",map);
    }
    @RequestMapping("appraisal")
    public ModelAndView appraisal(HttpServletRequest request) {
        Map<String,Object> command=homePageManager.homePage();
        if(command!=null){
            command.put("imgUrl",imgUrl);
            String logoUrl=ObjectUtils.toString(command.get("logoUrl"));
            String zxUrl=ObjectUtils.toString(command.get("zxUrl"));
            command.put("logoUrl",imgUrl+logoUrl);
            command.put("zxUrl",imgUrl+zxUrl);
        }
        request.getSession().setAttribute("homeCommand",command);
        return new ModelAndView("repeatitem");
    }
    @RequestMapping("appraisalList/{pageIndex}")
    public JsonReaderResponse appraisalList(@PathVariable Integer pageIndex,HttpServletRequest request) {
        List<Map<String,Object>> commands=new ArrayList<Map<String,Object>>();
        Integer start=(pageIndex - 1)*obtainLimit(request);
        Map<String,Object> map=requestMap(request);
        map.put("Q_idx","DESC");
        map.put("Q_publish_EQ",1);
        try{
            commands= appraisalManager.listPageMap(map, start, obtainLimit(request), "id", "title", "createDate");
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
    @RequestMapping("apldetail/{id}/{d}")
    public ModelAndView appraisalDetail(@PathVariable Long id,Integer d) {
        Appraisal map=appraisalManager.get(id);
        return new ModelAndView("apldetail","command",map);
    }
    @RequestMapping("repeatyear")
    public ModelAndView repeatyear() {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("url",emailProp.get("repeatUrl"));
        return new ModelAndView("repeat/repeatyear","command",map);
    }
    @RequestMapping("repeatcity")
    public ModelAndView repeatcity() {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("url",emailProp.get("repeatUrl"));
        return new ModelAndView("repeat/repeatcitytable","command",map);
    }
    @RequestMapping("repeatexh")
    public ModelAndView repeatexh() {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("url",emailProp.get("repeatUrl"));
        return new ModelAndView("repeat/repeatexhtable","command",map);
    }
    @RequestMapping("repeatcmp")
    public ModelAndView repeatcmp() {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("url",emailProp.get("repeatUrl"));
        return new ModelAndView("repeat/repeatcmptable","command",map);
    }







//    报表部分
//    private static final String baseUrl="http://112.126.83.10:8000/api/";
    @RequestMapping("cdyear")
    public String cdyear(HttpServletRequest request,HttpServletResponse response) {
        allowXRequested(response);
        String start=request.getParameter("start");
        String end=request.getParameter("end");
        String base = emailProp.getProperty("repeatUrl")+"year/";
        String url="default";
        if(StringUtils.isNotEmpty(start) && StringUtils.isNotEmpty(end)){
            url=start+"-"+end;
        }
        url=base+url;
        try{
             return HttpUtils.get(url);
        }catch (Exception e){
            logger.error("get url["+url+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("cdyearlist")
    public String cdyearlist(HttpServletRequest request,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"year/list";
        try{
             return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("ninecitylist")
    public String ninecitylist(HttpServletRequest request,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"ninecity";
        try{
             return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("ninecity/{id}")
    public ModelAndView ninecitylist(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        Map<String,String> map=new HashMap<String, String>();
        map.put("id",id);
        map.put("url",emailProp.getProperty("repeatUrl"));
        return new ModelAndView("repeat/ninecity","command",map);
    }
    @RequestMapping("ex_area/{id}")
    public String ex_area(@PathVariable String id,HttpServletResponse response){
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"nine/";
        String url=base+"ex_area/"+id;
        try {
            String result=HttpUtils.get(url);
            return result;
        } catch (Exception e) {
            log.error("get url["+url+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("venue_area/{id}")
    public String venue_area(@PathVariable String id,HttpServletResponse response){
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"nine/";
        String url=base+"venue_area/"+id;
        try {
            String result=HttpUtils.get(url);
            return result;
        } catch (Exception e) {
            log.error("get url["+url+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("ex_num/{id}")
    public String ex_num(@PathVariable String id,HttpServletResponse response){
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"nine/";
        String url=base+"ex_num/"+id;
        try {
            String result=HttpUtils.get(url);
            return result;
        } catch (Exception e) {
            log.error("get url["+url+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("confe_num/{id}")
    public String confe_num(@PathVariable String id,HttpServletResponse response){
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"nine/";
        String url=base+"confe_num/"+id;
        try {
            String result=HttpUtils.get(url);
            return result;
        } catch (Exception e) {
            log.error("get url["+url+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("w_num3/{id}")
    public String w_num3(@PathVariable String id,HttpServletResponse response){
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"nine/";
        String url=base+"3w_num/"+id;
        try {
            String result=HttpUtils.get(url);
            return result;
        } catch (Exception e) {
            log.error("get url["+url+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("w_area3/{id}")
    public String w_area3(@PathVariable String id,HttpServletResponse response){
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"nine/";
        String url=base+"3w_area/"+id;
        try {
            String result=HttpUtils.get(url);
            return result;
        } catch (Exception e) {
            log.error("get url["+url+"] fail",e);
        }
        return "{}";
    }


    @RequestMapping("singleProjectList/{pageIndex}")
    public String singleProjectList(HttpServletResponse response,@PathVariable Integer pageIndex) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"single/"+pageIndex;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("singleProject/{type}/{id}")
    public ModelAndView singleProject(@PathVariable Integer type,@PathVariable String id,HttpServletResponse response,HttpServletRequest request) {
        allowXRequested(response);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("id",id);
        map.put("type",type);
        map.put("url",emailProp.getProperty("repeatUrl"));
        if(type==1){
            return new ModelAndView("repeat/singlep","command",map);
        }else{
            return new ModelAndView("repeat/singlem","command",map);
        }
    }

    @RequestMapping("exhibition/table/{id}")
    public String exhibitiontable(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"exhibition/table/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "{}";
    }
     @RequestMapping("exhibition/radar/{id}")
    public String exhibitionradar(@PathVariable String id,HttpServletResponse response) {

         allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"exhibition/radar/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("exhibition/trend_report/{id}")
    public String trend_report(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"exhibition/trend_report/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("exhibition/time_media_list/{id}")
    public String time_media_list(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"exhibition/time_media_list/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("exhibition/time_media/{id}")
    public String time_media(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"exhibition/time_media/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }

    @RequestMapping("exhibition/media_impact/{id}")
    public String media_impact(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"exhibition/media_impact/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("exhibition/media_location/{id}")
    public String media_location(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"exhibition/media_location/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("exhibition/media_structure/{id}")
    public String media_structure(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"exhibition/media_structure/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    //媒体
    @RequestMapping("media/trend_report/{id}")
    public String mediatrend_report(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"media/trend_report/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("media/time_media_list/{id}")
    public String mtime_media_list(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"media/time_media_list/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("media/time_media/{id}")
    public String mtime_media(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"media/time_media/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("media/media_impact/{id}")
    public String mmedia_impact(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"media/media_impact/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("media/media_location/{id}")
    public String mmedia_location(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"media/media_location/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("media/media_structure/{id}")
    public String mmedia_structure(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"media/media_structure/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
//对比
    @RequestMapping("compareProjectList")
    public String compareProjectList(HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"compare";
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "[]";
    }
    @RequestMapping("compareProject/{type}/{id}")
    public ModelAndView compareProject(@PathVariable Integer type,@PathVariable String id,HttpServletRequest request,HttpServletResponse response) {
        allowXRequested(response);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("id",id);
        map.put("type",type);
        String name1=request.getParameter("name1");
        String name2=request.getParameter("name2");
        map.put("url",emailProp.getProperty("repeatUrl"));
        try {
            name1= URLDecoder.decode(name1,"UTF-8");
            name2= URLDecoder.decode(name2,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        map.put("name1",name1);
        map.put("name2",name2);
        if(type==2){
            return new ModelAndView("repeat/compares","command",map);
        }else{
            return new ModelAndView("repeat/compared","command",map);
        }
    }
    @RequestMapping("diff_compare/table/{id}")
    public String dtable(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"diff_compare/table/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("diff_compare/num/{id}")
    public String dnum(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"diff_compare/num/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("diff_compare/media_structure/{id}")
    public String dmedia_structure(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"diff_compare/media_structure/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("diff_compare/seminate/{id}")
    public String seminate(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"diff_compare/seminate/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("same_compare/radar/{id}")
    public String sradar(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"same_compare/radar/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("same_compare/trend_report/{id}")
    public String strend_report(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"same_compare/trend_report/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("same_compare/time_media/{id}")
    public String stime_media(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"same_compare/time_media/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "{}";
    }
    @RequestMapping("same_compare/media_structure/{id}")
    public String smedia_structure(@PathVariable String id,HttpServletResponse response) {
        allowXRequested(response);
        String base = emailProp.getProperty("repeatUrl")+"same_compare/media_structure/"+id;
        try{
            return HttpUtils.get(base);
        }catch (Exception e){
            logger.error("get url["+base+"] fail",e);
        }
        return "{}";
    }















































}
