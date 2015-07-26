package com.ozstrategy.webapp.command.system;
import com.ozstrategy.model.system.Advert;
/**
* Created by lihao1 on 2015-07-20.
*/
public class AdvertCommand {
    private String picPath;
    private Long id;
    private String picUrl;
    private Long exhId;
    private String name;
    private String mobileName;
    private String mobilePath;
    private String picName;
    private String mobileUrl;
    public AdvertCommand() {
    }
    public AdvertCommand(Advert model) {
        this.picPath=model.getPicPath();
        this.id=model.getId();
        this.exhId=model.getExhId();
        this.name=model.getName();
        this.mobileName=model.getMobileName();
        this.picName=model.getPicName();
        this.mobileUrl=model.getMobileUrl();
    }
    public String getPicPath() {
        return picPath;
    }
    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getPicUrl() {
        return picUrl;
    }
    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }
    public Long getExhId() {
        return exhId;
    }
    public void setExhId(Long exhId) {
        this.exhId = exhId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getMobileName() {
        return mobileName;
    }
    public void setMobileName(String mobileName) {
        this.mobileName = mobileName;
    }
    public String getMobilePath() {
        return mobilePath;
    }
    public void setMobilePath(String mobilePath) {
        this.mobilePath = mobilePath;
    }
    public String getPicName() {
        return picName;
    }
    public void setPicName(String picName) {
        this.picName = picName;
    }
    public String getMobileUrl() {
        return mobileUrl;
    }
    public void setMobileUrl(String mobileUrl) {
        this.mobileUrl = mobileUrl;
    }
}
