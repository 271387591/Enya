package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.AppraisalDao;
import com.ozstrategy.model.exh.Appraisal;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.AppraisalManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("appraisalManager")
public class AppraisalManagerImpl extends BaseManagerImpl<Appraisal> implements AppraisalManager {
    @Autowired
    private AppraisalDao appraisalDao;

    @Override
    public BaseDao<Appraisal> baseDao() {
        return appraisalDao;
    }
}
