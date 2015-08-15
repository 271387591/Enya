package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.AppraisalDao;
import com.ozstrategy.model.exh.Appraisal;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-08-13.
*/
@Repository("appraisalDao")
public class AppraisalDaoImpl extends BaseDaoImpl<Appraisal> implements AppraisalDao{

    public AppraisalDaoImpl() {
    super(Appraisal.class);
    }

}