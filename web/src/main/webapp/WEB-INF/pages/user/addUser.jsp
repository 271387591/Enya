<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/19/15
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<ul class="breadcrumb">
    <li><a href="javascript:void(0);" onclick="ajaxReloadPage('mainContent','html/user/security/userList');">用户管理</a></li>
    <li class="active"><i class="icon-user"></i>${command.id==null?'添加用户':'编辑用户'}</li>
</ul>
<div class="right-content" id="right-content">
    <div class="content-title">
        <ul>
            <li><h5>${command.id==null?'添加用户':'编辑用户'}</h5></li>
        </ul>
        <button class="btn btn-default pull-right btn-xs offset-t10 offset-r10" onclick="ajaxReloadPage('mainContent','html/user/security/userList');">
            <span><i class="fa fa-mail-reply"></i>返回列表</span>
        </button>
    </div>
    <div class="content-box">
        <form class="form-horizontal padding-10" id="userForm">
            <%--<div class="form-group">--%>
                <%--<label class="col-sm-1 control-label no-padding-right">用户名</label>--%>
                <%--<div class="col-sm-5 no-padding-right">--%>
                    <%--<input type="text" class="form-control" name="mobile" data-validate="username" value="${command.username}" placeholder="用户名"  />--%>
                <%--</div>--%>
                <%--<i class="notnull">*</i>--%>
            <%--</div>--%>
            <div class="form-group">
                <label class="col-sm-1 control-label no-padding-right">电子邮件</label>
                <div class="col-sm-5 no-padding-right">
                    <input type="text" class="form-control" name="email" data-validate="email" data-len="8" value="${command.email}" placeholder="电子邮件"  />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 control-label no-padding-right">昵称</label>
                <div class="col-sm-5 no-padding-right">
                    <input type="text" class="form-control" name="nickName" data-validate="length" data-len="8" value="${command.nickName}" placeholder="昵称"  />
                </div>
            </div>

            <c:if test="${command.id==null}">
                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right">密码</label>
                    <div class="col-sm-5 no-padding-right">
                        <input type="password" class="form-control" name="password"  data-validate="password" placeholder="密码" id="userPassword" />
                    </div>
                    <i class="notnull">*</i>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right">确认密码</label>
                    <div class="col-sm-5 no-padding-right">
                        <input type="password" class="form-control"  data-validate="passwordHit" data-hit="userPassword" placeholder="确认密码" />
                    </div>
                    <i class="notnull">*</i>
                </div>
            </c:if>
            <div class="form-group">
                <label class="col-sm-1 control-label no-padding-right">分配角色</label>
                <div class="col-sm-5 no-padding-right">
                    <select name="roleId" class="width-100" tabindex="4" id="roleSelector" data-validate="required">
                    </select>
                </div>
                <i class="notnull">*</i>
            </div>
            <div class="clearfix form-actions clear">
                <div class="col-md-offset-3 col-md-9 btn-group">
                    <button type="button" class="btn btn-primary" onclick="saveAdvert(${command.id!=null?"'edit'":"'save'"});">
                        <span><i class="fa fa-save"></i>保存</span>
                    </button>
                    <button type="button" class="btn btn-default" onclick="ajaxReloadPage('mainContent','html/user/security/userList');">
                        <span><i class="fa fa-history"></i>返回</span>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    jQuery(function(){
        blurInput($('input[type=text],input[type=password],select'));
        initComboData($("#roleSelector"),'html/role/security/list',{start:0,limit:20},'id','displayName','${command.roleId}');
        $('#roleSelector').chosen({
            no_results_text:'未找到相关项'
        });
        if(${command.id!=null}){
            $('#userForm').find('input[name=email]').attr('readOnly',true);
        }
    });

</script>

