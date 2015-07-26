String.prototype.format=function()
{
    if(arguments.length==0) return this;
    for(var s=this, i=0; i<arguments.length; i++)
        s=s.replace(new RegExp("\\{"+i+"\\}","g"), arguments[i]);
    return s;
};
Date.prototype.format = function(format){
    var d=this;
    var o = {
        "M+" : d.getMonth()+1, //month
        "d+" : d.getDate(), //day
        "h+" : d.getHours(), //hour
        "m+" : d.getMinutes(), //minute
        "s+" : d.getSeconds(), //second
        "q+" : Math.floor((d.getMonth()+3)/3), //quarter
        "S" : d.getMilliseconds() //millisecond
    }

    if(/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }

    for(var k in o) {
        if(new RegExp("("+ k +")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
        }
    }
    return format;
};
//Array.prototype.hasElement = function (element) {
//    for (var i = 0; i < this.length; i++) {
//        if (this[i] == element) {
//            return true;
//        }
//    }
//    return false;
//};
//Array.prototype.hasElement=function(ele){
//    for(var i=0;i<this.length;i++){
//        if(this[i]==ele){
//            return true;
//        }
//    }
//    return false;
//};
function alertSuccess(msg,callback){
    jSuccess(msg,{
        // autoHide : true,       // 是否自动隐藏提示条
        clickOverlay : false,  // 是否单击遮罩层才关闭提示条
        MinWidth : 200,        // 最小宽度
        TimeShown : 1500,      // 显示时间：毫秒
        ShowTimeEffect : 200,  // 显示到页面上所需时间：毫秒
        HideTimeEffect : 200,  // 从页面上消失所需时间：毫秒
        LongTrip : 15,         // 当提示条显示和隐藏时的位移
        HorizontalPosition : "center",// 水平位置:left, center, right
        VerticalPosition : "top",// 垂直位置：top, center, bottom
        ShowOverlay : false,     // 是否显示遮罩层
        ColorOverlay : "#000",  // 设置遮罩层的颜色
        OpacityOverlay : 0.3,   // 设置遮罩层的透明度
        onCompleted:callback
    });
}
function alertError(msg){
    jError(msg,{
        HorizontalPosition : "center",
        VerticalPosition : "center"
    });
}
function alertNotify(msg){
    jNotify(msg,{
        HorizontalPosition : "center",
        VerticalPosition : "center"
    });
}
function createDeleteModal(id,title,callback){
    createModal(id,'删除数据',title?title:'您确定要删除该数据',callback);
}
function createModal(parmas,title,content,callback){
    var html='<div class="modal fade" id="createModal" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">'+
            '<div class="modal-dialog width-25">'+
            '<div class="modal-content">'+
            '<div class="modal-header">'+
            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
            '<h4 class="modal-title"><i class="red fa fa-info-circle"></i>'+title+'</h4>'+
            '</div>'+
            '<div class="modal-body">'+
            '<div class="container-fluid">'+
            '<h4><i class="red fa fa-question-circle bigger-100"></i>'+content+'</h4>'+
            '</div>'+
            '</div>'+
            '<div class="modal-footer">'+
            '<button type="button" class="btn btn-primary" data-type="ok">确定</button>'+
            '<button type="button" class="btn" data-dismiss="modal">取消</button>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>';
    var modal = $(html).modal('show');
    modal.on('hide.bs.modal',function(){
        $('#createModal').remove();
    });
    modal.find('button[data-type=ok]').click(function(){
        if(callback){
            callback(parmas,modal);
        }
        modal.modal('hide');
    });
}

function requestJSONData(url, o) {
    var result = null;
    $.ajax({
        async: false,
        url: appPath + url,
        dataType: 'json',
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(o),
        cache: false,
        type: "POST",
        success: function (data) {
            result = data;
        },
        fail: function(a,b,c){
            alertError('请求出错');
        }
    });
    return result;
}

function requestStringData(url, o) {
    var result = null;
    $.ajax({
        async: false,
        url: appPath+url,
        data: o,
        cache: false,
        type: "POST",
        success: function (data) {
            result = data;
        },
        fail: function (a, b, c) {
            alertError(homeRes.message.requestError);
        }
    });
    return result;
}
function findPage(url, param) {
    param= $.extend(param,{pageSize:5})
    var list = requestData(url, param);
    if ((!list.objects || list.objects.length == 0) && list.pageBean.totalRecords) {
        param.pageIndex = param.pageIndex - 1;
        list = requestData(url, param);
    }

    return list;
}


function initComboData(combo,url, param, valueFiled, displayFiled,defaultValue) {
    var result = [];
    var list = requestStringData(url, param);
    combo.find("option").remove();
    if (list && list.data && list.data.length > 0) {
        var result = list.data;
        for (var i = 0; i < result.length; i++) {
            var comboData = result[i];
            var value=comboData[valueFiled];
            var display=comboData[displayFiled];
            var selected='selected="selected"';
            var hasValue=(value==defaultValue)?selected:'';
            if(typeof defaultValue =='object'){
                for(var item in defaultValue){
                    if(defaultValue[item]==value){
                        hasValue=selected;
                        break;
                    }
                }
            }
            combo.append('<option value="' + value + '" '+hasValue+'>' + display + '</option>')
        }
    }
    return result;
}


function submitAjaxForm(form, objectName, url, callback) {
    var params = {};
    form.find("[name^='" + objectName + "']").each(function (i, o) {
        var name = $(o).attr("name").split(".")[1];
        params[name] = $(o).val();
    });
    callback(requestData(url, params));
}
function searchForm(form,objectName,callback) {
    var params = {};
    form.find("[name^='" + objectName + "']").each(function (i, o) {
        var name = $(o).attr("name");
        var index=name.indexOf('.');
        name=name.substr(index+1);
        params[name] = $(o).val();
    });
    if(callback){
        callback(params);
    }
}
function clearSearchForm(form,callback) {
    clearForm(form);
    if(callback){
        callback({});
    }
}


function reloadPage(url){
    window.location=(appPath+url);
}
function ajaxReloadPage(div,url){
    $('#'+div).load(appPath+url);
}



function checkForm(form) {
    var valid = true;
    form.find("input[type='text'],input[type='password'],select,textarea").each(function (i, o) {
        if (!validateData($(o))) {
            valid = false;
        }
    });
    if(!valid){
        $("html, body").animate({ scrollTop: 0 }, 600);
    }
    return valid;
}

function clearForm(obj,notClears) {
    obj.find("input[type='text'],input[type='hidden'],input[type='password'],select,textarea").not(notClears).each(function (i, o) {
        validSuccess($(o));
        $(o).val('');
    });
}


function blurInput(inputs){
    inputs.blur(function(){
        validateData($(this));
    });
}

function validateData(obj) {
    var validate=obj.data('validate');
    if(validate=='required'){
        return validateRequired(obj);
    }else if(validate=='mobile'){
        return validateMobile(obj);
    }else if(validate=='password'){
        return validatePassword(obj);
    }else if(validate=='passwordHit'){
        var pwd=$('#'+obj.data('hit'));
        return validatePasswordHit(pwd,obj);
    }else if(validate=='integer'){
        return validateInteger(obj);
    }else if(validate=='email'){
        return validateEmail(obj);
    }else if(validate=='username'){
        return validateUsername(obj);
    }else if(validate=='length'){
        var length=obj.data('len');
        length=new Number(length);

        return validateLength(obj,length);
    }else if(validate=='picture'){
        return validatePicture(obj);
    }
    return true;
}
function validateRequired(obj){
    var v = obj.val();
    if(!v){
        validFailure(obj, '不能为空');
        return false;
    }
    validSuccess(obj);
    return true;
}
function validatePassword(obj){
    if(!/^[0-9a-zA-Z]{6,16}$/.test(obj.val())){
        validFailure(obj,'请输入6-16位数字或字母组成的密码,不含下划线和特殊字符');
        return false;
    }
    validSuccess(obj);
    return true;
}
function validatePasswordHit(pas,hit){
    if(pas.val()!=hit.val()){
        validFailure(hit,'两次密码输入不一致');
        return false;
    }
    validSuccess(hit);
    return true;
}
function validateMobile(obj) {    //移动电话
    if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(obj.val()))){
        validFailure(obj,'请输入合法的手机号码');
        return false;
    }
    validSuccess(obj);
    return true;
}
function validateInteger(obj) {    //整数
    if(!(/^[0-9]*[1-9][0-9]*$/.test(obj.val()))){
        validFailure(obj,'请输入整数');
        return false;
    }
    validSuccess(obj);
    return true;
}

