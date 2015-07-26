package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.ExhNewsDao;
import com.ozstrategy.model.exh.ExhNews;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


/**
* Created by lihao1 on 2015-07-16.
*/
@Repository("exhNewsDao")
public class ExhNewsDaoImpl extends BaseDaoImpl<ExhNews> implements ExhNewsDao{

    public ExhNewsDaoImpl() {
    super(ExhNews.class);
    }

    @Override
    public List<Map<String, Object>> getExhTrade(String trades, Integer start, Integer limit) {
        String sql="select * from t_exhnews where 1=1 ";
        if(StringUtils.isNotEmpty(trades)){
            String[] tr=trades.split(",");
            for(String t:tr){
                sql+=" or locate('"+t+"',keywordNames)>0";
            }
            sql=sql.replaceFirst("or", "and");
        }
        sql+=" order by createDate desc limit ?,?";
        if(log.isDebugEnabled()){
            log.debug(sql.replaceAll("\\n", ""));
        }
        return jdbcTemplate.queryForList(sql,start,limit);
    }

    @Override
    public Integer getExhTradeCount(String trades) {
        String sql="select count(*) from t_exhnews where 1=1 ";
        if(StringUtils.isNotEmpty(trades)){
            String[] tr=trades.split(",");
            for(String t:tr){
                sql+=" or locate('"+t+"',keywordNames)>0";
            }
            sql=sql.replaceFirst("or", "and");
        }
        if(log.isDebugEnabled()){
            log.debug(sql.replaceAll("\\n",""));
        }
        return jdbcTemplate.queryForObject(sql,Integer.class);
    }
}