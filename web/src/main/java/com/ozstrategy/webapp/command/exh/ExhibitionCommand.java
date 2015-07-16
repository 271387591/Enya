package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.Exhibition;

import java.util.Date;

/**
* Created by lihao1 on 2015-07-13.
*/
public class ExhibitionCommand {
    private String picPath;
    private Long hallId;
    private Long id;
    private Date startDate;
    private String picUrl;
    private String description;
    private String name;
    private Date endDate;
    private String exhGuide;
    private String picName;
    private Date createDate;
    private String exhNews;
    private String hostInfo;
    public ExhibitionCommand() {
    }
    public ExhibitionCommand(Exhibition model) {
        this.picPath=model.getPicPath();
        this.hallId=model.getHallId();
        this.id=model.getId();
        this.startDate=model.getStartDate();
        this.picUrl=model.getPicUrl();
        this.description=model.getDescription();
        this.name=model.getName();
        this.endDate=model.getEndDate();
        this.exhGuide=model.getExhGuide();
        this.picName=model.getPicName();
        this.createDate=model.getCreateDate();
        this.exhNews=model.getExhNews();
        this.hostInfo=model.getHostInfo();
    }
    public String getPicPath() {
        return picPath;
    }
    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }
    public Long getHallId() {
        return hallId;
    }
    public void setHallId(Long hallId) {
        this.hallId = hallId;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Date getStartDate() {
        return startDate;
    }
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    public String getPicUrl() {
        return picUrl;
    }
    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Date getEndDate() {
        return endDate;
    }
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    public String getExhGuide() {
        return exhGuide;
    }
    public void setExhGuide(String exhGuide) {
        this.exhGuide = exhGuide;
    }
    public String getPicName() {
        return picName;
    }
    public void setPicName(String picName) {
        this.picName = picName;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    public String getExhNews() {
        return exhNews;
    }
    public void setExhNews(String exhNews) {
        this.exhNews = exhNews;
    }
    public String getHostInfo() {
        return hostInfo;
    }
    public void setHostInfo(String hostInfo) {
        this.hostInfo = hostInfo;
    }
}
