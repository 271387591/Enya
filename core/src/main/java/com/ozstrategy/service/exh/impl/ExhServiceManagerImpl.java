package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.ExhServiceDao;
import com.ozstrategy.model.exh.ExhService;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.ExhServiceManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("exhServiceManager")
public class ExhServiceManagerImpl extends BaseManagerImpl<ExhService> implements ExhServiceManager {
    @Autowired
    private ExhServiceDao exhServiceDao;

    @Override
    public BaseDao<ExhService> baseDao() {
        return exhServiceDao;
    }
}
