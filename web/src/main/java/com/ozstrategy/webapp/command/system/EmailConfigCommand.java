package com.ozstrategy.webapp.command.system;
import com.ozstrategy.model.system.EmailConfig;
/**
* Created by lihao1 on 2015-07-25.
*/
public class EmailConfigCommand {
    private Integer port;
    private Long id;
    private String smtp;
    private String email;
    private String password;
    public EmailConfigCommand() {
    }
    public EmailConfigCommand(EmailConfig model) {
        this.port=model.getPort();
        this.id=model.getId();
        this.smtp=model.getSmtp();
        this.email=model.getEmail();
        this.password=model.getPassword();
    }
    public Integer getPort() {
        return port;
    }
    public void setPort(Integer port) {
        this.port = port;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getSmtp() {
        return smtp;
    }
    public void setSmtp(String smtp) {
        this.smtp = smtp;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
