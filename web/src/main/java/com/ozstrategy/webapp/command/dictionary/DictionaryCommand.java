package com.ozstrategy.webapp.command.dictionary;
import com.ozstrategy.model.dictionary.Dictionary;

import java.util.Date;

/**
* Created by lihao1 on 2015-07-13.
*/
public class DictionaryCommand {
    private Long id;
    private Integer type;
    private String keyValue;
    private Date createDate;
    public DictionaryCommand() {
    }
    public DictionaryCommand(Dictionary model) {
        this.id=model.getId();
        this.type=model.getType();
        this.keyValue=model.getKeyValue();
        this.createDate=model.getCreateDate();
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    public String getKeyValue() {
        return keyValue;
    }
    public void setKeyValue(String keyValue) {
        this.keyValue = keyValue;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
