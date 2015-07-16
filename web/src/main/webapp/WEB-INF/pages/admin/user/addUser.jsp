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
        <form id="userForm">
            <input type="hidden" name="id" value="${command.id}" />
            <ul class="inline-ul">
                <li>
                    <label>用户名</label>
                    <input type="text" class="form-control width-25" name="mobile" data-validate="username" value="${command.username}" placeholder="用户名"  />
                    <i class="notnull">*</i>
                </li>
                <li>
                    <label>昵称</label>
                    <input type="text" class="form-control width-25" name="nickName" data-validate="length" data-len="8" value="${command.nickName}" placeholder="昵称"  />
                </li>
                <c:if test="${command.id==null}">
                    <li>
                        <label>密码</label>
                        <input type="password" class="form-control width-25" name="password"  data-validate="password" placeholder="密码" id="userPassword" />
                        <i class="notnull">*</i>
                    </li>
                    <li>
                        <label>确认密码</label>
                        <input type="password" class="form-control width-25"  data-validate="passwordHit" data-hit="userPassword" placeholder="确认密码" />
                        <i class="notnull">*</i>
                    </li>
                </c:if>
                <li>
                    <label>分配角色</label>
                    <select name="roleId" class="width-25" tabindex="4" id="roleSelector" data-validate="required">
                    </select>
                    <i class="notnull">*</i>
                </li>
            </ul>
            <ul class="inline-ul clear">
                <li>
                    <label></label>
                    <div class="btn-group offset-t20">
                        <button type="button" class="btn btn-primary" onclick="saveAdvert(${command.id!=null?"'edit'":"'save'"});">
                            <span><i class="fa fa-save"></i>保存</span>
                        </button>
                        <button type="button" class="btn btn-default" onclick="ajaxReloadPage('mainContent','html/user/security/userList');">
                            <span><i class="fa fa-history"></i>返回</span>
                        </button>
                    </div>
                </li>
            </ul>
        </form>
    </div>
</div>

<script type="text/javascript">
    jQuery(function(){
        blurInput($('input[type=text],input[type=password],select'));
        initComboData($("#roleSelector"),'html/role/security/list',{start:0,limit:20},'id','displayName','${command.roleId}');
        $('#roleSelector').dropkick();
        if(${command.id!=null}){
            $('#userForm').find('input[name=mobile]').attr('readOnly',true);
        }
    });

</script>

