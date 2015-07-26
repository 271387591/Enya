package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.ExhSponsorDao;
import com.ozstrategy.model.exh.ExhSponsor;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.ExhSponsorManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("exhSponsorManager")
public class ExhSponsorManagerImpl extends BaseManagerImpl<ExhSponsor> implements ExhSponsorManager {
    @Autowired
    private ExhSponsorDao exhSponsorDao;

    @Override
    public BaseDao<ExhSponsor> baseDao() {
        return exhSponsorDao;
    }
}
