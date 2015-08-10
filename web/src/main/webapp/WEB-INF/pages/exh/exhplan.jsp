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
        <div class="right-content" >
            <div class="query-box">
                <div class="query-content">
                    <ul class="query-form" id="userSearch">
                        <li>
                            <label>会展名称</label>
                            <input type="text" name="user.Q_title_LK">
                        </li>

                    </ul>
                    <div class="btn-query">
                        <button class="btn btn-success" onclick="searchForm($('#userSearch'),'user',listNewsTable);">查询</button>
                        <button class="btn btn-default" onclick="clearSearchForm($('#userSearch'),listNewsTable);">清空</button>
                    </div>
                </div>
            </div>
            <div class="table-box">
                <div class="table-title">
                    <h5>计划列表</h5>
                    <button class="btn btn-primary btn-add" onclick="editNews();">添加</button>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="userTable">
                        <thead>
                        <tr>
                            <th>会展名称</th>
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
        </div>
    </div>
</div>
<script src="<c:url value="/resources/lib/bootstrap/typeahead-bs2.min.js"/>"></script>
<script src="<c:url value="/resources/js/admin/exh/exhplan.js"/>"></script>
<script type="text/javascript">
    jQuery(function($) {
        changeMenu($('#menu-exhplan'));
        listNewsTable();
    });
</script>
</body>
</html>