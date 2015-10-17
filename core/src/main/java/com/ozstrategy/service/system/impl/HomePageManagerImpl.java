package com.ozstrategy.service.system.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.appstore.AppStoreDao;
import com.ozstrategy.dao.system.AdvertDao;
import com.ozstrategy.dao.system.FriendLinkDao;
import com.ozstrategy.dao.system.HomePageDao;
import com.ozstrategy.model.appstore.AppStore;
import com.ozstrategy.model.system.Advert;
import com.ozstrategy.model.system.FriendLink;
import com.ozstrategy.model.system.HomePage;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.system.HomePageManager;
import org.apache.commons.lang.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("homePageManager")
public class HomePageManagerImpl extends BaseManagerImpl<HomePage> implements HomePageManager {
    @Autowired
    private HomePageDao homePageDao;
    @Autowired
    private AppStoreDao appStoreDao;
    @Autowired
    private FriendLinkDao friendLinkDao;
    @Autowired
    private AdvertDao advertDao;




    @Override
    public BaseDao<HomePage> baseDao() {
        return homePageDao;
    }

    @Override
    public HomePage getByKey(String key) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_itemKey_EQ",key);
        return getByParam(map);
    }

    @Override
    public Map<String, Object> homePage() {
        Map<String,Object> homePages=homePageDao.queryMap(new HashMap<String, Object>());
        if(homePages!=null && homePages.size()>0){
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Q_enabled_EQ",1);
            map.put("Q_type_EQ",0);
            Map<String,Object> appStore=appStoreDao.queryMap(map);
            homePages.put("appUrl",appStore.get("appUrl"));
            homePages.put("qrUrl",appStore.get("qrUrl"));
            List<Map<String,Object>> friendLinks=friendLinkDao.listMap(new HashMap<String, Object>());
            homePages.put("friendLinks",friendLinks);
            List<Map<String,Object>> adverts=advertDao.listPageMap(new HashMap<String, Object>(),0,5);
            homePages.put("adverts",adverts);
        }
        return homePages;
    }
}
