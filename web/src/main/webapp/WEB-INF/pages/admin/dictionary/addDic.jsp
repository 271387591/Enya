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
    <li><a href="javascript:void(0);" onclick="ajaxReloadPage('mainContent','html/dictionary/security/dicList');">APP管理</a></li>
    <li class="active"><i class="icon-user"></i>${command.id==null?'添加':'编辑'}</li>
</ul>
<div class="right-content" id="right-content">
    <div class="content-title">
        <ul>
            <li><h5>${command.id==null?'添加':'编辑'}</h5></li>
        </ul>
        <button class="btn btn-default pull-right btn-xs offset-t10 offset-r10" onclick="ajaxReloadPage('mainContent','html/dictionary/security/dicList');">
            <span><i class="fa fa-mail-reply"></i>返回列表</span>
        </button>
    </div>
    <div class="content-box">
        <form id="userForm">
            <input type="hidden" name="id" value="${command.id}" />
            <ul class="inline-ul">
                <li>
                    <label>分类</label>
                    <select name="type" class="width-25" id="roleSelector" data-validate="required">
                        <option value="">请选择</option>
                        <option value="0">项目关键字</option>
                        <option value="1">评估类型</option>
                        <option value="2">评估状态</option>
                        <option value="3">媒体名称</option>
                        <option value="4">行业</option>
                    </select>
                    <i class="notnull">*</i>
                </li>
                <li>
                    <label>值</label>
                    <input type="text" class="form-control width-25" name="keyValue" data-validate="required" value="${command.keyValue}" placeholder="值"  />
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
                        <button type="button" class="btn btn-default" onclick="ajaxReloadPage('mainContent','html/dictionary/security/dicList');">
                            <span><i class="fa fa-history"></i>返回</span>
                        </button>
                    </div>
                </li>
            </ul>
        </form>
    </div>
</div>

<script type="text/javascript">
    $('#roleSelector').val('${command.type}');
    $(function(){
        $('#roleSelector').dropkick();
    });
</script>

