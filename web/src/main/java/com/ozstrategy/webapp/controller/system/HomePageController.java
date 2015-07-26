package com.ozstrategy.webapp.controller.system;

import com.ozstrategy.Constants;
import com.ozstrategy.model.system.HomePage;
import com.ozstrategy.service.system.AdvertManager;
import com.ozstrategy.service.system.HomePageManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.system.HomePageCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
* Created by lihao1 on 2015-07-20.
*/
@RestController
@RequestMapping("homePage")
public class HomePageController extends BaseController {
    @Autowired
    private HomePageManager homePageManager;


    private static final String phoneKey="phone";
    private static final String addressKey="address";
    private static final String emailKey="email";
    private static final String zipCodeKey="zipCode";
    private static final String facsimileKey="facsimile";
    private static final String logoNameKey="logoName";
    private static final String icpKey="icp";
    private static final String copyrightKey="copyright";

    @RequestMapping("security/index")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        HomePageCommand command=new HomePageCommand();
        List<HomePage> models= homePageManager.list(new HashMap<String, Object>(),0,1);
        if(models!=null && models.size()>0){
            command=new HomePageCommand(models.get(0));
        }
        return new ModelAndView("system/homepage","command",command);
    }

    @RequestMapping(value = "security/upload")
    public ModelAndView upload(HttpServletRequest request, HttpServletResponse response) {
        String username    = request.getRemoteUser();
        String phone        = request.getParameter(phoneKey);
        String address = request.getParameter(addressKey);
        String email = request.getParameter(emailKey);
        String zipCode = request.getParameter(zipCodeKey);
        String facsimile = request.getParameter(facsimileKey);
        String copyright = request.getParameter(copyrightKey);
        String icp = request.getParameter(icpKey);
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

        HomePage homePage=null;
        if(isEmpty(id)){
            homePage=new HomePage();
        }else{
            homePage=homePageManager.get(parseLong(id));
        }
        homePage.setEmail(email);
        homePage.setPhone(phone);
        homePage.setAddress(address);
        homePage.setZipCode(zipCode);
        homePage.setFacsimile(facsimile);
        homePage.setCopyright(copyright);
        homePage.setIcp(icp);
        String attachDir = randomAbsolutePath(request, Constants.updloadAdvert);
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
                if(StringUtils.equals(controlName,"logo")){
                    logo1Name    = fileItem.getName();
                    if(isEmpty(logo1Name)){
                        continue;
                    }
                    String str         = randomName(logo1Name);
                    fileOnServer      = new File(attachDir,str);
                    logo1Path=fileOnServer.getAbsolutePath();
                    logo1Url=toHttpUrl(request,true)+Constants.updloadAdvert+"/"+str;
                    fileItem.write(fileOnServer);
                }
            }
            if(StringUtils.isNotEmpty(logo1Name)){
                try{
                    FileUtils.forceDelete(new File(homePage.getLogoPath()));
                }catch (Exception e){
                }
                homePage.setLogoName(logo1Name);
                homePage.setLogoPath(logo1Path);
                homePage.setLogoUrl(logo1Url);
            }
            homePageManager.saveOrUpdate(homePage);
            writer.print("{\"success\":true,\"data\":"+homePage.getId()+",\"msg\":\"" + "" + "\"}");

        } catch (Exception e) {
            logger.error("upload sensor fail", e);

            String msg = "上传失败";
            writer.print("{\"success\":false,\"msg\":\"" + msg + "!\"}");
            e.printStackTrace();

            if (fileOnServer != null) {
                try {
                    FileUtils.forceDelete(fileOnServer);
                } catch (IOException e1) { }
            }

        }
        writer.close();
        return null;
    }
    @RequestMapping("list")
    public JsonReaderResponse<HomePageCommand> list(HttpServletRequest request){
        List<HomePageCommand> commands=new ArrayList<HomePageCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<HomePage> models= homePageManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(HomePage model:models){
                        HomePageCommand command=new HomePageCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=homePageManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("save")
    public JsonReaderSingleResponse<HomePageCommand> save(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("delete")
    public JsonReaderSingleResponse<HomePageCommand> delete(HttpServletRequest request){
        try{

            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
