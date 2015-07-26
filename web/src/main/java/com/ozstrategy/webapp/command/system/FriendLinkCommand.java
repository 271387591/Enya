package com.ozstrategy.webapp.command.system;
import com.ozstrategy.model.system.FriendLink;
/**
* Created by lihao1 on 2015-07-20.
*/
public class FriendLinkCommand {
    private Long id;
    private String name;
    private String url;
    public FriendLinkCommand() {
    }
    public FriendLinkCommand(FriendLink model) {
        this.id=model.getId();
        this.name=model.getName();
        this.url=model.getUrl();
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
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
}
