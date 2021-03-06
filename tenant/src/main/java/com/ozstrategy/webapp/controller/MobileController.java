package com.ozstrategy.webapp.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ozstrategy.Constants;
import com.ozstrategy.model.appstore.AppStore;
import com.ozstrategy.model.appstore.AppType;
import com.ozstrategy.model.commend.CommendType;
import com.ozstrategy.model.commend.Comment;
import com.ozstrategy.model.exh.ExhDescription;
import com.ozstrategy.model.exh.ExhGuide;
import com.ozstrategy.model.exh.ExhGuideTo;
import com.ozstrategy.model.exh.ExhNews;
import com.ozstrategy.model.exh.ExhPlan;
import com.ozstrategy.model.exh.ExhService;
import com.ozstrategy.model.exh.ExhSponsor;
import com.ozstrategy.model.exh.ExhTravel;
import com.ozstrategy.model.exh.Exhibition;
import com.ozstrategy.model.exh.ExhibitionHall;
import com.ozstrategy.model.user.Role;
import com.ozstrategy.model.user.User;
import com.ozstrategy.service.appstore.AppStoreManager;
import com.ozstrategy.service.commend.CommentManager;
import com.ozstrategy.service.exh.ExhDescriptionManager;
import com.ozstrategy.service.exh.ExhGuideManager;
import com.ozstrategy.service.exh.ExhGuideToManager;
import com.ozstrategy.service.exh.ExhNewsManager;
import com.ozstrategy.service.exh.ExhPlanManager;
import com.ozstrategy.service.exh.ExhServiceManager;
import com.ozstrategy.service.exh.ExhSponsorManager;
import com.ozstrategy.service.exh.ExhTravelManager;
import com.ozstrategy.service.exh.ExhibitionHallManager;
import com.ozstrategy.service.exh.ExhibitionManager;
import com.ozstrategy.service.user.RoleManager;
import com.ozstrategy.service.user.UserManager;
import com.ozstrategy.util.Base64Utils;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhNewsCommand;
import com.ozstrategy.webapp.command.user.UserCommand;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * Created by lihao1 on 7/26/15.
 */
@RestController
@RequestMapping("app")
public class MobileController extends BaseController{
    @Autowired
    private UserManager userManager;
    @Autowired
    private RoleManager roleManager;
    @Autowired
    private ExhibitionHallManager exhibitionHallManager;
    @Autowired
    private ExhibitionManager exhibitionManager;
    @Autowired
    private CommentManager commentManager;
    @Autowired
    private ExhGuideManager exhGuideManager;
    @Autowired
    private ExhGuideToManager exhGuideToManager;
    @Autowired
    private ExhTravelManager exhTravelManager;
    @Autowired
    private ExhDescriptionManager exhDescriptionManager;
    @Autowired
    private ExhSponsorManager exhSponsorManager;
    @Autowired
    private ExhNewsManager exhNewsManager;
    @Autowired
    private AppStoreManager appStoreManager;
    @Autowired
    private ExhPlanManager exhPlanManager;
    @Autowired
    private ExhServiceManager exhServiceManager;
    @Autowired
    protected Properties emailProp;
    private final static String imgUrl=System.getProperty("img.url");


    private final static String hall="hall";
    private final static String exhdes="exhdes";
    private final static String exhplan="exhplan";
    private final static String exhservice="exhservice";
    private final static String exhguide="exhguide";
    private final static String exhguideto="exhguideto";
    private final static String exhtravel="exhtravel";
    private final static String exhsponsor="exhsponsor";
    private final static String exhnews="exhnews";
    private final static String news="news";
    private final static int dayExh=7;

