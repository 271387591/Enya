package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.ExhDescription;
/**
* Created by lihao1 on 2015-07-16.
*/
public class ExhDescriptionCommand {
    private Long id;
    private Long exhId;
    private String description;
    public ExhDescriptionCommand() {
    }
    public ExhDescriptionCommand(ExhDescription model) {
        this.id=model.getId();
        this.exhId=model.getExhId();
        this.description=model.getDescription();
    }
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
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
}
