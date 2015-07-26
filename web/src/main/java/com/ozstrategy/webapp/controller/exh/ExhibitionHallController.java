package com.ozstrategy.webapp.controller.exh;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.ozstrategy.Constants;
import com.ozstrategy.model.appstore.AppStore;
import com.ozstrategy.model.appstore.AppStorePlat;
import com.ozstrategy.model.exh.Exhibition;
import com.ozstrategy.model.exh.ExhibitionHall;
import com.ozstrategy.service.exh.ExhibitionHallManager;
import com.ozstrategy.service.exh.ExhibitionManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.dictionary.DictionaryCommand;
import com.ozstrategy.webapp.command.exh.ExhibitionHallCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
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
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;

/**
* Created by lihao1 on 2015-07-13.
*/
@RestController
@RequestMapping("exhibitionHall")
public class ExhibitionHallController extends BaseController {
    @Autowired
    private ExhibitionHallManager exhibitionHallManager;
    @Autowired
    private ExhibitionManager exhibitionManager;

    @RequestMapping("security/index")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("exh/hall");
    }
    @RequestMapping("security/add")
    public ModelAndView games(HttpServletRequest request, HttpServletResponse response) {
        ExhibitionHallCommand command=new ExhibitionHallCommand();
        return new ModelAndView("exh/addHall","command",command);
    }
    @RequestMapping("security/edit/{id}")
    public ModelAndView edit(@PathVariable Long id) {
        ExhibitionHallCommand command=new ExhibitionHallCommand();
        try{
            command=new ExhibitionHallCommand(exhibitionHallManager.get(id));
        }catch (Exception e){
            logger.error("addAdvert fail",e);
        }
        return new ModelAndView("exh/addHall","command",command);
    }

    @RequestMapping("list")
    public JsonReaderResponse<ExhibitionHallCommand> list(HttpServletRequest request){
        Map<String,Object> map=requestMap(request);
        try{
            map.put("Q_t.createDate","DESC");
            List<Map<String,Object>> models= exhibitionHallManager.findByNamedQuery("getHalls", map, obtainStart(request), obtainLimit(request));
            Integer count=exhibitionHallManager.findByNamedQueryClass("getHallsCount", Integer.class, map);
            return new JsonReaderResponse(models,true,count,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(null,false,"请求错误");
    }
    @RequestMapping("getHall/{id}")
    public JsonReaderSingleResponse getHall(@PathVariable Long id){
        Map<String,Object> map=new HashMap<String, Object>();
        try{
            map.put("id",id);
            Map<String,Object> model= exhibitionHallManager.findByNamedQueryMap("getHall", map);
            return new JsonReaderSingleResponse(model,true,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"请求错误");
    }

    @RequestMapping(value = "security/upload")
    public ModelAndView upload(HttpServletRequest request, HttpServletResponse response) {
        String username    = request.getRemoteUser();
        String name        = request.getParameter("name");
        String address = request.getParameter("address");
        String id = request.getParameter("id");
        String description = request.getParameter("description");
        if(isNotEmpty(description)){
            description=description.replaceAll("\r|\n","");
        }
        String lat = request.getParameter("lat");
        String lng = request.getParameter("lng");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
        } catch (IOException e) { }

        if (writer == null) {
            return null;
        }
        ExhibitionHall advert=null;
        if(StringUtils.isEmpty(id)){
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_name_EQ",name);
            advert=exhibitionHallManager.getByParam(map);
            if(advert!=null){
                String msg = "该展馆已存在";
                writer.print("{\"success\":false,\"msg\":\"" + msg + "!\"}");
                return null;
            }
            advert=new ExhibitionHall();
            advert.setCreateDate(new Date());
        }else{
            advert=exhibitionHallManager.get(parseLong(id));
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_name_EQ",name);
            ExhibitionHall hall=exhibitionHallManager.getByParam(map);
            if(hall!=null && hall.getId()!=advert.getId()){
                String msg = "该展馆已存在";
                writer.print("{\"success\":false,\"msg\":\"" + msg + "!\"}");
                return null;
            }
        }
        advert.setDescription(description);
        advert.setAddress(address);
        advert.setLat(NumberUtils.toFloat(lat));
        advert.setLng(NumberUtils.toFloat(lng));
        advert.setUpdateDate(new Date());
        advert.setName(name);

        String attachDir = randomAbsolutePath(request,Constants.updloadHall);
        File fileOnServer = null;
        String logo1Name=null,logo1Url=null,logo1Path=null,logo2Name=null,logo2Url=null,logo2Path=null;
        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            Iterator list             = multipartRequest.getFileNames();
            while (list.hasNext()) {
                String               controlName = list.next().toString();
                MultipartFile file        = multipartRequest.getFile(controlName);
                CommonsMultipartFile cmf         = (CommonsMultipartFile) file;
                DiskFileItem fileItem    = (DiskFileItem) cmf.getFileItem();

                if(StringUtils.equals(controlName,"logo1")){
                    logo1Name    = fileItem.getName();
                    if(isEmpty(logo1Name)){
                        continue;
                    }
                    String str         = randomName(logo1Name);
                    fileOnServer      = new File(attachDir,str);
                    logo1Path=fileOnServer.getAbsolutePath();
                    logo1Url=toHttpUrl(request,true)+Constants.updloadHall+"/"+str;

                }else if(StringUtils.equals(controlName,"logo2")){
                    logo2Name    = fileItem.getName();
                    if(isEmpty(logo2Name)){
                        continue;
                    }
                    String str         = randomName(logo2Name);
                    fileOnServer      = new File(attachDir,str);
                    logo2Path=fileOnServer.getAbsolutePath();
                    logo2Url=toHttpUrl(request,true)+Constants.updloadHall+"/"+str;
                }
                fileItem.write(fileOnServer);
            }
            if(StringUtils.isNotEmpty(logo1Name)){
                try{
                    FileUtils.forceDelete(new File(advert.getLogo1Path()));
                }catch (Exception e){
                }
                advert.setLogo1Name(logo1Name);
                advert.setLogo1Path(logo1Path);
                advert.setLogo1Url(logo1Url);
            }
             if(StringUtils.isNotEmpty(logo2Name)){
                try{
                    FileUtils.forceDelete(new File(advert.getLogo2Path()));
                }catch (Exception e){
                }
                 advert.setLogo2Name(logo2Name);
                 advert.setLogo2Path(logo2Path);
                 advert.setLogo2Url(logo2Url);
             }
            exhibitionHallManager.saveOrUpdate(advert);
            writer.print("{\"success\":true,\"msg\":\"" + "" + "\"}");

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
    public JsonReaderSingleResponse<ExhibitionHallCommand> delete(@PathVariable Long id){
        try{
            ExhibitionHall exhibitionHall=exhibitionHallManager.get(id);
            if(exhibitionHall!=null){
                exhibitionHallManager.delete(exhibitionHall);
            }
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
    @RequestMapping("security/checkExh/{id}")
    public JsonReaderSingleResponse<ExhibitionHallCommand> checkExh(@PathVariable Long id){
        try{
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_hallId_EQ",id);
            Exhibition exhibition=exhibitionManager.getByParam(map);
            if(exhibition!=null){
                return new JsonReaderSingleResponse(true,true,"");
            }else{
                return new JsonReaderSingleResponse(false,true,"");
            }
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }

    @RequestMapping("security/hot/{id}")
    public JsonReaderSingleResponse<ExhibitionHallCommand> setHot(@PathVariable Long id){
        try{
            ExhibitionHall exhibitionHall=exhibitionHallManager.get(id);
            if(exhibitionHall!=null){
                if(exhibitionHall.getHot()){
                    exhibitionHall.setHot(Boolean.FALSE);
                }else{
                    exhibitionHall.setHot(Boolean.TRUE);
                }
                exhibitionHall.setUpdateDate(new Date());
                exhibitionHallManager.update(exhibitionHall);
            }
            return new JsonReaderSingleResponse(exhibitionHall.getHot(),true,"");
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"设置失败");
    }


}
