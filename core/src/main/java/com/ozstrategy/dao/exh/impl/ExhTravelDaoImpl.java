package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.ExhTravelDao;
import com.ozstrategy.model.exh.ExhTravel;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-16.
*/
@Repository("exhTravelDao")
public class ExhTravelDaoImpl extends BaseDaoImpl<ExhTravel> implements ExhTravelDao{

    public ExhTravelDaoImpl() {
    super(ExhTravel.class);
    }

}