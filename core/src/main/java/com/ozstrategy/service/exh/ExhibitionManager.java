package com.ozstrategy.service.exh;

import com.ozstrategy.model.dictionary.Dictionary;
import com.ozstrategy.model.exh.ExhDescription;
import com.ozstrategy.model.exh.Exhibition;
import com.ozstrategy.service.BaseManager;

import java.util.Map;
import java.util.Set;

/**
* Created by lihao1 on 2015-07-13.
*/
public interface ExhibitionManager extends BaseManager<Exhibition> {
    void deleteExh(Exhibition exhibition);
    Map<String,Object> exhDetail(Long id);
    String exhDes(Long id);
    String exhGuide(Long id);
    String exhGuideTo(Long id);
    String exhSponsor(Long id);
    String exhTravel(Long id);
}
