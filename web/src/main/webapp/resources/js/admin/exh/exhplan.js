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
                '</div>';
        }

    }

];
function listNewsTable(params){
    $('#userTable').htable({
        url:appPath+'html/exhPlan/list',
        params: $.extend({},params),
        columns:newsColumns,
        pager:$('#paging')
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