function validateEmail(obj) {   //邮件
    var regEmail=/^((([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6}\;))*(([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})))$/;
    if(!(regEmail.test(obj.val()))){
        validFailure(obj,'请输入正确的电子邮件地址');
        return false;
    }
    validSuccess(obj);
    return true;

}
function validateUsername(obj) {   //邮件
    var regEmail=/^[a-zA-Z0-9_]{3,16}$/;
    if(!(regEmail.test(obj.val()))){
        validFailure(obj,'请输入由字母或数字组成的用户名');
        return false;
    }
    validSuccess(obj);
    return true;
}
function validateLength(obj,length) {   //长度
    var val=obj.val();
    if(val.length>length){
        validFailure(obj,'长度不能超过'+length+'位');
        return false;
    }
    validSuccess(obj);
    return true;
}
function validatePicture(obj) {   //长度
    if(!(/\.(jpe?g|png|gif|bmp)$/i.test(obj.val()))){
        validFailure(obj,'请选择jpg/png/gif/bmp/jpeg格式的图片');
        return false;
    }
    validSuccess(obj);
    return true;
}




function validFailure(obj, title) {
    var error='<div class="validation validation-right">'+
                '<i class="fa fa-remove"></i>'+
                title+
                '</div>';
    obj.closest('.form-group').children('.validation').remove();
    obj.closest('.form-group').append(error);
}
function validSuccess(obj) {
    obj.closest('.form-group').children('.validation').remove();
}



