<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/19/15
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@ include file="/common/taglibs.jsp" %>
    <title>主页配置</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div id="right-box" class="right-box">
    <%@ include file="../header.jsp" %>
    <div id="mainContent">
        <ul class="breadcrumb">
            <li class="active"><i class="icon-user"></i>主页配置</li>
        </ul>
        <div class="right-content" id="right-content">
            <div class="content-title">
                <ul>
                    <li><h5>主页配置</h5></li>
                </ul>
            </div>
            <div class="content-box">
                <div class="table-title">
                    <ul class="nav nav-tabs" role="tablist">
                        <li id="basicInfo" role="presentation" class="active"><a href="#basicInfoExh" aria-controls="home" role="tab" data-toggle="tab">基础信息</a></li>
                        <li id="tab-friend"  aria-disabled="true" role="presentation"><a href="#friendTab" role="tab" data-toggle="tab">友情链接配置</a></li>
                        <li id="tab-email"  aria-disabled="true" role="presentation"><a href="#emailTab" role="tab" data-toggle="tab">系统邮箱配置</a></li>
                        <li id="tab-zx"  aria-disabled="true" role="presentation"><a href="#emailZx" role="tab" data-toggle="tab">二维码生成</a></li>
                        <%--<li id="tab-advert"  aria-disabled="true" role="presentation"><a href="#advertTab" role="tab" data-toggle="tab">广告位配置</a></li>--%>
                    </ul>
                </div>
                <div class="clear"></div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="basicInfoExh">
                        <form class="form-horizontal padding-10" id="userForm">
                            <input type="hidden" value="${command.id}" name="id"/>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">公司LOGO</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input value="${command.logoName}" name="logoName" type='text' readonly id="logotextfield" data-validate="picture" class='form-control' onclick="uploadClick($(this),$('#uplogoInput'))" />
                                </div>
                                <button type="button" rel="ajax-upload-avatar" class="btn btn-primary" onclick="uploadClick($('#logotextfield'),$('#uplogoInput'))" >
                                    选择图片
                                </button>
                                <input type="file" style="display:none;" id="uplogoInput" name="logo"  />
                                <i class="notnull">*</i>
                                <i class="notnull green">建议上传高度约90，宽度约630的图片</i>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right">地址</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input type="text" class="form-control" name="address" data-validate="required" value="${command.address}" placeholder="地址"  />
                                </div>
                                <i class="notnull">*</i>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">邮编</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input type="text" class="form-control" name="zipCode" data-validate="required" value="${command.zipCode}" placeholder="邮编"  />
                                </div>
                                <i class="notnull">*</i>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">传真</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input type="text" class="form-control" name="facsimile" data-validate="required" value="${command.facsimile}" placeholder="传真"  />
                                </div>
                                <i class="notnull">*</i>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">电话</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input type="text" class="form-control" name="phone" data-validate="required" value="${command.phone}" placeholder="电话"  />
                                </div>
                                <i class="notnull">*</i>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">电子邮件</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input type="text" class="form-control" name="email" data-validate="email" value="${command.email}" placeholder="电子邮件"  />
                                </div>
                                <i class="notnull">*</i>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">Copyright</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input type="text" class="form-control" name="copyright" data-validate="required" value="${command.copyright}" placeholder="copyright"  />
                                </div>
                                <i class="notnull">*</i>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label">备案号</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input type="text" class="form-control" name="icp" data-validate="required" value="${command.icp}" placeholder="备案号"  />
                                </div>
                                <i class="notnull">*</i>
                            </div>


                            <div class="clearfix form-actions clear">
                                <div class="col-md-offset-3 col-md-9 btn-group">
                                    <button type="button" class="btn btn-primary" onclick="saveAdvert(${command.id!=null?"'edit'":"'save'"});">
                                        <span><i class="fa fa-save"></i>保存</span>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="reloadPage('html/exhibitionHall/security/index');">
                                        <span><i class="fa fa-history"></i>返回</span>
                                    </button>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div role="tabpanel" class="tab-pane" id="friendTab">
                    </div>
                    <div role="tabpanel" class="tab-pane active" id="emailTab">

                    </div>
                    <div role="tabpanel" class="tab-pane" id="emailZx">
                        <form class="form-horizontal padding-10" id="zxForm">
                            <div class="form-group">
                                <label class="col-sm-1 control-label">访问地址前缀</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input type="text" class="form-control" name="zx" data-validate="required"  placeholder="访问地址"  />
                                </div>
                                <i class="notnull">*</i>
                            </div>
                            <div class="clearfix form-actions clear">
                                <div class="col-md-offset-3 col-md-9 btn-group">
                                    <button type="button" class="btn btn-primary" onclick="saveZx('${command.id}');">
                                        <span><i class="fa fa-save"></i>生成二维码</span>
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">二维码</label>
                                <div class="col-sm-5 no-padding-right">
                                    <img id="zxImg" src="${command.zxUrl}">
                                </div>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<c:url value="/resources/js/admin/system/homepage.js"/>"></script>
<script type="text/javascript">
    changeMenu($('#menu-homePage'));
    $(function(){
        $('#tab-friend').click(function(e){
            e.preventDefault()
            $(this).tab('show');
            ajaxReloadPage("friendTab",'html/friendLink/security/friendList');
        });
        $('#tab-email').click(function(e){
            e.preventDefault()
            $(this).tab('show');
            ajaxReloadPage("emailTab",'html/emailConfig/security/getemail');
        });

    });
</script>
</body>
</html>


