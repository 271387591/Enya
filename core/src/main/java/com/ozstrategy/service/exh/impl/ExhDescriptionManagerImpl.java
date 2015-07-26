package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.ExhDescriptionDao;
import com.ozstrategy.model.exh.ExhDescription;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.ExhDescriptionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("exhDescriptionManager")
public class ExhDescriptionManagerImpl extends BaseManagerImpl<ExhDescription> implements ExhDescriptionManager {
    @Autowired
    private ExhDescriptionDao exhDescriptionDao;

    @Override
    public BaseDao<ExhDescription> baseDao() {
        return exhDescriptionDao;
    }
}
