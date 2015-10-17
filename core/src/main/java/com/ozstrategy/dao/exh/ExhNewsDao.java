package com.ozstrategy.dao.exh;
import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.model.exh.ExhNews;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
* Created by lihao1 on 2015-07-16.
*/
public interface ExhNewsDao extends BaseDao<ExhNews> {
    List<Map<String,Object>> getExhTrade(String trades ,Integer start,Integer limit);
    Integer getExhTradeCount(String trades);
    List<Map<String,Object>> getExhNews(Long id ,Integer start,Integer limit);
    Integer getExhNewsCount(Long id);

}