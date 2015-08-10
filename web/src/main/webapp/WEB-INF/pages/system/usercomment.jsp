<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@ include file="/common/taglibs.jsp" %>
    <title>反馈意见</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div id="right-box" class="right-box">
    <%@ include file="../header.jsp" %>
    <div id="mainContent">


    </div>


</div>
<script type="text/javascript" src="<c:url value="/resources/js/admin/system/usercomment.js"/>"></script>
<script type="text/javascript">

    jQuery(function($) {
        changeMenu($('#menu-usercomments'));
        ajaxReloadPage('mainContent','html/userComments/security/commentList');
    });

</script>

</body>
</html>