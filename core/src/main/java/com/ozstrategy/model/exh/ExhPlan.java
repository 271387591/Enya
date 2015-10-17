package com.ozstrategy.model.exh;

import com.ozstrategy.annotations.Id;
import com.ozstrategy.annotations.Table;
import com.ozstrategy.model.BaseEntity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.util.Date;

/**
 * Created by lihao1 on 8/5/15.
 */
@Table(name = "t_exhplan")
public class ExhPlan extends BaseEntity{
    @Id
    private Long id;
    private String title;
    private Date createDate;
    private String content;
    private String address;
    private String holdDate;
    private String outUrl;
    private Integer year;
    private Boolean publish=Boolean.FALSE;
    private Integer idx=1;
    private Date pubDate;

    public ExhPlan() {
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        ExhPlan role = (ExhPlan) o;
        return new EqualsBuilder()
                .append(id, role.id)
                .isEquals();
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(id)
                .hashCode();
    }
}