function validateNumber(obj) {  //电话号码
    if(!(/^[0-9]*$/.test(obj.val()))){
        validFailure(obj,'请输入数字');
        return false;
    }
    validSuccess(obj)
    return true;
}
function isPostCode(number) {//邮编
    var postCode = /^[1-9]\d{5}$/;
    return postCode.exec(number);

}
function setImagePreviews(avalue) {
    var docObj = document.getElementById("doc");
    var dd = document.getElementById("dd");
    dd.innerHTML = "";
    var fileList = docObj.files;
    for (var i = 0; i < fileList.length; i++) {

        dd.innerHTML += "<div style='float:left' > <img id='img" + i + "'  /> </div>";
        var imgObjPreview = document.getElementById("img"+i);
        if (docObj.files && docObj.files[i]) {
            //火狐下，直接设img属性
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '150px';
            imgObjPreview.style.height = '180px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);
        }
        else {
            //IE下，使用滤镜
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            alert(imgSrc)
            var localImagId = document.getElementById("img" + i);
            //必须设置初始大小
            localImagId.style.width = "150px";
            localImagId.style.height = "180px";
            //图片异常的捕捉，防止用户修改后缀来伪造图片
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            }
            catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
    }

    return true;
}
function uploadClick(tempFile,file){
    file.click();
    file.change(function(){
        tempFile.val($(this).val());
    })
}
backToTop = function(className){
    var $backToTopTxt = "返回顶部", $backToTopEle = $('<a class="backToTop" href="javascript:void(0);"><i class="fa fa-double-angle-up icon-only fa-3x"></i></a>').appendTo($(className))
        .text('').attr("title", $backToTopTxt).click(function() {
            $("html, body").animate({ scrollTop: 0 }, 600);
        }), $backToTopFun = function() {
        var st = $(document).scrollTop(), winh = $(window).height();
        (st > 0)? $backToTopEle.show(): $backToTopEle.hide();
        //IE6下的定位
        if (!window.XMLHttpRequest) {
            $backToTopEle.css("top", st + winh - 166);
        }
    };
    $(window).bind("scroll", $backToTopFun);
    $(function() { $backToTopFun(); });
};



