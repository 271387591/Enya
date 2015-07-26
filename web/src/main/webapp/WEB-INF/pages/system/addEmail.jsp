<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/19/15
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form class="form-horizontal padding-10" id="emailForm">
    <input type="hidden" value="${command.id}" name="id"/>
    <div class="form-group">
        <label class="col-sm-1 control-label no-padding-right">邮件地址</label>
        <div class="col-sm-5 no-padding-right">
            <input type="text" class="form-control" name="email" data-validate="email" value="${command.email}" placeholder="邮件地址"  />
        </div>
        <i class="notnull">*</i>
    </div>

    <div class="form-group">
        <label class="col-sm-1 control-label">密码</label>
        <div class="col-sm-5 no-padding-right">
            <input type="password" class="form-control" name="password" data-validate="required" value="${command.password}" placeholder="密码"  />
        </div>
        <i class="notnull">*</i>
    </div>

    <div class="form-group">
        <label class="col-sm-1 control-label">SMTP地址</label>
        <div class="col-sm-5 no-padding-right">
            <input type="text" class="form-control" name="smtp" data-validate="required" value="${command.smtp}" placeholder="SMTP地址"  />
        </div>
        <i class="notnull">*</i>
    </div>

    <div class="form-group">
        <label class="col-sm-1 control-label">端口</label>
        <div class="col-sm-5 no-padding-right">
            <input type="text" class="form-control" name="port" data-validate="required" value="${command.port}" placeholder="端口"  />
        </div>
        <i class="notnull">*</i>
    </div>
    <div class="clearfix form-actions clear">
        <div class="col-md-offset-3 col-md-9 btn-group">
            <button type="button" class="btn btn-primary" onclick="saveEmail(${command.id!=null?"'edit'":"'save'"});">
                <span><i class="fa fa-save"></i>保存</span>
            </button>
        </div>
    </div>
</form>
