<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/19/15
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<ul class="breadcrumb">
    <li><a href="javascript:void(0);" onclick="ajaxReloadPage('mainContent','html/appstore/security/appList');">APP管理</a></li>
    <li class="active">APP详情</li>
</ul>

<div class="right-content" >
    <div class="content-title">
        <ul>
            <li><h5>APP详情</h5></li>
        </ul>
        <button class="btn btn-default pull-right btn-xs offset-t10 offset-r10" onclick="ajaxReloadPage('mainContent','html/appstore/security/appList');">
            <span><i class="fa fa-mail-reply"></i>返回列表</span>
        </button>
    </div>
    <div class="content-box">
        <div class="profile-user-info profile-user-info-striped">
            <div class="profile-info-row">
                <div class="profile-info-name">APP版本</div>
                <div class="profile-info-value">
                    ${command.version}
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name">适用平台</div>
                <div class="profile-info-value">
                    ${command.plat==0?'Android':''}
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name">是否最新</div>
                <div class="profile-info-value">
                    ${command.enabled?'<span class="label label-lg label-success">当前最新</span>':'<span class="label label-lg label-default">历史版本</span>'}
                </div>
            </div>

            <div class="profile-info-row">
                <div class="profile-info-name">上传时间</div>
                <div class="profile-info-value">
                    <fmt:formatDate value='${command.createDate}' pattern='yyyy-MM-dd HH:mm:ss'/>
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name">下载地址</div>
                <div class="profile-info-value">
                    ${command.pacUrl}
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name">二维码</div>
                <div class="profile-info-value">
                    <img src="${command.qrUrl}" width="100px;" height="100px" alt="扫一扫"/>
                </div>
            </div>
        </div>
    </div>
</div>
