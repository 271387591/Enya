<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--获取工程路径 -->
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CRM SYS</title>
    <link href="${ctx}/resources/css/bootstrap/2.3.2/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/resources/css/home.css" type="text/css" rel="stylesheet"/>
    <style type="text/css">
        .container-403 {
            width: 570px;
            height: 400px;
            margin: 100px auto 0;
            background: url(${ctx}/resources/images/403.gif) no-repeat;
        }

        .text-403 {
            padding-left: 150px;
            padding-top: 100px;
        }

        .text-title-403 {
            color: #de2b26;
        }
    </style>
</head>

<body>
<div class="container-403">
    <div class="text-403">
        <h1 class="text-title-403">403 Forbidden!</h1>

        <p>Insufficient permissions,<span><a href="<c:url value="/html/security/login"/>">back to the login page.</a></span></p>
    </div>
</div>
</body>
</html>