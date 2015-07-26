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
    <div class="table-box">
        <div class="table-title">
            <h5>资讯列表</h5>
            <button class="btn btn-primary btn-add" onclick="editNews('${exh.id}');">添加</button>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="exhNewsTable">
                <thead>
                <tr>
                    <th>标题</th>
                    <th>关键字</th>
                    <th>创建时间</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="table-bottom">
            <div id="exhNewsTablePaging" class="paging"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(function(){
        listNewsTable('${exh.id}');
    });
</script>

