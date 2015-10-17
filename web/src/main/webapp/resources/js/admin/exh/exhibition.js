/**
 * Created by lihao1 on 6/20/15.
 */
function saveAdvert(){




    var options = {
        url:appPath + 'html/exhibition/security/upload',
        dataType:'json',
        beforeSubmit:function(data){
            //console.log(data);
            //var obj1={},obj2={};
            //obj1.trade=$('#hySelector').val().join(",");
            //obj2.keyword=$('#keywordSelector').val().join(",");
            //data.push(obj1);
            //data.push(obj2);
            //console.log(data);
            for(var i=0;i<data.length;i++){
                var obj=data[i];
                if(obj.name=='trade'){
                    obj.value=$('#hySelector').val().join(",");
                }
                if(obj.name=='keyword'){
                    obj.value=$('#keywordSelector').val().join(",");
                }
            }
            if(!checkForm($('#exhibitionForm'))){
                return false;
            }
            return true;
        },
        success: function (result) {
            if(result.success){
                alertSuccess("保存成功",function(){
                    reloadPage('html/exhibition/security/edit/'+result.data);
                });
            }else{
                alertError(result.msg);
            }

        }
    };
    $("#exhibitionForm").ajaxForm(options);
    $('#exhibitionForm').ajaxSubmit(options);
    return


    //var datas=$('#exhibitionForm').serializeArray();
    //var obj={};
    //for(var i=0;i<datas.length;i++){
    //    obj[datas[i].name]=datas[i].value;
    //}
    //if(!checkForm($('#exhibitionForm'))){
    //    return
    //}
    //obj.trade=$('#hySelector').val().join(",");
    //obj.keyword=$('#keywordSelector').val().join(",");
    //$.ajaxFileUpload({
    //    url: appPath + 'html/exhibition/security/upload',
    //    secureuri:false,
    //    fileElementId:['upexhInput','upexhlogoInput'],
    //    dataType: 'text/html',
    //    data: obj,
    //    error: function() {
    //    },
    //    success: function(response) {
    //        var result=JSON.parse(response);
    //        if(result.success){
    //            alertSuccess("保存成功",function(){
    //                reloadPage('html/exhibition/security/edit/'+result.data);
    //            });
    //        }else{
    //            alertError(result.msg);
    //        }
    //    }
    //});
}
function saveDes(exhId){
    var datas=$('#exhDescriptionForm').serializeArray();
    var obj={};
    for(var i=0;i<datas.length;i++){
        obj[datas[i].name]=datas[i].value;
    }
    obj.description=(obj.editorValue)|| '';
    obj.exhId=exhId;
    delete obj.editorValue;
    var result=requestJSONData('html/exhDescription/security/save',obj);
    if(result.success){
        alertSuccess('保存成功');
    }else{
        alertSuccess(result.message);
    }
}
function saveGuide(exhId){
    var datas=$('#exhGuideForm').serializeArray();
    var obj={};
    for(var i=0;i<datas.length;i++){
        obj[datas[i].name]=datas[i].value;
    }
    obj.guide=(obj.editorValue)|| '';
    obj.exhId=exhId;
    delete obj.editorValue;
    var result=requestJSONData('html/exhGuide/security/save',obj);
    if(result.success){
        alertSuccess('保存成功');
    }else{
        alertSuccess(result.message);
    }
}
function saveGuideTo(exhId){
    var datas=$('#guidetoForm').serializeArray();
    var obj={};
    for(var i=0;i<datas.length;i++){
        obj[datas[i].name]=datas[i].value;
    }
    obj.guideTo=(obj.editorValue) ||'';
    obj.exhId=exhId;
    delete obj.editorValue;
    var result=requestJSONData('html/exhGuideTo/security/save',obj);
    if(result.success){
        alertSuccess('保存成功');
    }else{
        alertSuccess(result.message);
    }
}
function saveSponsor(exhId){
    var datas=$('#sponsorForm').serializeArray();
    var obj={};
    for(var i=0;i<datas.length;i++){
        obj[datas[i].name]=datas[i].value;
    }
    obj.sponsor=(obj.editorValue) || '';
    obj.exhId=exhId;
    delete obj.editorValue;
    var result=requestJSONData('html/exhSponsor/security/save',obj);
    if(result.success){
        alertSuccess('保存成功');
    }else{
        alertSuccess(result.message);
    }
}
function saveTravel(exhId){
    var datas=$('#travelForm').serializeArray();
    var obj={};
    for(var i=0;i<datas.length;i++){
        obj[datas[i].name]=datas[i].value;
    }
    obj.travel=(obj.editorValue)|| '';
    obj.exhId=exhId;
    delete obj.editorValue;
    var result=requestJSONData('html/exhTravel/security/save',obj);
    if(result.success){
        alertSuccess('保存成功');
    }else{
        alertSuccess(result.message);
    }
}
var columns=[
    {
        name:'name',
        width:200,
        renderer:function(v,rec){
            return '<a href="javascript:void(0);" onclick="edit('+rec.id+')">'+v+'</a>';
        }
    },
    {
        width:150,
        name:'hallName'
    },
    {
        width:200,
        name:'address'
    },
    {
        width:180,
        name:'tradeNames'
    },
    {
        name:'startDate',
        width:120,
        renderer:function(v){
            return new Date(v).format("yyyy-MM-dd");
        }
    },
    {
        name:'endDate',
        width:120,
        renderer:function(v){
            return new Date(v).format("yyyy-MM-dd");
        }
    },
    {
        width:80,
        renderer:function(v,rec){
            var pTitle="'设为热门'",pContent="'您确定要将该展馆设为热门展馆?'",delDiv=v?"hidden":"red",updateDiv=v?"hidden":"green";
            return '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'+
                '<a class="'+delDiv+'" href="javascript:void(0);" data-rel="tooltip" title="删除" onclick="createDeleteModal('+rec.id+',null,removeUser)">'+
                '<i class="fa fa-lg fa-trash bigger-130"></i>'+
                '</a>'+
                '<a class="'+updateDiv+'" href="javascript:void(0);" data-rel="tooltip" onclick="edit('+rec.id+');" title="编辑">'+
                '<i class="fa fa-lg fa-edit bigger-130"></i>'+
                '</a>'+
                '<a class="blue" href="javascript:void(0);" data-rel="tooltip" onclick="pub('+rec.id+');" title="发布">'+
                '<i class="fa fa-lg fa-mail-forward bigger-130"></i>'+
                '</a>'+
                '</div>';
        }

    }
];
var pubcolumns=[
    {
        name:'name',
        width:200,
        renderer:function(v,rec){
            return '<a href="javascript:void(0);" onclick="edit('+rec.id+')">'+v+'</a>';
        }
    },
    {
        width:150,
        name:'hallName'
    },
    {
        width:100,
        name:'address'
    },
    {
        width:80,
        name:'tradeNames'
    },
    {
        name:'startDate',
        width:120,
        renderer:function(v){
            return new Date(v).format("yyyy-MM-dd");
        }
    },
    {
        name:'endDate',
        width:120,
        renderer:function(v){
            return new Date(v).format("yyyy-MM-dd");
        }
    },
    {
        name:'pubDate',
        width:140,
        renderer:function(v){
            if(!v)return '';
            return new Date(v).format("yyyy-MM-dd hh:mm:ss");
        }
    },
    {
        name:'index',
        width:40
    },
    {
        width:80,
        renderer:function(v,rec){
            var pTitle="'设为热门'",pContent="'您确定要将该展馆设为热门展馆?'",delDiv=v?"hidden":"red",updateDiv=v?"hidden":"green";
            return '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'+
                '<a class="'+delDiv+'" href="javascript:void(0);" data-rel="tooltip" title="删除" onclick="createDeleteModal('+rec.id+',null,removeUser)">'+
                '<i class="fa fa-lg fa-trash bigger-130"></i>'+
                '</a>'+
                '<a class="'+updateDiv+'" href="javascript:void(0);" data-rel="tooltip" onclick="edit('+rec.id+');" title="编辑">'+
                '<i class="fa fa-lg fa-edit bigger-130"></i>'+
                '</a>'+
                '<a class="blue" href="javascript:void(0);" data-rel="tooltip" onclick="nopub('+rec.id+');" title="取消发布">'+
                '<i class="fa fa-lg fa-mail-reply bigger-130"></i>'+
                '</a>'+
                '</div>';
        }

    }
];
function initList(tabIndex){
    if(tabIndex==0){
        listTable();
    }else{
        listPubTable();
    }
    $('#tab-generalHall a').click(function (e) {
        e.preventDefault()
        $(this).tab('show');
        listTable();
        tabIndex=0;
        $('#userSearch input[name="user.hot"]').val(tabIndex);
    });
    $('#tab-hotHall a').click(function (e) {
        e.preventDefault()
        $(this).tab('show');
        listPubTable();
        tabIndex=1;
        $('#userSearch input[name="user.hot"]').val(tabIndex);
    });
    $('#searchBtn').click(function(){
        if(tabIndex==0){
            searchForm($('#userSearch'),'user',listTable);
        }else if(tabIndex==1){
            searchForm($('#userSearch'),'user',listPubTable);
        }

    });
    $('#clearBtn').click(function(){
        if(tabIndex==0){
            clearSearchForm($('#userSearch'),listTable);
        }else if(tabIndex==1){
            clearSearchForm($('#userSearch'),listPubTable);
        }
    });
}
function listTable(params){
    $('#userTable').htable({
        url:appPath+'html/exhibition/list',
        params: $.extend({'Q_exh.publish_EQ':0,'Q_exh.createDate':'DESC'},params),
        columns:columns,
        pager:$('#paging')
    });
}
function listPubTable(params){
    $('#hotHallTable').htable({
        url:appPath+'html/exhibition/list',
        params: $.extend({'Q_exh.publish_EQ':1,'Q_exh.idx':'DESC'},params),
        columns:pubcolumns,
        pager:$('#hotHallTablePager')
    });
}