    @RequestMapping("webview/{type}/{id}")
    public ModelAndView webview(@PathVariable String type,@PathVariable Long id){
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("imgUrl",imgUrl);
        if(StringUtils.equals(hall,type)){
            ExhibitionHall exhibitionHall =exhibitionHallManager.get(id);
            map.put("title",exhibitionHall.getName());
            map.put("content",exhibitionHall.getDescription());
        }else if(StringUtils.equals(exhdes,type)){
            Map<String,Object> params=new HashMap<String, Object>();
            params.put("Q_exhId_EQ",id);
            ExhDescription exhDescription=exhDescriptionManager.getByParam(params);
            map.put("title","");
            map.put("content",exhDescription.getDescription());
        }else if(StringUtils.equals(exhnews,type)){
            Map<String,Object> params=new HashMap<String, Object>();
            params.put("Q_exhId_EQ",id);
            ExhNews exhDescription=exhNewsManager.getByParam(params);
            map.put("title",exhDescription.getTitle());
            map.put("content",exhDescription.getNews());
        }else if(StringUtils.equals(exhplan,type)){

            ExhPlan exhDescription=exhPlanManager.get(id);
            map.put("title",exhDescription.getTitle());
            map.put("content",exhDescription.getContent());
        }else if(StringUtils.equals(exhservice,type)){
            ExhService exhDescription=exhServiceManager.get(id);
            map.put("title",exhDescription.getTitle());
            map.put("content",exhDescription.getContent());
        }else if(StringUtils.equals(exhguide,type)){
            Map<String,Object> params=new HashMap<String, Object>();
            params.put("Q_exhId_EQ",id);
            ExhGuide exhDescription=exhGuideManager.getByParam(params);
            map.put("title","");
            map.put("content",exhDescription.getGuide());
        }else if(StringUtils.equals(exhguideto,type)){
            Map<String,Object> params=new HashMap<String, Object>();
            params.put("Q_exhId_EQ",id);
            ExhGuideTo exhDescription=exhGuideToManager.getByParam(params);
            map.put("title","");
            map.put("content",exhDescription.getGuideTo());
        }else if(StringUtils.equals(exhtravel,type)){
            Map<String,Object> params=new HashMap<String, Object>();
            params.put("Q_exhId_EQ",id);
            ExhTravel exhDescription=exhTravelManager.getByParam(params);
            map.put("title","");
            map.put("content",exhDescription.getTravel());
        }else if(StringUtils.equals(exhsponsor,type)){
            Map<String,Object> params=new HashMap<String, Object>();
            params.put("Q_exhId_EQ",id);
            ExhSponsor exhDescription=exhSponsorManager.getByParam(params);
            map.put("title","");
            map.put("content",exhDescription.getSponsor());
        }else if(StringUtils.equals(news,type)){
            ExhNews exhDescription=exhNewsManager.get(id);
            map.put("title",exhDescription.getTitle());
            map.put("content",exhDescription.getNews());
        }
        return new ModelAndView("app/webview","command",map);
    }
    private String createWebView(String type,String id,HttpServletRequest request){
        String host=request.getServerName();
        String contextPath=request.getContextPath();
        int port = request.getServerPort();
        String base=  "http://"+host+":"+port+contextPath+"/";
        String url=base+"html/app/webview/"+type+"/"+id;
        return url;
    }



    @RequestMapping("getLastVersion/{type}")
    public JsonReaderSingleResponse getLastVersion(@PathVariable String type,HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_type_EQ", AppType.valueOf(type).ordinal());
        map.put("Q_enabled_EQ",true);
        AppStore appStore=appStoreManager.getByParam(map);
        if(appStore!=null){
            String pacUrl = imgUrl+appStore.getPacUrl();
            appStore.setPacUrl(pacUrl);
        }
        return new JsonReaderSingleResponse(appStore,true,"");
    }



