package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.ExhPlan;

import java.util.Date;

/**
* Created by lihao1 on 2015-08-05.
*/
public class ExhPlanCommand {
    private String content;
    private Long id;
    private String title;
    private Date createDate;
    private String address;
    private String holdDate;
    private String outUrl;
    private Integer year;
    private Boolean publish=Boolean.FALSE;
    private Integer idx=1;
    private Date pubDate;
    private Integer count;
    private Integer index;
    private String imgUrl;
    public ExhPlanCommand() {
    }
    public ExhPlanCommand(ExhPlan model) {
        this.content=model.getContent();
        this.id=model.getId();
        this.title=model.getTitle();
        this.createDate=model.getCreateDate();
        this.holdDate=model.getHoldDate();
        this.outUrl=model.getOutUrl();
        this.address=model.getAddress();
        this.year=model.getYear();
        this.publish=model.getPublish();
        this.idx= model.getIdx();
        this.pubDate= model.getPubDate();
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHoldDate() {
        return holdDate;
    }

    public void setHoldDate(String holdDate) {
        this.holdDate = holdDate;
    }

    public String getOutUrl() {
        return outUrl;
    }

    public void setOutUrl(String outUrl) {
        this.outUrl = outUrl;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
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

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
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
