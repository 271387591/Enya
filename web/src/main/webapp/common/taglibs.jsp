<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/common/custom-functions.tld" prefix="oz" %>
<link href="<c:url value="/resources/css/bootstrap.min.css"/> " rel="stylesheet" />
<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/css/map.css"/>" />





<%--<link rel="stylesheet" href="<c:url value="/resources/css/ace.min.css"/>" />--%>
<%--<link rel="stylesheet" href="<c:url value="/resources/css/ace-rtl.min.css"/>" />--%>
<%--<link rel="stylesheet" href="<c:url value="/resources/css/ace-skins.min.css"/>" />--%>
<link rel="stylesheet" href="<c:url value="/resources/css/jNotify.jquery.css"/>" />
<%--<link href="<c:url value="/resources/css/simplePagination.css"/> " rel="stylesheet" />--%>
<%--<link href="<c:url value="/resources/css/datepicker.css"/> " rel="stylesheet" />--%>


<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
<%--<link rel="stylesheet" href="<c:url value="/resources/css/dropkick.css"/>" />--%>
<link rel="stylesheet" href="<c:url value="/resources/css/labelauty.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/css/chosen.css"/>" />


<script type="text/javascript">
    var appPath='<c:url value="/"/>';
</script>
<!--[if lt IE 9]>
<script src="<c:url value="/resources/lib/ie/html5shiv.js"/>"></script>

<![endif]-->
<!--[if lt IE 9]>
<script src="<c:url value="/resources/lib/ie/respond.min.js"/>"></script>
<![endif]-->

<!--[if !IE]> -->

<script src="<c:url value="/resources/lib/jquery/jquery-2.0.3.min.js"/>"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="<c:url value="/resources/lib/jquery/jquery-1.10.2.min.js"/>"></script>
<![endif]-->
<script src="<c:url value="/resources/lib/bootstrap/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/lib/bootstrap/typeahead-bs2.min.js"/>"></script>

<!--[if lte IE 8]>
<script src="<c:url value="/resources/lib/excanvas.min.js"/>"></script>
<![endif]-->
<%--<script src="<c:url value="/resources/lib/jplugin/jquery.autosize.min.js"/>"></script>--%>
<%--<script src="<c:url value="/resources/lib/jplugin/jquery.inputlimiter.1.3.1.min.js"/>"></script>--%>
<script src="<c:url value="/resources/lib/jplugin/jquery.pager.js"/>"></script>
<script src="<c:url value="/resources/lib/jplugin/jNotify.jquery.js"/>"></script>
<%--<script src="<c:url value="/resources/lib/jplugin/jquery.simplePagination.js"/>"></script>--%>
<%--<script src="<c:url value="/resources/lib/jplugin/jquery.knob.min.js"/>"></script>--%>
<script src="<c:url value="/resources/lib/jplugin/ajaxfileupload.js"/>"></script>
<%--<script src="<c:url value="/resources/lib/jplugin/jquery.dropkick.js"/>"></script>--%>
<script src="<c:url value="/resources/lib/jplugin/labelauty.js"/>"></script>
<script src="<c:url value="/resources/lib/jplugin/chosen.jquery.min.js"/>"></script>
<script src="<c:url value="/resources/lib/jplugin/jquery.form.min.js"/>"></script>



<%--<script src="<c:url value="/resources/lib/bootstrap/bootstrap-datepicker.min.js"/>"></script>--%>
<script src="<c:url value="/resources/lib/WDatePicker/WdatePicker.js"/>"></script>

<script src="<c:url value="/resources/lib/jplugin/common.js"/>"></script>
<script type="text/javascript">
    function alignHeight(leftbox, rightbox) {
        if (!document.getElementById(leftbox)) {
            return false;
        }
        if (!document.getElementById(rightbox)) {
            return false;
        }
        var heightA = document.getElementById(leftbox).clientHeight;
        var heightB = document.getElementById(rightbox).clientHeight;
        if (heightA > heightB) {
            document.getElementById(rightbox).style.height = heightA + "px";
            document.getElementById(leftbox).style.height = heightA + "px";
        } else {
            document.getElementById(leftbox).style.height = heightB + "px";
            document.getElementById(rightbox).style.height = heightB + "px";
        }
    }
    $(window).load(function(){
        alignHeight("left-box","right-box");
        backToTop('body');
    });
</script>


