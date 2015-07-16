package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.ExhibitionHallDao;
import com.ozstrategy.model.exh.ExhibitionHall;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-13.
*/
@Repository("exhibitionHallDao")
public class ExhibitionHallDaoImpl extends BaseDaoImpl<ExhibitionHall> implements ExhibitionHallDao{

    public ExhibitionHallDaoImpl() {
    super(ExhibitionHall.class);
    }

}