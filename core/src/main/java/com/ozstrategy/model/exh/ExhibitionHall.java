package com.ozstrategy.model.exh;

import com.ozstrategy.annotations.Id;
import com.ozstrategy.annotations.NamedQueries;
import com.ozstrategy.annotations.NamedQuery;
import com.ozstrategy.annotations.Table;
import com.ozstrategy.model.BaseEntity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.util.Date;

/**
 * Created by lihao1 on 7/13/15.
 */
@Table(name = "t_exhibitionhall")
@NamedQueries({
        @NamedQuery(name = "getHall",query = "select t.*,t1.commentCount from (select h.*,(CASE WHEN GROUP_CONCAT(e.id) is NULL THEN 'false' ELSE 'true' END) as hasExh from t_exhibitionhall h left join t_exhibition e on h.id=e.hallId group by h.id)t left join (select count(c.id) as commentCount,c.itemId from t_comment c where c.typeId=1 GROUP BY c.itemId )t1 on t.id=t1.itemId where t.id=:id "),
        @NamedQuery(name = "getHalls",query = "select t.*,t1.commentCount from (select h.*,(CASE WHEN GROUP_CONCAT(e.id) is NULL THEN 'false' ELSE 'true' END) as hasExh from t_exhibitionhall h left join t_exhibition e on h.id=e.hallId group by h.id)t left join (select count(c.id) as commentCount,c.itemId from t_comment c where c.typeId=1 GROUP BY c.itemId )t1 on t.id=t1.itemId where 1=1"),
        @NamedQuery(name = "getHallsCount",query = "select count(*) from (select h.*,(CASE WHEN GROUP_CONCAT(e.id) is NULL THEN 'false' ELSE 'true' END) as hasExh from t_exhibitionhall h left join t_exhibition e on h.id=e.hallId group by h.id)t where 1=1 ")
})
public class ExhibitionHall extends BaseEntity{
    @Id
    private Long id;
    private String name;
    private String description;
    private Date createDate;
    private Date updateDate;
    private String address;
    private String logo1Path;
    private String logo1Name;
    private String logo1Url;
    private String logo2Path;
    private String logo2Name;
    private String logo2Url;
    private Float lng;
    private Float lat;
    private Boolean hot=Boolean.FALSE;
    private Integer previewCount=0;
    private Integer shareCount=0;

    public ExhibitionHall() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLogo1Path() {
        return logo1Path;
    }

    public void setLogo1Path(String logo1Path) {
        this.logo1Path = logo1Path;
    }

    public String getLogo1Name() {
        return logo1Name;
    }

    public void setLogo1Name(String logo1Name) {
        this.logo1Name = logo1Name;
    }

    public String getLogo1Url() {
        return logo1Url;
    }

    public void setLogo1Url(String logo1Url) {
        this.logo1Url = logo1Url;
    }

    public String getLogo2Path() {
        return logo2Path;
    }

    public void setLogo2Path(String logo2Path) {
        this.logo2Path = logo2Path;
    }

    public String getLogo2Name() {
        return logo2Name;
    }

    public void setLogo2Name(String logo2Name) {
        this.logo2Name = logo2Name;
    }

    public String getLogo2Url() {
        return logo2Url;
    }

    public void setLogo2Url(String logo2Url) {
        this.logo2Url = logo2Url;
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

    public Boolean getHot() {
        return hot;
    }

    public void setHot(Boolean hot) {
        this.hot = hot;
    }

    public Integer getPreviewCount() {
        return previewCount;
    }

    public void setPreviewCount(Integer previewCount) {
        this.previewCount = previewCount;
    }

    public Integer getShareCount() {
        return shareCount;
    }

    public void setShareCount(Integer shareCount) {
        this.shareCount = shareCount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        ExhibitionHall user = (ExhibitionHall) o;
        return new EqualsBuilder()
                .append(id, user.id)
                .isEquals();
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(id)
                .hashCode();

    }
}
