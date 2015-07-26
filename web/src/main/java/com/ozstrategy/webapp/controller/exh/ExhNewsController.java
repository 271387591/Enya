package com.ozstrategy.webapp.controller.exh;

import com.ozstrategy.model.dictionary.Dictionary;
import com.ozstrategy.model.exh.ExhNews;
import com.ozstrategy.model.exh.ExhSponsor;
import com.ozstrategy.model.exh.Exhibition;
import com.ozstrategy.service.dictionary.DictionaryManager;
import com.ozstrategy.service.exh.ExhNewsManager;
import com.ozstrategy.service.exh.ExhibitionManager;
import com.ozstrategy.webapp.command.JsonReaderResponse;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.dictionary.DictionaryCommand;
import com.ozstrategy.webapp.command.exh.ExhNewsCommand;
import com.ozstrategy.webapp.command.exh.ExhSponsorCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
* Created by lihao1 on 2015-07-16.
*/
@RestController
@RequestMapping("exhNews")
public class ExhNewsController extends BaseController {
    @Autowired
    private ExhNewsManager exhNewsManager;
    @Autowired
    private DictionaryManager dictionaryManager;
    @Autowired
    private ExhibitionManager exhibitionManager;


    @RequestMapping("security/newsList/{exhId}")
    public ModelAndView userList(@PathVariable Long exhId) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("id",exhId);
        return new ModelAndView("exh/newsList","exh",map);
    }
    @RequestMapping("security/addNews/{exhId}")
    public ModelAndView games(@PathVariable Long exhId) {
        ExhNewsCommand exhNewsCommand=new ExhNewsCommand();
        exhNewsCommand.setExhId(exhId);
        return new ModelAndView("exh/addNews","command",exhNewsCommand);
    }
    @RequestMapping("security/editNews/{exhId}/{id}")
    public ModelAndView editNews(@PathVariable Long exhId,@PathVariable Long id) {
        ExhNews exhNews=exhNewsManager.get(id);
        return new ModelAndView("exh/addNews","command",new ExhNewsCommand(exhNews));
    }


    @RequestMapping("list")
    public JsonReaderResponse<ExhNewsCommand> list(HttpServletRequest request){
        List<ExhNewsCommand> commands=new ArrayList<ExhNewsCommand>();
            Map<String,Object> map=requestMap(request);
            try{
            List<ExhNews> models= exhNewsManager.list(map,obtainStart(request),obtainLimit(request));
                if(models!=null && models.size()>0){
                    for(ExhNews model:models){
                        ExhNewsCommand command=new ExhNewsCommand(model);
                        commands.add(command);
                    }
                }
                Integer count=exhNewsManager.count(map);
                return new JsonReaderResponse(commands,true,count,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(commands,false,"请求错误");
    }
     @RequestMapping("getExhTrade")
    public JsonReaderResponse getExhTrade(HttpServletRequest request){
            try{
                Long id=parseLong(obtain(request,"exhId"));
                Exhibition exhibition=exhibitionManager.get(id);
                if(exhibition!=null){
                    String keywordNames = exhibition.getKeywordNames();
                    List<Map<String,Object>> list=exhNewsManager.getExhTrade(keywordNames, obtainStart(request), obtainLimit(request));
                    Integer count=exhNewsManager.getExhTradeCount(keywordNames);
                    return new JsonReaderResponse(list,true,count,"");
                }
                return new JsonReaderResponse(new ArrayList(),true,"");
            }catch (Exception e){
                logger.error("list fail",e);
            }
            return new JsonReaderResponse(null,false,"请求错误");
    }

    @RequestMapping("security/save")
    public JsonReaderSingleResponse<ExhNewsCommand> save(@RequestBody ExhNewsCommand command){
        try{
            Long id=command.getId();
            ExhNews news=null;
            if(id==null){
                news=new ExhNews();
                news.setCreateDate(new Date());
            }else{
                news=exhNewsManager.get(id);
            }

            news.setExhId(command.getExhId());
            news.setTitle(command.getTitle());
            news.setTitle(command.getTitle());
            String description=command.getNews();
            if(isNotEmpty(description)){
                description=description.replaceAll("\r|\n","");
            }
            news.setNews(description);
            Set<Long> keyIds=new HashSet<Long>();
            Set<String> keyNames=new HashSet<String>();
            String keyword=command.getKeywordIds();
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
            news.setKeywordIds(StringUtils.join(keyIds,","));
            news.setKeywordNames(StringUtils.join(keyNames, ","));
            exhNewsManager.saveOrUpdate(news);
            return new JsonReaderSingleResponse(true);
        }catch (Exception e){
            logger.error("save fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"保存失败");
    }
    @RequestMapping("security/delete/{id}")
    public JsonReaderSingleResponse<ExhNewsCommand> delete(@PathVariable Long id){
        try{
            ExhNews exhNews=exhNewsManager.get(id);
            if(exhNews!=null){
                exhNewsManager.delete(exhNews);
            }
            return new JsonReaderSingleResponse(new ExhNewsCommand(exhNews),true);
        }catch (Exception e){
            logger.error("delete fail",e);
        }
        return new JsonReaderSingleResponse(null,false,"删除失败");
    }
}
