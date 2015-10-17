package com.ozstrategy.service.exh;

import com.ozstrategy.model.exh.ExhNews;
import com.ozstrategy.service.BaseManager;

import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-07-16.
*/
public interface ExhNewsManager extends BaseManager<ExhNews> {
    List<Map<String,Object>> getExhTrade(String trades ,Integer start,Integer limit);
    Integer getExhTradeCount(String trades);

    List<Map<String,Object>> getExhNews(Long ids ,Integer start,Integer limit);
    Integer getExhNewsCount(Long ids);
}
