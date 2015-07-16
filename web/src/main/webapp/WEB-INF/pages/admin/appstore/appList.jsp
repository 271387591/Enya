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
    <li class="active">APP管理</li>
</ul>
<div class="right-content" >
    <div class="table-box">
        <div class="table-title">
            <h5>APP列表</h5>
            <button class="btn btn-primary btn-add" onclick="edit();">添加</button>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="userTable">
                <thead>
                <tr>
                    <th>版本号</th>
                    <th>适用平台</th>
                    <th>上传时间</th>
                    <th>版本状态</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="table-bottom">
            <div id="paging" class="paging"></div>
        </div>
    </div>
</div>

<script type="text/javascript">
    jQuery(function(){
        listTable();
    });
</script>

