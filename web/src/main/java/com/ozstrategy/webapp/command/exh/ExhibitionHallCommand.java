package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.ExhibitionHall;

import java.util.Date;

/**
* Created by lihao1 on 2015-07-13.
*/
public class ExhibitionHallCommand {
    private String logo2Url;
    private String logo1Name;
    private String logo2Name;
    private String logo2Path;
    private Float lng;
    private Long id;
    private String address;
    private String description;
    private String name;
    private String logo1Url;
    private Date createDate;
    private Float lat;
    private String logo1Path;
    private Boolean hot;
    private Boolean publish=Boolean.FALSE;
    private Integer idx=1;
    private Date pubDate;
    private Integer index;
    private String imgUrl;
    public ExhibitionHallCommand() {
    }
    public ExhibitionHallCommand(ExhibitionHall model) {
        this.logo2Url=model.getLogo2Url();
        this.logo1Name=model.getLogo1Name();
        this.logo2Name=model.getLogo2Name();
        this.lng=model.getLng();
        this.id=model.getId();
        this.address=model.getAddress();
        this.description=model.getDescription();
        this.name=model.getName();
        this.logo1Url=model.getLogo1Url();
        this.createDate=model.getCreateDate();
        this.lat=model.getLat();
        this.hot=model.getHot();
        this.publish= model.getPublish();
        this.pubDate= model.getPubDate();
        this.idx= model.getIdx();
    }
    public String getLogo2Url() {
        return logo2Url;
    }
    public void setLogo2Url(String logo2Url) {
        this.logo2Url = logo2Url;
    }
    public String getLogo1Name() {
        return logo1Name;
    }
    public void setLogo1Name(String logo1Name) {
        this.logo1Name = logo1Name;
    }
    public String getLogo2Name() {
        return logo2Name;
    }
    public void setLogo2Name(String logo2Name) {
        this.logo2Name = logo2Name;
    }
    public String getLogo2Path() {
        return logo2Path;
    }
    public void setLogo2Path(String logo2Path) {
        this.logo2Path = logo2Path;
    }
    public Float getLng() {
        return lng;
    }
    public void setLng(Float lng) {
        this.lng = lng;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
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
    public String getLogo1Url() {
        return logo1Url;
    }
    public void setLogo1Url(String logo1Url) {
        this.logo1Url = logo1Url;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    public Float getLat() {
        return lat;
    }
    public void setLat(Float lat) {
        this.lat = lat;
    }
    public String getLogo1Path() {
        return logo1Path;
    }
    public void setLogo1Path(String logo1Path) {
        this.logo1Path = logo1Path;
    }

    public Boolean getHot() {
        return hot;
    }

    public void setHot(Boolean hot) {
        this.hot = hot;
    }

    public Boolean getPublish() {
        return publish;
    }

    public void setPublish(Boolean publish) {
        this.publish = publish;
    }

    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public Date getPubDate() {
        return pubDate;
    }

    public void setPubDate(Date pubDate) {
        this.pubDate = pubDate;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
}
