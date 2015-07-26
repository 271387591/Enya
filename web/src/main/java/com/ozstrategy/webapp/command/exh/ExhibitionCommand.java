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
    private String picName;
    private String name;
    private Date endDate;
    private Date createDate;
    private Boolean hot=Boolean.FALSE;
    private String tradeIds;
    private String tradeNames;
    private String keywordIds;
    private String keywordNames;
    private String description;
    private String guide;
    private String guideTo;
    private String sponsor;
    private String travel;
    private Float lng;
    private Float lat;
    private String logoName;
    private String logoPath;
    private String logoUrl;
    public ExhibitionCommand() {
    }
    public ExhibitionCommand(Exhibition model) {
        this.hallId=model.getHallId();
        this.id=model.getId();
        this.startDate=model.getStartDate();
        this.picUrl=model.getPicUrl();
        this.name=model.getName();
        this.endDate=model.getEndDate();
        this.picName=model.getPicName();
        this.createDate=model.getCreateDate();
        this.hot=model.getHot();
        this.tradeIds=model.getTradeIds();
        this.tradeNames=model.getTradeNames();
        this.keywordIds=model.getKeywordIds();
        this.keywordNames=model.getKeywordNames();
        this.logoName=model.getLogoName();
        this.logoUrl= model.getLogoUrl();
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
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getPicName() {
        return picName;
    }

    public void setPicName(String picName) {
        this.picName = picName;
    }

    public Boolean getHot() {
        return hot;
    }

    public void setHot(Boolean hot) {
        this.hot = hot;
    }

    public String getTradeIds() {
        return tradeIds;
    }

    public void setTradeIds(String tradeIds) {
        this.tradeIds = tradeIds;
    }

    public String getTradeNames() {
        return tradeNames;
    }

    public void setTradeNames(String tradeNames) {
        this.tradeNames = tradeNames;
    }

    public String getKeywordIds() {
        return keywordIds;
    }

    public void setKeywordIds(String keywordIds) {
        this.keywordIds = keywordIds;
    }

    public String getKeywordNames() {
        return keywordNames;
    }

    public void setKeywordNames(String keywordNames) {
        this.keywordNames = keywordNames;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGuide() {
        return guide;
    }

    public void setGuide(String guide) {
        this.guide = guide;
    }

    public String getGuideTo() {
        return guideTo;
    }

    public void setGuideTo(String guideTo) {
        this.guideTo = guideTo;
    }

    public String getSponsor() {
        return sponsor;
    }

    public void setSponsor(String sponsor) {
        this.sponsor = sponsor;
    }

    public String getTravel() {
        return travel;
    }

    public void setTravel(String travel) {
        this.travel = travel;
    }

    public Float getLng() {
        return lng;
    }

    public void setLng(Float lng) {
        this.lng = lng;
    }

    public Float getLat() {
        return lat;
    }

    public void setLat(Float lat) {
        this.lat = lat;
    }

    public String getLogoName() {
        return logoName;
    }

    public void setLogoName(String logoName) {
        this.logoName = logoName;
    }

    public String getLogoPath() {
        return logoPath;
    }

    public void setLogoPath(String logoPath) {
        this.logoPath = logoPath;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }
}
