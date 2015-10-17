<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/4/15
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="left-box" class="left-box">
    <div class="logo" id="logo">
    </div>
    <ul class="menu">
        <li id="menu-dic">
            <a href="<c:url value="/html/dictionary/security/index" />"><i class="fa fa-building submenu-icon grey"></i>数据字典</a>
        </li>
        <li id="menu-homePage">
            <a href="<c:url value="/html/homePage/security/index" />"><i class="fa fa-tachometer submenu-icon grey"></i>主页配置</a>
        </li>

        <li id="menu-user">
            <a href="<c:url value="/html/user/security/index" />"><i class="fa fa-user submenu-icon grey"></i>用户管理</a>
        </li>
        <li>
            <a href="#">会展相关管理</a>
            <ul class="submenu">
                <li id="menu-hall">
                    <a href="<c:url value="/html/exhibitionHall/security/index" />"><i class="fa fa-institution submenu-icon grey"></i>展馆管理</a>
                </li>
                <li id="menu-exh">
                    <a href="<c:url value="/html/exhibition/security/index" />"><i class="fa fa-users submenu-icon grey"></i>展会管理</a>
                </li>
                <li id="menu-exhservice">
                    <a href="<c:url value="/html/exhService/security/index" />"><i class="fa fa-umbrella submenu-icon grey"></i>会展政策</a>
                </li>
                <li id="menu-exhplan">
                    <a href="<c:url value="/html/exhPlan/security/index" />"><i class="fa fa-recycle submenu-icon grey"></i>年度展会计划</a>
                </li>
                <li id="menu-appraisal">
                    <a href="<c:url value="/html/appraisal/security/index" />"><i class="fa fa-recycle submenu-icon grey"></i>评估报告</a>
                </li>
                <li id="menu-exhNews">
                    <a href="<c:url value="/html/exhNews/security/index" />"><i class="fa fa-server submenu-icon grey"></i>新闻管理</a>
                </li>

            </ul>
        </li>

        <li id="menu-app">
            <a href="<c:url value="/html/appstore/security/index" />"><i class="fa fa-square submenu-icon grey"></i>APP管理</a>
        </li>
        <li id="menu-usercomments">
            <a href="<c:url value="/html/userComments/security/index" />"><i class="fa fa-comments submenu-icon grey"></i>反馈意见</a>
        </li>
        <li id="menu-survey">
            <a href="<c:url value="/html/survey/security/index" />"><i class="fa fa-binoculars submenu-icon grey"></i>在线调查</a>
        </li>
    </ul>
</div>
<script type="text/javascript">
    function changeMenu(li){
        $('ul li').find('a').find('.fa-angle-double-right').remove();
        li.find('a').append('<i class="fa fa-angle-double-right pull-right green"></i><i class="fa fa-angle-double-right pull-right green"></i>');
    }
</script>

