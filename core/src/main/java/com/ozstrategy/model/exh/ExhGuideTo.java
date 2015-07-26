package com.ozstrategy.model.exh;

import com.ozstrategy.annotations.Id;
import com.ozstrategy.annotations.Table;
import com.ozstrategy.model.BaseEntity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Created by lihao1 on 7/16/15.
 */
@Table(name = "t_exhguideto")
public class ExhGuideTo extends BaseEntity{
    @Id
    private Long id;
    private Long exhId;
    private String guideTo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getExhId() {
        return exhId;
    }

    public void setExhId(Long exhId) {
        this.exhId = exhId;
    }

    public String getGuideTo() {
        return guideTo;
    }

    public void setGuideTo(String guideTo) {
        this.guideTo = guideTo;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        ExhGuideTo role = (ExhGuideTo) o;
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
