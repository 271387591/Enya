<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@ include file="/common/taglibs.jsp" %>
    <title>年度展会计划排序</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div id="right-box" class="right-box">
    <%@ include file="../header.jsp" %>
    <div id="mainContent">
        <ul class="breadcrumb">
            <li><a href="javascript:void(0);" onclick="reloadPage('html/exhPlan/security/index');">年度展会计划</a></li>
            <li class="active">年度展会计划排序</li>
        </ul>
        <div class="right-content" >
            <div class="table-box">
                <div  align="center" style="padding-top: 10px;padding-bottom: 10px">
                    <h5 class="green">提示：仅支持前20条数据进行手工排序，在输入框中输入相应的序号，最小为1，最大为20（如不足20条，最大为当前条数）。且只能输入数字，若出现相同序号，则由系统确定其顺序。</h5>
                </div>
                <div class="table-title">
                    <h5>年度展会计划排序<span class="green">(只支持前20位排序)</span></h5>
                    <div class="pull-right">
                        <a type="button" class="btn btn-primary" onclick="reloadPage('html/exhPlan/security/index');">
                            <span>返回</span>
                        </a>
                    </div>
                </div>
                <div class="clear"></div>

                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="hotHallTable">
                        <thead>
                        <tr>
                            <th>会展名称</th>
                            <th>默认排序</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="p" items="${commands}">
                            <tr>
                                <td class="hidden"><input type="hidden" value="${p.id}" name="id"></td>
                                <td>${p.title}</td>
                                <td style="width: 20%"><input type="text" name="index" value="${p.index}" ></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix form-actions clear">
                        <div class="col-md-offset-3 col-md-9 btn-group">
                            <button type="button" class="btn btn-primary" onclick="idx();">
                                <span><i class="fa fa-save"></i>保存</span>
                            </button>
                            <button type="button" class="btn btn-default" onclick="reloadPage('html/exhPlan/security/index');">
                                <span><i class="fa fa-history"></i>返回</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/resources/js/admin/exh/exhplan.js"/>"></script>
<script type="text/javascript">
    jQuery(function($) {
        changeMenu($('#menu-exhplan'));
        var maxsize=${fn:length(commands)} || 0;
        $('input[type=text]').keyup(function(){
            var obj=$(this);
            if(!(/^[0-9]*[1-9][0-9]*$/.test(obj.val()))){
                $(this).val('');
            }
            if(obj.val()>maxsize || obj.val()<1){
                $(this).val('');
            }
        });
        $('input[type=text]').blur(function(){
            var obj=$(this);
            if(!(/^[0-9]*[1-9][0-9]*$/.test(obj.val()))){
                $(this).focus();
            }
            if(obj.val()>maxsize || obj.val()<1){
                $(this).focus();
            }
            if(!$(this).val()){
                alertNotify('请输入数字');
                $(this).focus();
            }
        });
    });
</script>
</body>
</html>