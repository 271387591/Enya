/**
 * Created by lihao1 on 7/17/15.
 */
var newsColumns=[
    {
        name:'title',
        width:500,
        renderer:function(v,rec){
            return '<a href="javascript:void(0);" onclick="editNews('+rec.id+')">'+v+'</a>';
        }
    },
    {
        name:'year',
        width:200
    },
    {
        name:'holdDate',
        width:200
    },
    {
        name:'address',
        width:200
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
            return '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'+
                '<a class="red" href="javascript:void(0);" data-rel="tooltip" title="删除" onclick="createDeleteModal('+rec.id+',null,removeNews)">'+
                '<i class="fa fa-lg fa-trash bigger-130"></i>'+
                '</a>'+
                '<a class="green" href="javascript:void(0);" data-rel="tooltip" onclick="editNews('+rec.id+');" title="编辑">'+
                '<i class="fa fa-lg fa-edit bigger-130"></i>'+
                '</a>'+
                    '<a class="blue" href="javascript:void(0);" data-rel="tooltip" onclick="pub('+rec.id+');" title="发布">'+
                '<i class="fa fa-lg fa-mail-forward bigger-130"></i>'+
                '</a>'+

                '</div>';
        }

    }

];
var pubColumns=[
    {
        name:'title',
        width:500,
        renderer:function(v,rec){
            return '<a href="javascript:void(0);" onclick="editNews('+rec.id+')">'+v+'</a>';
        }
    },
    {
        name:'year',
        width:200
    },
    {
        name:'holdDate',
        width:200
    },
    {
        name:'address',
        width:200
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
            return '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'+
                '<a class="red" href="javascript:void(0);" data-rel="tooltip" title="删除" onclick="createDeleteModal('+rec.id+',null,removeNews)">'+
                '<i class="fa fa-lg fa-trash bigger-130"></i>'+
                '</a>'+
                '<a class="green" href="javascript:void(0);" data-rel="tooltip" onclick="editNews('+rec.id+');" title="编辑">'+
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
        listNewsTable();
    }else{
        listPubTable();
    }
    $('#tab-generalHall a').click(function (e) {
        e.preventDefault()
        $(this).tab('show');
        listNewsTable();
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
            searchForm($('#userSearch'),'user',listNewsTable);
        }else if(tabIndex==1){
            searchForm($('#userSearch'),'user',listPubTable);
        }

    });
    $('#clearBtn').click(function(){
        if(tabIndex==0){
            clearSearchForm($('#userSearch'),listNewsTable);
        }else if(tabIndex==1){
            clearSearchForm($('#userSearch'),listPubTable);
        }
    });
}
function listNewsTable(params){
    $('#userTable').htable({
        url:appPath+'html/exhPlan/list',
        params: $.extend({'Q_publish_EQ':0,'Q_createDate':'DESC'},params),
        columns:newsColumns,
        pager:$('#paging')
    });
}
function listPubTable(params){
    $('#hotHallTable').htable({
        url:appPath+'html/exhPlan/list',
        params: $.extend({'Q_publish_EQ':1,'Q_idx':'DESC'},params),
        columns:pubColumns,
        pager:$('#hotHallTablePager')
    });
}



function saveNews(){
    if(!checkForm($('#userForm'))){
        return
    }
    var datas=$('#userForm').serializeArray();
    var obj={};
    for(var i=0;i<datas.length;i++){
        obj[datas[i].name]=datas[i].value;
    }
    obj.content=UE.getEditor('desEditor').getContent();
    delete obj.editorValue;
    var result=requestJSONData('html/exhPlan/security/save',obj);
    if(result.success){
        alertSuccess('保存成功');
        reloadPage('html/exhPlan/security/index');
    }else{
        alertSuccess(result.message);
    }
}
function editNews(id){
    if(id){
        reloadPage('html/exhPlan/security/edit/'+id);
    }else{
        reloadPage('html/exhPlan/security/add');
    }
}
function removeNews(id){
    var result=requestStringData('html/exhPlan/security/delete/'+id);
    if(result.success){
        alertSuccess('操作成功');
        listNewsTable(result.data.exhId);
    }else{
        alertError(result.message);
    }
}
function pub(id){
    var result=requestStringData('html/exhPlan/security/publish/'+id);
    if(result.success){
        alertSuccess('操作成功');
        listNewsTable();
    }else{
        alertError(result.message);
    }
}
function nopub(id){
    var result=requestStringData('html/exhPlan/security/nopublish/'+id);
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
    var result=requestJSONData('html/exhPlan/security/idx',datas);
    if(result.success){
        alertSuccess('操作成功');
        reloadPage('html/exhPlan/security/index');
    }else{
        alertSuccess(result.message);
    }

}
