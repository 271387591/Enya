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
            <h5>用户反馈列表</h5>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="friendTable">
                <thead>
                <tr>
                    <th>联系方式</th>
                    <th>反馈内容</th>
                    <th>用户名</th>
                    <th>用户邮箱</th>
                    <th>反馈时间</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="table-bottom">
            <div id="friendTablePaging" class="paging"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(function(){
        listTable();
    });
</script>

