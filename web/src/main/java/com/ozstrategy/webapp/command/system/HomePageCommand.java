package com.ozstrategy.webapp.command.system;
import com.ozstrategy.model.system.HomePage;
/**
* Created by lihao1 on 2015-07-20.
*/
public class HomePageCommand {
    private Long id;
    private String email;
    private String address;
    private String icp;
    private String phone;
    private String zipCode;
    private String facsimile;
    private String logoName;
    private String logoUrl;
    private String logoPath;
    private String copyright;
    private String zxUrl;
    public HomePageCommand() {
    }
    public HomePageCommand(HomePage model) {
        this.id=model.getId();
        this.email= model.getEmail();
        this.address= model.getAddress();
        this.icp= model.getIcp();
        this.phone= model.getPhone();
        this.zipCode= model.getZipCode();
        this.facsimile= model.getFacsimile();
        this.logoName= model.getLogoName();
        this.logoUrl= model.getLogoUrl();
        this.copyright= model.getCopyright();
        this.zxUrl=model.getZxUrl();
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIcp() {
        return icp;
    }

    public void setIcp(String icp) {
        this.icp = icp;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getFacsimile() {
        return facsimile;
    }

    public void setFacsimile(String facsimile) {
        this.facsimile = facsimile;
    }

    public String getLogoName() {
        return logoName;
    }

    public void setLogoName(String logoName) {
        this.logoName = logoName;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getLogoPath() {
        return logoPath;
    }

    public void setLogoPath(String logoPath) {
        this.logoPath = logoPath;
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright;
    }

    public String getZxUrl() {
        return zxUrl;
    }

    public void setZxUrl(String zxUrl) {
        this.zxUrl = zxUrl;
    }
}
