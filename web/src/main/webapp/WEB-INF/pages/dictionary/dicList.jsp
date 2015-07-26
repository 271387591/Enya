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
    <li class="active">数据字典</li>
</ul>
<div class="right-content" >
    <div class="query-box">
        <div class="query-content">
            <ul class="query-form" id="userSearch">
                <li>
                    <label>分类</label>
                    <select name="user.Q_type_EQ" data-validate="required">
                        <option value="">请选择</option>
                        <option value="0">项目关键字</option>
                        <option value="1">评估类型</option>
                        <option value="2">评估状态</option>
                        <option value="3">媒体名称</option>
                        <option value="4">行业</option>
                    </select>
                </li>
                <li>
                    <label>值</label>
                    <input type="text" name="user.Q_keyValue_LK">
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
            <h5>数据字典</h5>
            <button class="btn btn-primary btn-add" onclick="edit();">添加</button>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="userTable">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>分类</th>
                    <th>值</th>
                    <th>创建时间</th>
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
        $('select[name="user.Q_type_EQ"]').chosen();
    });
</script>

