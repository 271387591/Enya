package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.ExhDescriptionDao;
import com.ozstrategy.dao.exh.ExhGuideDao;
import com.ozstrategy.dao.exh.ExhGuideToDao;
import com.ozstrategy.dao.exh.ExhNewsDao;
import com.ozstrategy.dao.exh.ExhSponsorDao;
import com.ozstrategy.dao.exh.ExhTravelDao;
import com.ozstrategy.dao.exh.ExhibitionDao;
import com.ozstrategy.model.dictionary.Dictionary;
import com.ozstrategy.model.exh.ExhDescription;
import com.ozstrategy.model.exh.ExhGuide;
import com.ozstrategy.model.exh.ExhGuideTo;
import com.ozstrategy.model.exh.ExhNews;
import com.ozstrategy.model.exh.ExhSponsor;
import com.ozstrategy.model.exh.ExhTravel;
import com.ozstrategy.model.exh.Exhibition;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.ExhibitionManager;
import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.poi.xslf.model.geom.Guide;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("exhibitionManager")
public class ExhibitionManagerImpl extends BaseManagerImpl<Exhibition> implements ExhibitionManager {
    @Autowired
    private ExhibitionDao exhibitionDao;
    @Autowired
    private ExhDescriptionDao exhDescriptionDao;
    @Autowired
    private ExhNewsDao exhNewsDao;
    @Autowired
    private ExhGuideDao exhGuideDao;
    @Autowired
    private ExhGuideToDao exhGuideToDao;
    @Autowired
    private ExhTravelDao exhTravelDao;
    @Autowired
    private ExhSponsorDao exhSponsorDao;
    @Override
    public BaseDao<Exhibition> baseDao() {
        return exhibitionDao;
    }

    @Override
    public void deleteExh(Exhibition exhibition) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_exhId_EQ",exhibition.getId());
        exhDescriptionDao.deleteByParam(map);
        exhNewsDao.deleteByParam(map);
        exhGuideDao.deleteByParam(map);
        exhGuideToDao.deleteByParam(map);
        exhTravelDao.deleteByParam(map);
        exhSponsorDao.deleteByParam(map);
        exhibitionDao.delete(exhibition);
    }

    @Override
    @Cacheable(value = "exhCache",key = "#id")
    public Map<String, Object> exhDetail(Long id) {

        Map<String,Object> map=new HashMap<String, Object>();
        map.put("id",id);
        Map<String,Object> objectMap=exhibitionDao.findByNamedQueryMap("getExh", map);
        if(objectMap!=null && objectMap.size()>0){
            Calendar calendar=Calendar.getInstance();
            Date startDate= null;
            try {
                startDate = DateUtils.parseDate(ObjectUtils.toString(objectMap.get("startDate")), "yyyy-MM-dd");
            } catch (ParseException e) {
                startDate=new Date();
            }
            calendar.setTime(startDate);
            calendar.add(Calendar.DATE,-3);

            if(calendar.getTime().before(new Date())){
                objectMap.put("willStart",true);
            }else{
                objectMap.put("willStart",false);
            }
        }
        return objectMap;
    }

    @Override
    @Cacheable(value = "exhInfosCache",key = "'exhDes'+#id")
    public String exhDes(Long id) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_exhId_EQ",id);
        ExhDescription exhDescription= exhDescriptionDao.getByParam(map);
        if(exhDescription!=null){
            return exhDescription.getDescription();
        }
        return null;

    }

    @Override
    @Cacheable(value = "exhInfosCache",key = "'exhGuide'+#id")
    public String exhGuide(Long id) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_exhId_EQ",id);
        ExhGuide exhDescription=exhGuideDao.getByParam(map);
        if(exhDescription!=null){
            return exhDescription.getGuide();
        }
        return null;
    }

    @Override
    @Cacheable(value = "exhInfosCache",key = "'exhGuideTo'+#id")
    public String exhGuideTo(Long id) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_exhId_EQ",id);
        ExhGuideTo exhDescription=exhGuideToDao.getByParam(map);
        if(exhDescription!=null){
            return exhDescription.getGuideTo();
        }
        return null;
    }

    @Override
    @Cacheable(value = "exhInfosCache",key = "'exhSponsor'+#id")
    public String exhSponsor(Long id) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_exhId_EQ",id);
        ExhSponsor exhDescription=exhSponsorDao.getByParam(map);
        if(exhDescription!=null){
            return exhDescription.getSponsor();
        }
        return null;
    }

    @Override
    @Cacheable(value = "exhInfosCache",key = "'exhTravel'+#id")
    public String exhTravel(Long id) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_exhId_EQ",id);
        ExhTravel exhDescription=exhTravelDao.getByParam(map);
        if(exhDescription!=null){
            return exhDescription.getTravel();
        }
        return null;
    }
}
