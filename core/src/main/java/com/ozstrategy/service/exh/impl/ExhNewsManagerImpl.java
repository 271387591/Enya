package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.ExhNewsDao;
import com.ozstrategy.model.exh.ExhNews;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.ExhNewsManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("exhNewsManager")
public class ExhNewsManagerImpl extends BaseManagerImpl<ExhNews> implements ExhNewsManager {
    @Autowired
    private ExhNewsDao exhNewsDao;

    @Override
    public BaseDao<ExhNews> baseDao() {
        return exhNewsDao;
    }

    @Override
    public List<Map<String, Object>> getExhTrade(String trades, Integer start, Integer limit) {
        return exhNewsDao.getExhTrade(trades, start, limit);
    }

    @Override
    public Integer getExhTradeCount(String trades) {
        return exhNewsDao.getExhTradeCount(trades);
    }
}
