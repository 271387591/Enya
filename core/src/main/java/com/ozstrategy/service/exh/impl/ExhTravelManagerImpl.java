package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.ExhTravelDao;
import com.ozstrategy.model.exh.ExhTravel;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.ExhTravelManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("exhTravelManager")
public class ExhTravelManagerImpl extends BaseManagerImpl<ExhTravel> implements ExhTravelManager {
    @Autowired
    private ExhTravelDao exhTravelDao;

    @Override
    public BaseDao<ExhTravel> baseDao() {
        return exhTravelDao;
    }
}
