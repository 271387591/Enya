package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.ExhDescriptionDao;
import com.ozstrategy.model.exh.ExhDescription;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-16.
*/
@Repository("exhDescriptionDao")
public class ExhDescriptionDaoImpl extends BaseDaoImpl<ExhDescription> implements ExhDescriptionDao{

    public ExhDescriptionDaoImpl() {
    super(ExhDescription.class);
    }

}