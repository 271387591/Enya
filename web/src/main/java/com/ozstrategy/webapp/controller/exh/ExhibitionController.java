package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.Constants;
import com.ozstrategy.model.dictionary.Dictionary;
import com.ozstrategy.model.exh.ExhDescription;
import com.ozstrategy.model.exh.ExhGuide;
import com.ozstrategy.model.exh.ExhGuideTo;
import com.ozstrategy.model.exh.ExhSponsor;
import com.ozstrategy.model.exh.ExhTravel;
import com.ozstrategy.model.exh.Exhibition;
import com.ozstrategy.model.exh.ExhibitionHall;
import com.ozstrategy.service.dictionary.DictionaryManager;
import com.ozstrategy.service.exh.ExhDescriptionManager;
import com.ozstrategy.service.exh.ExhGuideManager;
import com.ozstrategy.service.exh.ExhGuideToManager;
import com.ozstrategy.service.exh.ExhSponsorManager;
import com.ozstrategy.service.exh.ExhTravelManager;
import com.ozstrategy.service.exh.ExhibitionHallManager;
import com.ozstrategy.service.exh.ExhibitionManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.exh.ExhTravelCommand;
import com.ozstrategy.webapp.command.exh.ExhibitionCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.ObjectUtils;
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
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
* Created by lihao1 on 2015-07-13.
*/
@RestController
@RequestMapping("exhibition")
public class ExhibitionController extends BaseController {
    @Autowired
    private ExhibitionManager exhibitionManager;
    @Autowired
    private DictionaryManager dictionaryManager;
    @Autowired
    private ExhDescriptionManager exhDescriptionManager;
    @Autowired
    private ExhGuideManager exhGuideManager;
    @Autowired
    private ExhGuideToManager exhGuideToManager;
    @Autowired
    private ExhSponsorManager exhSponsorManager;
    @Autowired
    private ExhTravelManager exhTravelManager;
    @Autowired
    private ExhibitionHallManager exhibitionHallManager;





