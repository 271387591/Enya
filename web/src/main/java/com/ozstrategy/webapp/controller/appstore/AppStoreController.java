package com.ozstrategy.webapp.controller.appstore;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.ozstrategy.Constants;
import com.ozstrategy.model.appstore.AppStore;
import com.ozstrategy.model.appstore.AppStorePlat;
import com.ozstrategy.service.appstore.AppStoreManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.appstore.AppStoreCommand;
import com.ozstrategy.webapp.command.user.UserCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
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
import java.util.*;

/**
* Created by lihao1 on 2015-07-11.
*/
@RestController
@RequestMapping("appstore")
public class AppStoreController extends BaseController {
    @Autowired
    private AppStoreManager appStoreManager;
    @RequestMapping("security/index")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("appstore/appstore");
    }
    @RequestMapping("security/appList")
    public ModelAndView appList(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("appstore/appList");
    }
    @RequestMapping("security/detail/{id}")
    public ModelAndView appList(@PathVariable Long id) {
        AppStore appStore=appStoreManager.get(id);
        AppStoreCommand command=new AppStoreCommand();
        if(appStore!=null){
            command=new AppStoreCommand(appStore);
        }
        return new ModelAndView("appstore/appDetail","command",command);
    }


    @RequestMapping("security/list")
    public JsonReaderResponse<AppStoreCommand> list(HttpServletRequest request){
        List<AppStoreCommand> commands=new ArrayList<AppStoreCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<AppStore> models= appStoreManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(AppStore model:models){
                        AppStoreCommand command=new AppStoreCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=appStoreManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
    @RequestMapping("security/addApp")
    public ModelAndView games(HttpServletRequest request, HttpServletResponse response) {
        AppStoreCommand command=null;
        try{

            String id=request.getParameter("id");
            if(id==null){
                command=new AppStoreCommand();
            }else{
                command=new AppStoreCommand(appStoreManager.get(parseLong(id)));
            }
        }catch (Exception e){
            logger.error("addUser fail",e);
        }
        return new ModelAndView("appstore/addApp","command",command);
    }
    @RequestMapping(value = "security/upload")
    public ModelAndView upload(HttpServletRequest request, HttpServletResponse response) {
        String username    = request.getRemoteUser();
        String version        = request.getParameter("version");
        String enabled = request.getParameter("enabled");
        String id = request.getParameter("id");
        String plat = request.getParameter("plat");
        String type = request.getParameter("type");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
        } catch (IOException e) { }

        if (writer == null) {
            return null;
        }



        AppStore advert=null;
        if(StringUtils.isEmpty(id)){
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_version_EQ",version);
            map.put("Q_type_EQ",parseInteger(type));
            advert=appStoreManager.getByParam(map);
            if(advert!=null){
                String msg = "该版本已存在";
                writer.print("{\"success\":false,\"msg\":\"" + msg + "!\"}");
                return null;
            }
            advert=new AppStore();
            advert.setCreateDate(new Date());
        }else{
            advert=appStoreManager.get(parseLong(id));

        }
        advert.setType(parseInteger(type));
        advert.setVersion(version);
        advert.setPlat(AppStorePlat.valueOf(plat).ordinal());
        advert.setEnabled(BooleanUtils.toBoolean(enabled));
        String attachDir = randomAbsolutePath(request,Constants.updloadApp);
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
                String str = randomName(logo1Name);

                fileOnServer = new File(attachDir,str);
                logo1Path=fileOnServer.getAbsolutePath();
                logo1Url=toHttpUrl(request,true)+Constants.updloadApp+"/"+str;
                fileItem.write(fileOnServer);
            }
            if(StringUtils.isNotEmpty(logo1Name)){
                try{
                    FileUtils.forceDelete(new File(advert.getPacPath()));
                }catch (Exception e){
                }
                advert.setPacName(logo1Name);
                advert.setPacPath(logo1Path);
                advert.setPacUrl(logo1Url);
                String qrName=UUID.randomUUID().toString()+".png";
                String qrUrl=toHttpUrl(request,true)+Constants.updloadApp+"/"+qrName;
                String qrPath=FilenameUtils.normalize(attachDir+"/"+qrName);
                String text=advert.getPacUrl();
                int width = 193;
                int height = 193;
                String format = "png";
                Hashtable hints= new Hashtable();
                hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
                BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height,hints);
                File outputFile = new File(qrPath);
                MatrixToImageWriter.writeToStream(bitMatrix, format, FileUtils.openOutputStream(outputFile));
                advert.setQrName(qrName);
                advert.setQrPath(qrPath);
                advert.setQrUrl(qrUrl);
            }
            appStoreManager.saveApp(advert);
            writer.print("{\"success\":true,\"msg\":\"" + "" + "!\"}");

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

    @RequestMapping("security/delete/{id}")
    public JsonReaderSingleResponse<AppStoreCommand> delete(@PathVariable Long id){
        try{
            AppStore appStore=appStoreManager.get(id);
            appStoreManager.delete(appStore);
            return new JsonReaderSingleResponse("",Boolean.TRUE);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
     @RequestMapping("security/update/{id}")
    public JsonReaderSingleResponse<AppStoreCommand> update(@PathVariable Long id){
        try{
            AppStore appStore=appStoreManager.get(id);
            appStore.setEnabled(true);
            appStoreManager.updateApp(appStore);
            return new JsonReaderSingleResponse("",Boolean.TRUE);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
     @RequestMapping("getQr")
    public JsonReaderSingleResponse<AppStoreCommand> update(){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_enabled_EQ",true);
            AppStore appStore=appStoreManager.getByParam(map);
            return new JsonReaderSingleResponse(new AppStoreCommand(appStore),Boolean.TRUE);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }


}
