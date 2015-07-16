package com.ozstrategy.webapp.controller.ue;

import com.ozstrategy.Constants;
import com.ozstrategy.webapp.controller.BaseController;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
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
 * Created by lihao1 on 7/15/15.
 */
@RestController
@RequestMapping(value = "ue")
public class UeditorController extends BaseController {

    String[] picFileType = {".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp"};
    @RequestMapping(value = "security/upload")
    public ModelAndView upload(HttpServletRequest request, HttpServletResponse response) {
        String type        = request.getParameter("type");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
        } catch (IOException e) { }

        if (writer == null) {
            return null;
        }

        String attachDir = randomAbsolutePath(request,Constants.updloadUe);
        File fileOnServer = null;

        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            Iterator list             = multipartRequest.getFileNames();
            while (list.hasNext()) {
                String               controlName = list.next().toString();
                MultipartFile file        = multipartRequest.getFile(controlName);
                CommonsMultipartFile cmf         = (CommonsMultipartFile) file;
                DiskFileItem fileItem    = (DiskFileItem) cmf.getFileItem();
                String fileName=null,str=null,ext=null;
                fileName    = fileItem.getName();
                str         = randomName(fileName);
                ext=getExtension(fileName);
                if(Arrays.binarySearch(picFileType, ext)==-1){
                    continue;
                }
                fileOnServer      = new File(attachDir,str);
                fileItem.write(fileOnServer);
                String httpPath=Constants.updloadUe+"/"+str;
                String callback = request.getParameter("callback");
                String result = "{\"name\":\""+ fileOnServer.getName() +"\", \"originalName\": \""+ fileItem.getName() +"\", \"size\": "+ fileItem.getSize() +", \"state\": \"SUCCESS\", \"type\": \""+ ext +"\", \"url\": \""+ httpPath +"\"}";
                result = result.replaceAll( "\\\\", "\\\\" );
                if( callback == null ){
                    writer.print( result);
                }else{
                    writer.print("<script>" + callback + "(" + result + ")</script>");
                }
            }

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
        return null;
    }
}
