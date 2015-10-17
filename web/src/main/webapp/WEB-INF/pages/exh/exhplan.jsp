<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@ include file="/common/taglibs.jsp" %>
    <title>年度展会计划</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div id="right-box" class="right-box">
    <%@ include file="../header.jsp" %>
    <div id="mainContent">
        <ul class="breadcrumb">
            <li class="active">年度展会计划</li>
        </ul>
        <div class="right-content" >
            <div class="query-box">
                <div class="query-content">
                    <ul class="query-form" id="userSearch">
                        <li>
                            <label>会展名称</label>
                            <input type="text" name="user.Q_title_LK">
                        </li>
                        <input type="hidden" name="user.hot"/>

                    </ul>
                    <div class="btn-query">
                        <button class="btn btn-success" id="searchBtn">查询</button>
                        <button class="btn btn-default" id="clearBtn">清空</button>
                    </div>
                </div>
            </div>
            <div class="table-box">
                <div class="table-title">
                    <button class="btn btn-primary btn-add" onclick="editNews();">添加</button>
                    <ul class="nav nav-tabs" role="tablist">
                        <li id="tab-generalHall" role="presentation" class="active"><a href="#generalHall" aria-controls="home" role="tab" data-toggle="tab">未发布</a></li>
                        <li id="tab-hotHall" role="presentation"><a href="#hotHall" aria-controls="profile" role="tab" data-toggle="tab">已发布</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="generalHall">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="userTable">
                                <thead>
                                <tr>
                                    <th>会展名称</th>
                                    <th>举办年份</th>
                                    <th>举办时间</th>
                                    <th>举办地点</th>
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
                    <div role="tabpanel" class="tab-pane" id="hotHall">
                        <div >
                            <a class="btn btn-primary  " style="margin: 5px 20px" href="<c:url value="/html/exhPlan/security/sort"/>">手工排序</a>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="hotHallTable">
                                <thead>
                                <tr>
                                    <th>会展名称</th>
                                    <th>举办年份</th>
                                    <th>举办时间</th>
                                    <th>举办地点</th>
                                    <th>发布时间</th>
                                    <th>默认排序</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>

                        <div class="table-bottom">
                            <div id="hotHallTablePager" class="paging"></div>
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
        jQuery(function(){
            var tabIndex=0;
            initList(tabIndex);
        });
    });
</script>
</body>
</html>