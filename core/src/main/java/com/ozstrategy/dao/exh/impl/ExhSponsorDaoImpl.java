package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.ExhSponsorDao;
import com.ozstrategy.model.exh.ExhSponsor;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-16.
*/
@Repository("exhSponsorDao")
public class ExhSponsorDaoImpl extends BaseDaoImpl<ExhSponsor> implements ExhSponsorDao{

    public ExhSponsorDaoImpl() {
    super(ExhSponsor.class);
    }

}