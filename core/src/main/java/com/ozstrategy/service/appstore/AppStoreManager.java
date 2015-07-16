package com.ozstrategy.service.appstore;

import com.ozstrategy.model.appstore.AppStore;
import com.ozstrategy.service.BaseManager;

/**
* Created by lihao1 on 2015-07-11.
*/
public interface AppStoreManager extends BaseManager<AppStore> {
    void saveApp(AppStore appStore);
    void updateApp(AppStore appStore);
}
