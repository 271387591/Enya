<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/19/15
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="right-content">
    <form class="form-horizontal padding-10" id="addFriendForm">
        <input type="hidden" name="id" value="${command.id}">
        <div class="form-group">
            <label class="col-sm-1 control-label no-padding-right">名称</label>
            <div class="col-sm-5 no-padding-right">
                <input type="text" name="name" class="form-control" data-validate="required" placeholder="名称" value="${command.name}">
            </div>
            <i class="notnull">*</i>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label no-padding-right">链接地址</label>
            <div class="col-sm-5 no-padding-right">
                <input type="text" name="url" class="form-control" data-validate="required" placeholder="链接地址" value="${command.url}">
            </div>
            <i class="notnull">*</i>
        </div>
        <div class="clearfix form-actions clear">
            <div class="col-md-offset-3 col-md-9 btn-group">
                <button type="button" class="btn btn-primary" onclick="saveFriend();">
                    <span><i class="fa fa-save"></i>保存</span>
                </button>
                <button type="button" class="btn btn-default" onclick="ajaxReloadPage('friendTab','html/friendLink/security/friendList');">
                    <span><i class="fa fa-history"></i>返回</span>
                </button>
            </div>
        </div>
    </form>
</div>
