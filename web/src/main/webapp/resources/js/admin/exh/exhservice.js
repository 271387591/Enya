/**
 * Created by lihao1 on 6/20/15.
 */

function saveAdvert(type,publish){
    var datas=$('#userForm').serializeArray();
    var obj={};
    for(var i=0;i<datas.length;i++){
        obj[datas[i].name]=datas[i].value;
    }
    obj.content=UE.getEditor('desEditor').getContent();
    if(!checkForm($('#userForm'))){
        return
    }
    delete obj.editorValue;
    var result=requestJSONData('html/exhService/security/save',obj);
    if(result.success){
        alertSuccess("保存成功",function(){
            reloadPage('html/exhService/security/index');
        });
    }else{
        alertError(result.message);
    }
}
var columns=[
    {
        width:400,
        name:'title',
        renderer:function(v,rec){
            return '<a href="javascript:void(0);" onclick="edit('+rec.id+')">'+v+'</a>';
        }
    },
    {
        width:200,
        name:'source'
    },
    {
        name:'createDate',
        width:140,
        renderer:function(v){
            return new Date(v).format("yyyy-MM-dd hh:mm:ss");
        }
    },
    {
        width:90,
        renderer:function(v,rec){
            var pTitle="'设为热门'",pContent="'您确定要将该展馆设为热门展馆?'";
            return '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'+
                '<a class="red" href="javascript:void(0);" data-rel="tooltip" title="删除" onclick="createDeleteModal('+rec.id+',null,removeNews)">'+
                '<i class="fa fa-lg fa-trash bigger-130"></i>'+
                '</a>'+
                '<a class="green" href="javascript:void(0);" data-rel="tooltip" title="编辑" onclick="edit('+rec.id+')">'+
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
        width:400,
        name:'title',
        renderer:function(v,rec){
            return '<a href="javascript:void(0);" onclick="edit('+rec.id+')">'+v+'</a>';
        }
    },
    {
        width:200,
        name:'source'
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
        width:90,
        renderer:function(v,rec){
            var pTitle="'设为热门'",pContent="'您确定要将该展馆设为热门展馆?'";
            return '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'+
                '<a class="red" href="javascript:void(0);" data-rel="tooltip" title="删除" onclick="createDeleteModal('+rec.id+',null,removeNews)">'+
                '<i class="fa fa-lg fa-trash bigger-130"></i>'+
                '</a>'+
                '<a class="green" href="javascript:void(0);" data-rel="tooltip" title="编辑" onclick="edit('+rec.id+')">'+
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
        url:appPath+'html/exhService/list',
        params: $.extend({'Q_publish_EQ':0,'Q_createDate':'DESC'},params),
        columns:columns,
        pager:$('#paging')
    });
}
function listPubTable(params){
    $('#hotHallTable').htable({
        url:appPath+'html/exhService/list',
        params: $.extend({'Q_publish_EQ':1,'Q_idx':'DESC'},params),
        columns:pubcolumns,
        pager:$('#hotHallTablePager')
    });
}


function edit(id){
    if(id){
        reloadPage("html/exhService/security/edit/"+id);
    }else{
        reloadPage("html/exhService/security/add")
    }
}
function removeNews(id,modal){
    var result=requestStringData('html/exhService/security/delete/'+id);
    if(result.success){
        alertSuccess('操作成功');
        listTable();
    }else{
        alertError(result.message);
    }
    return true;
}
function pub(id){
    var result=requestStringData('html/exhService/security/publish/'+id);
    if(result.success){
        alertSuccess('操作成功');
        listTable();
    }else{
        alertError(result.message);
    }
}
function nopub(id){
    var result=requestStringData('html/exhService/security/nopublish/'+id);
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
    var result=requestJSONData('html/exhService/security/idx',datas);
    if(result.success){
        alertSuccess('操作成功');
        reloadPage('html/exhService/security/index');
    }else{
        alertSuccess(result.message);
    }

}

