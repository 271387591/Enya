package com.ozstrategy.webapp.command.appstore;
import com.ozstrategy.model.appstore.AppStore;

import java.util.Date;

/**
* Created by lihao1 on 2015-07-11.
*/
public class AppStoreCommand {
    private Long id;
    private Integer plat;
    private String pacUrl;
    private String pacPath;
    private String qrName;
    private String qrPath;
    private String pacName;
    private Date createDate;
    private String qrUrl;
    private String version;
    private Boolean enabled;
    public AppStoreCommand() {
    }
    public AppStoreCommand(AppStore model) {
        this.id=model.getId();
        this.plat=model.getPlat();
        this.pacUrl=model.getPacUrl();
        this.pacPath=model.getPacPath();
        this.qrName=model.getQrName();
        this.qrPath=model.getQrPath();
        this.pacName=model.getPacName();
        this.createDate=model.getCreateDate();
        this.qrUrl=model.getQrUrl();
        this.version=model.getVersion();
        this.enabled=model.getEnabled();
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Integer getPlat() {
        return plat;
    }
    public void setPlat(Integer plat) {
        this.plat = plat;
    }
    public String getPacUrl() {
        return pacUrl;
    }
    public void setPacUrl(String pacUrl) {
        this.pacUrl = pacUrl;
    }
    public String getPacPath() {
        return pacPath;
    }
    public void setPacPath(String pacPath) {
        this.pacPath = pacPath;
    }
    public String getQrName() {
        return qrName;
    }
    public void setQrName(String qrName) {
        this.qrName = qrName;
    }
    public String getQrPath() {
        return qrPath;
    }
    public void setQrPath(String qrPath) {
        this.qrPath = qrPath;
    }
    public String getPacName() {
        return pacName;
    }
    public void setPacName(String pacName) {
        this.pacName = pacName;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    public String getQrUrl() {
        return qrUrl;
    }
    public void setQrUrl(String qrUrl) {
        this.qrUrl = qrUrl;
    }
    public String getVersion() {
        return version;
    }
    public void setVersion(String version) {
        this.version = version;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
}