    @RequestMapping("register")
    public JsonReaderSingleResponse<UserCommand> register(HttpServletRequest request){
        try{
            String username=obtain(request,"username");
            String password=obtain(request,"password");
            String nickName=obtain(request,"nickName");
            String email=obtain(request,"email");
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_username_EQ",username);
            User user=userManager.getUserByUsername(username);
            if(user!=null){
                return new JsonReaderSingleResponse(null,false,"该用户已存在");
            }
            map=new HashMap<String, Object>();
            map.put("Q_name_EQ","ROLE_USER");
            Role role=roleManager.getByParam(map);
            user=new User();
            user.setNickName(nickName);
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setRoleId(role.getId());
            user.getRoles().clear();
            user.getRoles().add(role);
            userManager.saveUser(user);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("register fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
    @RequestMapping("login")
    public void login(HttpServletRequest request,HttpServletResponse response){
        try {
            request.getRequestDispatcher("/j_security_check").forward(request,response);
        } catch (ServletException e) {
        } catch (IOException e) {
        }
    }
    @RequestMapping(value = "portrait")
    public ModelAndView portrait(HttpServletRequest request, HttpServletResponse response) {
        String username    = request.getRemoteUser();
        User user=userManager.getUserByUsername(username);
        String attachFilesDirStr = randomAbsolutePath(request, Constants.updloadPortrait);
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
        } catch (IOException e) { }

        if (writer == null) {
            return null;
        }
        String file = request.getParameter("file");
        String fileName=request.getParameter("fileName");
        if(isNotEmpty(file)){
            byte[] fileb= Base64Utils.decode(file);
            String str=randomName(fileName);
            File fileOnServer = new File(attachFilesDirStr,str);
            try{
                FileOutputStream outputStream=new FileOutputStream(fileOnServer);
                IOUtils.write(fileb, outputStream);
                if(fileOnServer.length()>200*1024){
                    try {
                        writer.print(new ObjectMapper().writeValueAsString(new JsonReaderSingleResponse(null, false, "文件过大")));
                        FileUtils.forceDelete(fileOnServer);
                    } catch (IOException e1) { }
                    return null;
                }
                if(StringUtils.isNotEmpty(fileName)){
                    try{
                        FileUtils.forceDelete(new File(user.getPortraitPath()));
                    }catch (Exception e){
                    }
                    user.setPortraitName(fileName);
                    user.setPortraitPath(fileOnServer.getAbsolutePath());
                    String httpPath=Constants.updloadPortrait+"/"+str;
                    user.setPortraitUrl(httpPath);
                    userManager.update(user);
                }
            }catch (Exception e){
                logger.error("upload portrait fail", e);
                e.printStackTrace();
                try {
                    writer.print(new ObjectMapper().writeValueAsString(new JsonReaderSingleResponse(null, false, "上传失败")));
                    FileUtils.forceDelete(fileOnServer);
                } catch (IOException e1) { }
            }
        }
        try {
            writer.print(new ObjectMapper().writeValueAsString(new JsonReaderSingleResponse(null, true, "")));
        } catch (JsonProcessingException e) {
        }

        return null;
    }
    @RequestMapping("updateUser")
    public JsonReaderSingleResponse<UserCommand> update(HttpServletRequest request){
        try{
            String username=request.getRemoteUser();
            User user=userManager.getUserByUsername(username);
            String nickName=request.getParameter("nickName");
            String gender=request.getParameter("gender");
            String birth=request.getParameter("birth");
            String address=request.getParameter("address");
            String city=request.getParameter("city");
            String country=request.getParameter("country");
            String postalCode=request.getParameter("postalCode");
            String province=request.getParameter("province");
            user.setNickName(nickName);
            user.setGender(gender);
            if(StringUtils.isNotEmpty(birth)){
                user.setBirth(DateUtils.parseDate(birth, "yyyy-MM-dd"));
            }
            user.setAddress(address);
            user.setCity(city);
            user.setCountry(country);
            user.setPostalCode(postalCode);
            user.setProvince(province);
            userManager.update(user);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("update fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"参数错误");
    }
    @RequestMapping("getHalls")
    public JsonReaderResponse getHalls(HttpServletRequest request,HttpServletResponse response){
        Map<String,Object> map=requestMap(request);
        try{
            response.addHeader("Access-Control-Allow-Origin","*");
            response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
            map.put("Q_t.idx","DESC");
            map.put("Q_t.publish_EQ",1);
            List<Map<String,Object>> models= exhibitionHallManager.findByNamedQuery("getHalls", map, obtainStart(request), obtainLimit(request));
            if(models!=null && models.size()>0){
                Calendar calendar=Calendar.getInstance();
                calendar.setTime(new Date());
                calendar.add(Calendar.DAY_OF_YEAR,dayExh);
                for(Map<String,Object> objectMap:models){
                    objectMap.put("webview",createWebView(hall,objectMap.get("id").toString(),request));
                    Map<String,Object> emap=new HashMap<String, Object>();
                    emap.put("Q_startDate_LE",calendar.getTime());
                    emap.put("Q_startDate_GE",new Date());
                    Integer exhibition=exhibitionManager.count(emap);
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
            Integer count=exhibitionHallManager.findByNamedQueryClass("getHallsCount",Integer.class,map);
            return new JsonReaderResponse(models,true,count,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(null,false,"请求错误");
    }
    @RequestMapping("getHall/{id}")
    public JsonReaderSingleResponse getHall(@PathVariable Long id,HttpServletResponse response,HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        try{
            response.addHeader("Access-Control-Allow-Origin","*");
            response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
            map.put("id",id);
            Map<String,Object> model= exhibitionHallManager.findByNamedQueryMap("getHall", map);
            if(model!=null){
                Calendar calendar=Calendar.getInstance();
                calendar.setTime(new Date());
                calendar.add(Calendar.DAY_OF_YEAR,dayExh);
                map=new HashMap<String, Object>();
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
                model.put("webview",createWebView(hall,model.get("id").toString(),request));
            }
            return new JsonReaderSingleResponse(model,true,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"请求错误");
    }
    @RequestMapping("getExhs")
    public JsonReaderResponse getExhs(HttpServletRequest request,HttpServletResponse response){
        Map<String,Object> map=requestMap(request);
        try{
            response.addHeader("Access-Control-Allow-Origin","*");
            response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
            Object createDate=map.get("Q_exh.createDate");
            Object hname=map.get("Q_h.name");
            Object tradeNames=map.get("Q_exh.tradeNames");
            if(createDate==null && hname==null && tradeNames==null){
                map.put("Q_exh.idx","DESC");
            }
            map.put("Q_exh.publish_EQ",1);
            String host=request.getServerName();
            String contextPath=request.getContextPath();
            int port=request.getServerPort();
            String share="http://"+host+":"+port+contextPath+"/";
            List<Map<String,Object>> models= exhibitionManager.findByNamedQuery("getExhs", map, obtainStart(request), obtainLimit(request));
            if(models!=null && models.size()>0){
                Calendar calendar=Calendar.getInstance();
                for(Map<String,Object> objectMap:models){
                    objectMap.put("exhguide",createWebView(exhguide,objectMap.get("id").toString(),request));
                    objectMap.put("exhguideto",createWebView(exhguideto,objectMap.get("id").toString(),request));
                    objectMap.put("exhdes",createWebView(exhdes,objectMap.get("id").toString(),request));
                    objectMap.put("exhtravel",createWebView(exhtravel,objectMap.get("id").toString(),request));
                    objectMap.put("exhsponsor",createWebView(exhsponsor,objectMap.get("id").toString(),request));
                    Date startDate=parseDate(ObjectUtils.toString(objectMap.get("startDate")));
                    calendar.setTime(startDate);
                    calendar.add(Calendar.DAY_OF_YEAR,(0-dayExh));
                    if(calendar.getTime().before(new Date()) && startDate.after(new Date())){
                        objectMap.put("willStart",true);
                    }else{
                        objectMap.put("willStart",false);
                    }

                    objectMap.put("shareContent",share+"html/web/exhDetail/"+objectMap.get("id"));
                    String picUrl=ObjectUtils.toString(objectMap.get("picUrl"));
                    String logoUrl=ObjectUtils.toString(objectMap.get("logoUrl"));
                    objectMap.put("picUrl",imgUrl+picUrl);
                    objectMap.put("logoUrl",imgUrl+logoUrl);
                }
            }
            Integer count=exhibitionManager.findByNamedQueryClass("getExhsCount",Integer.class,map);
            return new JsonReaderResponse(models,true,count,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(null,false,"请求错误");
    }
    @RequestMapping("getExh/{id}")
    public JsonReaderSingleResponse getExh(@PathVariable Long id,HttpServletResponse response){
        Map<String,Object> map=new HashMap<String, Object>();
        try{
            response.addHeader("Access-Control-Allow-Origin","*");
            response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
            map.put("id",id);
            Map<String,Object> objectMap= exhibitionManager.findByNamedQueryMap("getExh", map);
            if(objectMap!=null){
                Calendar calendar=Calendar.getInstance();
                Date startDate=parseDate(ObjectUtils.toString(objectMap.get("startDate")));
                calendar.setTime(startDate);
                calendar.add(Calendar.DAY_OF_YEAR,(0-dayExh));
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
            return new JsonReaderSingleResponse(objectMap,true,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"请求错误");
    }
    @RequestMapping("getComments")
    public JsonReaderResponse getComments(HttpServletRequest request,HttpServletResponse response){
        response.addHeader("Access-Control-Allow-Origin","*");
        response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
        String itemId=request.getParameter("itemId");
        String type=request.getParameter("type");
        Map<String,Object> map=new HashMap<String, Object>();
        try{
            map.put("typeId", CommendType.valueOf(type).ordinal());
            map.put("itemId", parseLong(itemId));
            map.put("Q_r.createDate","DESC");
            List<Map<String,Object>> models= commentManager.findByNamedQuery("getComments", map, obtainStart(request), obtainLimit(request));
            Integer count=commentManager.findByNamedQueryClass("getCommentsCount",Integer.class,map);
            return new JsonReaderResponse(models,true,count,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(null,false,"请求错误");
    }
    @RequestMapping("comment")
    public JsonReaderSingleResponse save(HttpServletRequest request,HttpServletResponse response){
        response.addHeader("Access-Control-Allow-Origin","*");
        response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
        try{
            String username=request.getRemoteUser();
            if(org.apache.commons.lang.StringUtils.isEmpty(username)){
                return new JsonReaderSingleResponse(null,false,"登录超时");
            }
            String itemId=request.getParameter("itemId");
            String type=request.getParameter("type");
            String rank=request.getParameter("rank");
            String content=request.getParameter("content");
            User user=userManager.getUserByUsername(username);
            Comment comment=new Comment();
            comment.setCreateDate(new Date());
            comment.setItemId(parseLong(itemId));
            comment.setTypeId(CommendType.valueOf(type).ordinal());
            comment.setUserId(user.getId());
            comment.setRank(parseInteger(rank));
            comment.setContent(content);
            commentManager.save(comment);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("getExhGuide/{exhId}")
    public JsonReaderSingleResponse getExhGuide(@PathVariable Long exhId){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);
            ExhGuide exhGuide=exhGuideManager.getByParam(map);
            if(exhGuide!=null){
                return new JsonReaderSingleResponse(exhGuide,true);
            }
            return new JsonReaderSingleResponse(null,true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"获取失败");
    }
    @RequestMapping("getExhGuideTo/{exhId}")
    public JsonReaderSingleResponse getExhGuideTo(@PathVariable Long exhId){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);
            ExhGuideTo exhGuide=exhGuideToManager.getByParam(map);
            if(exhGuide!=null){
                return new JsonReaderSingleResponse(exhGuide,true);
            }
            return new JsonReaderSingleResponse(null,true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"获取失败");
    }
    @RequestMapping("getExhTravel/{exhId}")
    public JsonReaderSingleResponse getExhTravel(@PathVariable Long exhId){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);
            ExhTravel exhGuide=exhTravelManager.getByParam(map);
            if(exhGuide!=null){
                return new JsonReaderSingleResponse(exhGuide,true);
            }
            return new JsonReaderSingleResponse(null,true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"获取失败");
    }
    @RequestMapping("getExhDescription/{exhId}")
    public JsonReaderSingleResponse getExhDescription(@PathVariable Long exhId){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);
            ExhDescription exhGuide=exhDescriptionManager.getByParam(map);
            if(exhGuide!=null){
                return new JsonReaderSingleResponse(exhGuide,true);
            }
            return new JsonReaderSingleResponse(null,true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"获取失败");
    }
    @RequestMapping("getExhSponsor/{exhId}")
    public JsonReaderSingleResponse getExhSponsor(@PathVariable Long exhId){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",exhId);
            ExhSponsor exhGuide=exhSponsorManager.getByParam(map);
            if(exhGuide!=null){
                return new JsonReaderSingleResponse(exhGuide,true);
            }
            return new JsonReaderSingleResponse(null,true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"获取失败");
    }
    @RequestMapping("getExhNews")
    public JsonReaderResponse getExhNews(HttpServletRequest request){
        List<Map<String,Object>> models=new ArrayList<Map<String, Object>>();
        Map<String,Object> map=requestMap(request);
        try{
//            map.put("Q_createDate","DESC");
            Long id= NumberUtils.toLong(ObjectUtils.toString(map.get("Q_exhId_EQ")));

             models= exhNewsManager.getExhNews(id, obtainStart(request), obtainLimit(request));
            if(models!=null && models.size()>0){
                for(Map<String,Object> objectMap:models){
                    objectMap.put("webview",createWebView(news,objectMap.get("id").toString(),request));
                }
            }
            Integer count=exhNewsManager.getExhNewsCount(id);
            return new JsonReaderResponse(models,true,count,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }


        return new JsonReaderResponse(models,false,"请求错误");
    }
    @RequestMapping("getExhTrade")
    public JsonReaderResponse getExhTrade(HttpServletRequest request,HttpServletResponse response){
        try{
            response.addHeader("Access-Control-Allow-Origin","*");
            response.addHeader("Access-Control-Allow-Headers", "X-Requested-With");
            Long id=parseLong(obtain(request, "exhId"));
            Exhibition exhibition=exhibitionManager.get(id);
            if(exhibition!=null){
                String keywordNames = exhibition.getKeywordNames();
                List<Map<String,Object>> list=exhNewsManager.getExhTrade(keywordNames, obtainStart(request), obtainLimit(request));
                if(list!=null && list.size()>0){
                    for(Map<String,Object> objectMap:list){
                        objectMap.put("webview",createWebView(news,objectMap.get("id").toString(),request));
                    }
                }
                Integer count=exhNewsManager.getExhTradeCount(keywordNames);
                return new JsonReaderResponse(list,true,count,"");
            }
            return new JsonReaderResponse(new ArrayList(),true,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(null,false,"请求错误");
    }
    @RequestMapping("getExhPlans")
    public JsonReaderResponse exhplan(HttpServletRequest request,HttpServletResponse response){
        response.addHeader("Access-Control-Allow-Origin","*");
        response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
        List<Map<String,Object>> commands=new ArrayList<Map<String,Object>>();
        Map<String,Object> map=requestMap(request);
        map.put("Q_idx","DESC");
        map.put("Q_publish_EQ",1);
        try{
            commands= exhPlanManager.listPageMap(map, obtainStart(request), obtainLimit(request),"id","title","createDate","address","holdDate","outUrl");
            if(commands!=null && commands.size()>0){
                for(Map<String,Object> objectMap:commands){
                    objectMap.put("webview",createWebView(exhplan,objectMap.get("id").toString(),request));
                }
            }
            Integer count=exhPlanManager.count(map);
            return new JsonReaderResponse(commands,true,count,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("getExhPlan/{id}")
    public JsonReaderSingleResponse getExhPlan(@PathVariable Long id,HttpServletResponse response){
        response.addHeader("Access-Control-Allow-Origin","*");
        response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
        ExhPlan map=exhPlanManager.get(id);
        return new JsonReaderSingleResponse(map,true,"");
    }
    @RequestMapping("exhplanyear")
    public JsonReaderResponse exhplanyear(HttpServletRequest request) {
        List<Map<String,Object>> commands=exhPlanManager.listYears();
        return new JsonReaderResponse(commands,true,commands.size(),"");
    }
    @RequestMapping("getExhServices")
    public JsonReaderResponse getExhServices(HttpServletRequest request,HttpServletResponse response){
        response.addHeader("Access-Control-Allow-Origin","*");
        response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
        List<Map<String,Object>> commands=new ArrayList<Map<String,Object>>();
        Map<String,Object> map=requestMap(request);
        map.put("Q_idx","DESC");
        map.put("Q_publish_EQ",1);
        try{
            commands= exhServiceManager.listPageMap(map, obtainStart(request), obtainLimit(request),"id","title","createDate","lastUpdateDate");
            if(commands!=null && commands.size()>0){
                for(Map<String,Object> objectMap:commands){
                    objectMap.put("webview",createWebView(exhservice,objectMap.get("id").toString(),request));
                }
            }
            Integer count=exhServiceManager.count(map);
            return new JsonReaderResponse(commands,true,count,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("getExhService/{id}")
    public JsonReaderSingleResponse getExhService(@PathVariable Long id,HttpServletResponse response){
        response.addHeader("Access-Control-Allow-Origin","*");
        response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
        ExhService map=exhServiceManager.get(id);
        return new JsonReaderSingleResponse(map,true,"");
    }
    @RequestMapping("getNews")
    public JsonReaderResponse getNews(HttpServletRequest request,HttpServletResponse response){
        response.addHeader("Access-Control-Allow-Origin","*");
        response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
        List<Map<String,Object>> commands=new ArrayList<Map<String,Object>>();
        Map<String,Object> map=requestMap(request);
        map.put("Q_en.idx","DESC");
        map.put("Q_en.publish_EQ",1);
        try{
            commands= exhNewsManager.findByNamedQuery("getNews", map, obtainStart(request), obtainLimit(request));
            if(commands!=null && commands.size()>0){
                for(Map<String,Object> objectMap:commands){
                    objectMap.put("webview",createWebView(news,objectMap.get("id").toString(),request));
                }
            }
            map.remove("Q_en.publish_EQ");
            map.put("Q_publish_EQ", 1);
            Integer count=exhNewsManager.count(map);
            return new JsonReaderResponse(commands,true,count,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("getNew/{id}")
    public JsonReaderSingleResponse getNew(@PathVariable Long id,HttpServletResponse response){
        response.addHeader("Access-Control-Allow-Origin","*");
        response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
        Map<String,Object> params=new HashMap<String, Object>();
        params.put("id",id);
        Map<String,Object> map=exhNewsManager.findByNamedQueryMap("getNew", params);
        return new JsonReaderSingleResponse(map,true,"");
    }
    @RequestMapping("download")
    public ModelAndView download(HttpServletResponse response) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_enabled_EQ",1);
        map.put("Q_type_EQ",0);
        AppStore appStore=appStoreManager.getByParam(map);
        String u=appStore.getPacUrl();
        u=imgUrl+u;
        appStore.setPacUrl(u);
        return new ModelAndView("app/download","command",appStore);
    }
    @RequestMapping("repeatUrl")
    public JsonReaderSingleResponse repeatUrl(HttpServletResponse response){
        response.addHeader("Access-Control-Allow-Origin","*");
        response.addHeader("Access-Control-Allow-Headers","X-Requested-With");
        Map<String,Object> params=new HashMap<String, Object>();
        params.put("url",emailProp.getProperty("repeatUrl"));
        return new JsonReaderSingleResponse(params,true,"");
    }
    @RequestMapping("year")
    public ModelAndView repeatyear(HttpServletResponse response){
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("url",emailProp.get("repeatUrl"));

        return new ModelAndView("app/year","command",map);
    }






}
