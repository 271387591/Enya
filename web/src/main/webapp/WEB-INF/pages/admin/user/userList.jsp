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
    <li class="active">用户管理</li>
</ul>
<div class="right-content" >
    <div class="query-box">
        <div class="query-content">
            <ul class="query-form" id="userSearch">
                <li>
                    <label>用户名</label>
                    <input type="text" name="user.Q_username_EQ">
                </li>
                <li>
                    <label>昵称</label>
                    <input type="text" name="user.Q_nickName_LK">
                </li>

            </ul>
            <div class="btn-query">
                <button class="btn btn-success" onclick="searchForm($('#userSearch'),'user',listTable);">查询</button>
                <button class="btn btn-default" onclick="clearSearchForm($('#userSearch'),listTable);">清空</button>
            </div>
        </div>
    </div>
    <div class="table-box">
        <div class="table-title">
            <h5>用户列表</h5>
            <button class="btn btn-primary btn-add" onclick="edit();">添加用户</button>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="userTable">
                <thead>
                <tr>
                    <th>用户名</th>
                    <th>用户昵称</th>
                    <th>用户角色</th>
                    <th>创建时间</th>
                    <th>是否可用</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="table-bottom">
            <div class="batch">

            </div>
            <div id="paging" class="paging"></div>

        </div>

    </div>
</div>

<script type="text/javascript">
    jQuery(function(){
        listTable();
    });
</script>

