package com.ozstrategy.service.system;

import com.ozstrategy.model.system.HomePage;
import com.ozstrategy.service.BaseManager;

import java.util.Map;

/**
* Created by lihao1 on 2015-07-20.
*/
public interface HomePageManager extends BaseManager<HomePage> {
    HomePage getByKey(String key);
    Map<String,Object> homePage();
}
