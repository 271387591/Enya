package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.ExhGuideTo;
/**
* Created by lihao1 on 2015-07-16.
*/
public class ExhGuideToCommand {
    private Long id;
    private Long exhId;
    private String guideTo;
    public ExhGuideToCommand() {
    }
    public ExhGuideToCommand(ExhGuideTo model) {
        this.id=model.getId();
        this.exhId=model.getExhId();
        this.guideTo=model.getGuideTo();
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
    public String getGuideTo() {
        return guideTo;
    }
    public void setGuideTo(String guideTo) {
        this.guideTo = guideTo;
    }
}
