package com.ozstrategy.dao.system.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.system.HomePageDao;
import com.ozstrategy.model.system.HomePage;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-20.
*/
@Repository("homePageDao")
public class HomePageDaoImpl extends BaseDaoImpl<HomePage> implements HomePageDao{

    public HomePageDaoImpl() {
    super(HomePage.class);
    }

}