function edit(id){
    if(id){
        reloadPage("html/exhibition/security/edit/"+id);
    }else{
        reloadPage("html/exhibition/security/add")
    }
}
function setHot(id){
    var result=requestStringData('html/exhibitionHall/security/hot/'+id,{});
    if(result.success){
        alertSuccess('操作成功');
        listGenTable();
    }else{
        alertError(result.message);
    }
}
function removeUser(id,modal){
    var result=requestStringData('html/exhibition/security/delete/'+id);
    if(result.success){
        alertSuccess('操作成功');
        listTable();
    }else{
        alertError(result.message);
    }
    return true;
}
function pub(id){
    var result=requestStringData('html/exhibition/security/publish/'+id);
    if(result.success){
        alertSuccess('操作成功');
        listTable();
    }else{
        alertError(result.message);
    }
}
function nopub(id){
    var result=requestStringData('html/exhibition/security/nopublish/'+id);
    if(result.success){
        alertSuccess('操作成功');
        listPubTable();
    }else{
        alertError(result.message);
    }
}
function idx(){
    var datas=[];
    var v=true;
    $('#hotHallTable').find('tbody tr').each(function(){
        var id=$(this).find('td input[name=id]').val();
        var index=$(this).find('td input[name=index]').val();
        if(!index){
            v=false;
            return false;
        }
        var obj={
            id:id,
            index:index
        };
        datas.push(obj);
    });
    if(!v){
        alertNotify('请输入数字');
        return
    }
    var result=requestJSONData('html/exhibition/security/idx',datas);
    if(result.success){
        alertSuccess('操作成功');
        reloadPage('html/exhibition/security/index');
    }else{
        alertSuccess(result.message);
    }

}