    @RequestMapping("security/index")
    public ModelAndView tables(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("exh/exhibition");
    }
    @RequestMapping("security/add")
    public ModelAndView games(HttpServletRequest request, HttpServletResponse response) {
        ExhibitionCommand command=new ExhibitionCommand();
        return new ModelAndView("exh/addExhibition","command",command);
    }
    @RequestMapping("security/edit/{id}")
    public ModelAndView edit(@PathVariable Long id) {
        ExhibitionCommand command=new ExhibitionCommand();
        try{
            command=new ExhibitionCommand(exhibitionManager.get(id));
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_exhId_EQ",id);
            ExhDescription exhDescription=exhDescriptionManager.getByParam(map);
            if(exhDescription!=null){
                command.setDescription(exhDescription.getDescription());
            }
            ExhGuide exhGuide=exhGuideManager.getByParam(map);
            if(exhGuide!=null){
                command.setGuide(exhGuide.getGuide());
            }
            ExhGuideTo exhGuideTo=exhGuideToManager.getByParam(map);
            if(exhGuideTo!=null){
                command.setGuideTo(exhGuideTo.getGuideTo());
            }
            ExhSponsor exhSponsor=exhSponsorManager.getByParam(map);
            if(exhSponsor!=null){
                command.setSponsor(exhSponsor.getSponsor());
            }
            ExhTravel exhTravel=exhTravelManager.getByParam(map);
            if(exhTravel!=null){
                command.setTravel(exhTravel.getTravel());
            }
            ExhibitionHall hall=exhibitionHallManager.get(command.getHallId());
            if(hall!=null){
                command.setLng(hall.getLng());
                command.setLat(hall.getLat());
            }
        }catch (Exception e){
            logger.error("addAdvert fail",e);
        }
        return new ModelAndView("exh/addExhibition","command",command);
    }
    @RequestMapping("list")
    public JsonReaderResponse list(HttpServletRequest request){
        Map<String,Object> map=requestMap(request);
        try{
            Object createDate=map.get("Q_exh.createDate");
            Object hname=map.get("Q_h.name");
            Object tradeNames=map.get("Q_exh.tradeNames");
            if(createDate==null && hname==null && tradeNames==null){
                map.put("Q_exh.createDate","DESC");
            }
            List<Map<String,Object>> models= exhibitionManager.findByNamedQuery("getExhs", map, obtainStart(request), obtainLimit(request));
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
            Integer count=exhibitionManager.findByNamedQueryClass("getExhsCount",Integer.class,map);
            return new JsonReaderResponse(models,true,count,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderResponse(null,false,"请求错误");
    }
    @RequestMapping("getExh/{id}")
    public JsonReaderSingleResponse getHall(@PathVariable Long id){
        Map<String,Object> map=new HashMap<String, Object>();
        try{
            map.put("id",id);
            Map<String,Object> objectMap= exhibitionManager.findByNamedQueryMap("getExh", map);
            if(objectMap!=null){
                Calendar calendar=Calendar.getInstance();
                Date startDate=parseDate(ObjectUtils.toString(objectMap.get("startDate")));
                calendar.setTime(startDate);
                calendar.add(Calendar.DATE,-3);
                if(calendar.getTime().before(new Date())){
                    objectMap.put("willStart",true);
                }else{
                    objectMap.put("willStart",false);
                }
            }
            return new JsonReaderSingleResponse(objectMap,true,"");
        }catch (Exception e){
            logger.error("list fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"请求错误");
    }
    @RequestMapping("security/save")
    public JsonReaderSingleResponse<ExhibitionCommand> save(HttpServletRequest request){
        try{
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping(value = "security/upload")
    public ModelAndView upload(HttpServletRequest request, HttpServletResponse response) {
        String username    = request.getRemoteUser();
        String name        = request.getParameter("name");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String hallId = request.getParameter("hallId");
        String trade = request.getParameter("trade");
        String keyword = request.getParameter("keyword");
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
        Exhibition advert=null;
        if(StringUtils.isEmpty(id)){
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_name_EQ",name);
            advert=exhibitionManager.getByParam(map);
            if(advert!=null){
                String msg = "该展会已存在";
                writer.print("{\"success\":false,\"msg\":\"" + msg + "!\"}");
                return null;
            }
            advert=new Exhibition();
            advert.setCreateDate(new Date());
        }else{
            advert=exhibitionManager.get(parseLong(id));
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_name_EQ",name);
            Exhibition hall=exhibitionManager.getByParam(map);
            if(hall!=null && hall.getId()!=advert.getId()){
                String msg = "该展会已存在";
                writer.print("{\"success\":false,\"msg\":\"" + msg + "!\"}");
                return null;
            }
        }
        advert.setHallId(parseLong(hallId));
        advert.setStartDate(parseDate(startDate));
        advert.setEndDate(parseDate(endDate));
        advert.setName(name);


        String attachDir = randomAbsolutePath(request, Constants.updloadExh);
        File fileOnServer = null;
        String logo1Name=null,logo1Url=null,logo1Path=null,logo2Name=null,logo2Url=null,logo2Path=null;;
        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            Iterator list             = multipartRequest.getFileNames();
            while (list.hasNext()) {
                String               controlName = list.next().toString();
                MultipartFile file        = multipartRequest.getFile(controlName);
                CommonsMultipartFile cmf         = (CommonsMultipartFile) file;
                DiskFileItem fileItem    = (DiskFileItem) cmf.getFileItem();
                if(StringUtils.equals(controlName,"pic")){
                    logo1Name    = fileItem.getName();
                    if(isEmpty(logo1Name)){
                        continue;
                    }
                    String str         = randomName(logo1Name);
                    fileOnServer      = new File(attachDir,str);
                    logo1Path=fileOnServer.getAbsolutePath();
                    logo1Url=toHttpUrl(request,true)+Constants.updloadExh+"/"+str;

                }else if(StringUtils.equals(controlName,"picLogo")){
                    logo2Name    = fileItem.getName();
                    if(isEmpty(logo2Name)){
                        continue;
                    }
                    String str         = randomName(logo2Name);
                    fileOnServer      = new File(attachDir,str);
                    logo2Path=fileOnServer.getAbsolutePath();
                    logo2Url=toHttpUrl(request,true)+Constants.updloadExh+"/"+str;
                }
                fileItem.write(fileOnServer);
            }
            if(StringUtils.isNotEmpty(logo1Name)){
                try{
                    FileUtils.forceDelete(new File(advert.getPicPath()));
                }catch (Exception e){
                }
                advert.setPicName(logo1Name);
                advert.setPicPath(logo1Path);
                advert.setPicUrl(logo1Url);
            }
            if(StringUtils.isNotEmpty(logo2Name)){
                try{
                    FileUtils.forceDelete(new File(advert.getLogoPath()));
                }catch (Exception e){
                }
                advert.setLogoName(logo2Name);
                advert.setLogoPath(logo2Path);
                advert.setLogoUrl(logo2Url);
            }

            Set<Long> trIds=new HashSet<Long>();
            Set<String> trNames=new HashSet<String>();
            if(isNotEmpty(trade)){
                String[] trades=trade.split(",");
                for(String tr:trades){
                    Dictionary dictionary=dictionaryManager.get(parseLong(tr));
                    if(dictionary!=null){
                        trIds.add(dictionary.getId());
                        trNames.add(dictionary.getKeyValue());
                    }
                }
            }
            Set<Long> keyIds=new HashSet<Long>();
            Set<String> keyNames=new HashSet<String>();
            if(isNotEmpty(keyword)){
                String[] kes=keyword.split(",");
                for(String tr:kes){
                    Dictionary dictionary=dictionaryManager.get(parseLong(tr));
                    if(dictionary!=null){
                        keyIds.add(dictionary.getId());
                        keyNames.add(dictionary.getKeyValue());
                    }
                }
            }
            advert.setTradeIds(StringUtils.join(trIds,","));
            advert.setTradeNames(StringUtils.join(trNames, ","));
            advert.setKeywordIds(StringUtils.join(keyIds, ","));
            advert.setKeywordNames(StringUtils.join(keyNames, ","));
            advert=exhibitionManager.saveOrUpdate(advert);
            writer.print("{\"success\":true,\"data\":"+advert.getId()+",\"msg\":\"" + "" + "\"}");

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
    public JsonReaderSingleResponse<ExhibitionCommand> delete(@PathVariable Long id){
        try{
            Exhibition exhibition=exhibitionManager.get(id);
            if(exhibition!=null){
                exhibitionManager.deleteExh(exhibition);
            }
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }

}
