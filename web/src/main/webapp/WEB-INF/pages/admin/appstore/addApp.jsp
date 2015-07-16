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
    <li><a href="javascript:void(0);" onclick="ajaxReloadPage('mainContent','html/appstore/security/appList');">APP管理</a></li>
    <li class="active"><i class="icon-user"></i>${command.id==null?'添加APP':'编辑APP'}</li>
</ul>
<div class="right-content" id="right-content">
    <div class="content-title">
        <ul>
            <li><h5>${command.id==null?'添加APP':'编辑APP'}</h5></li>
        </ul>
        <button class="btn btn-default pull-right btn-xs offset-t10 offset-r10" onclick="ajaxReloadPage('mainContent','html/appstore/security/appList');">
            <span><i class="fa fa-mail-reply"></i>返回列表</span>
        </button>
    </div>
    <div class="content-box">
        <form id="userForm">
            <input type="hidden" name="id" value="${command.id}" />
            <ul class="inline-ul">
                <li>
                    <label>版本号</label>
                    <input type="text" class="form-control width-35" name="version" data-validate="required" value="${command.version}" placeholder="版本号"  />
                    <i class="notnull">*</i>
                </li>
                <li>
                    <label>是否发布</label>
                    <div class="rdo" id="enabledDiv">
                        <input type="radio" name="enabled" class="rdolist" checked="checked" value="true" />
                        <div class="rdobox">
                            <span class="check-image"></span>
                            <span class="radiobox-content">是</span>
                        </div>
                        <input type="radio" name="enabled" class="rdolist" value="false" />
                        <div class="rdobox">
                            <span class="check-image"></span>
                            <span class="radiobox-content">否</span>
                        </div>
                    </div>
                </li>
                <li>
                    <label>适用平台</label>
                    <div class="rdo" id="platDiv">
                        <input type="radio" name="plat" class="rdolist" checked="checked" value="Android" />
                        <div class="rdobox">
                            <span class="check-image"></span>
                            <span class="radiobox-content">Android</span>
                        </div>
                    </div>
                </li>

                <li>
                    <label>APP安装包</label>
                    <input type='text' readonly id='textfield' class='form-control width-30' onclick="uploadClick($(this),$('#uphototx'))" />

                    <button type="button" rel="ajax-upload-avatar" class="btn btn-primary" onclick="uploadClick($('#textfield'),$('#uphototx'))" >
                        选择文件
                    </button>
                    <input type="file" style="display:none;" id="uphototx" name="pacName"  />

                </li>

            </ul>
            <ul class="inline-ul clear">
                <li>
                    <label></label>
                    <div class="btn-group offset-t20">
                        <button type="button" class="btn btn-primary" onclick="saveAdvert(${command.id!=null?"'edit'":"'save'"});">
                            <span><i class="fa fa-save"></i>保存</span>
                        </button>
                        <button type="button" class="btn btn-default" onclick="ajaxReloadPage('mainContent','html/appstore/security/appList');">
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
        $('#enabledDiv,#platDiv').labelauty();
    });

</script>