(function($){

    var methods = {
        init:function(options){
            var o = $.extend({
                mode:'MULTI',//SINGLE
                idProperty:'id',
                params:{
                    start:0,
                    limit:15
                }
            }, options || {});
            var self = this;
            this.each(function() {
                methods._loadTableUrl(o.url, o.params,self, o.columns, o.pager, o.idProperty);
                methods._initCheck.call(self,o);
            });
        },
        getSelected:function(){
            var self = this,data=[];
            self.find('tr > td:first-child input:checkbox').each(function(){
                if(this.checked){
                    var identObj = $(this).closest('tr').find('td:last-child');
                    var id = identObj.data('id');
                    data.push(id);
                }
            });
            return data;
        },
        _initCheck:function(o){
            var self = this;
            if(o.mode=='MULTI'){
                self.find('th input:checkbox').on('click',function(){
                    var that = this;
                    $(this).closest(self).find('tr > td:first-child input:checkbox')
                        .each(function(){
                            this.checked = that.checked;
                            $(this).closest('tr').toggleClass('selected');
                        });
                });
            }else if(o.mode=='SINGLE'){
                self.find('th input:checkbox').toggleClass('disabled')
                self.find('tr > td:first-child input:checkbox').on('click',function(){
                    $(this).closest('tr').toggleClass('selected');
                    var current=$(this),cChecked=this.checked;
                    self.find('tr > td:first-child input:checkbox').not(current).each(function(){
                        this.checked=cChecked?!cChecked:cChecked;
                    });
                });
            }
        },
        _requestData:function(url,o){
            var result = null;
            $.ajax({
                async: false,
                url: url,
                data:o,
                cache: false,
                type: "POST",
                success: function (data) {
                    result = data;
                },
                fail: function (a, b, c) {
                    alert('请求出错了');
                }
            });
            return result;
        },
        _loadTableData:function(url,parmas,pager,callback){
            var result = methods._requestData(url, parmas);
            var list=result.data;
            var total=result.total;
            var currentPage=Math.ceil(parmas.start/parmas.limit)+1;
            pager.pager({
                totalRecords: total||0,
                pageSize: parmas.limit,
                pagenumber:currentPage,
                buttonClickCallback:callback
            });
            return list;
        },
        _loadTableUrl:function(url,parmas,table,columns,pager,idProperty){
            table.append('<div class="message-loading-overlay"><i class="fa fa-2x fa-spin fa-spinner"></i></div>');
            parmas= $.extend({start:0,limit:10}, parmas);
            var list = methods._loadTableData(url, parmas,pager,function(pageNumber,event){
                var pageP=$.extend(parmas,{start:(pageNumber-1)*(parmas.limit)});
                methods._loadTableUrl(url,pageP,table,columns,pager,idProperty)
            });
            var tbody=table.find('tbody');
            var html="";
            if(list && list.length>0){
                for(var i=0;i<list.length;i++){
                    var obj=list[i];
                    var tr='<tr>';

                    for(var j=0;j<columns.length;j++){
                        var column=columns[j];
                        var name=column.name ||'';
                        var width=column.width;
                        var cls=column.cls;
                        var val=obj[name];
                        if(val==undefined || val==null ){
                            val='';
                        }
                        var sub=Math.floor(width/12);
                        if(!isNaN(sub) && val.length>sub){
                            val= val.substr(0,(sub-3))+'...';
                        }

                        var renderer=function(v){
                            if(column.renderer){
                                return column.renderer(v,obj);
                            }else{
                                return null;
                            }
                        }(val);

                        var td,tdcls,tdwidth;

                        if(cls){
                            tdcls='class="'+cls+'"';
                        }
                        if(width>0){
                            tdwidth='style="min-width:'+width+'px;"';
                        }
                        td='<td '+(tdcls?tdcls:'')+' '+(tdwidth?tdwidth:'')+'>'+(renderer!=null?renderer:val)+'</td>';
                        tdcls=undefined;
                        tdwidth=undefined;
                        tr+= td;
                    }
                    tr+='<td class="hidden" data-id="'+obj[idProperty]+'"></td></tr>'
                    html+=tr;
                }
            }
            tbody.html(html);
            setTimeout(function() {
                table.find('.message-loading-overlay').remove();
            }, 300 + parseInt(Math.random() * 300));
        }
    };

    $.fn.htable = function(method) {

        // Method calling logic
        if (methods[method] && method.charAt(0) != '_') {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' +  method + ' does not exist on jQuery.pagination');
        }

    };

})(jQuery);
