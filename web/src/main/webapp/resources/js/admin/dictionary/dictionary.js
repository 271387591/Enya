/**
 * Created by lihao1 on 6/20/15.
 */
function saveAdvert(type){

    if(!checkForm($('#userForm'))){
        return;
    }
    var datas=$('#userForm').serializeArray();
    var obj={};
    for(var i=0;i<datas.length;i++){
        obj[datas[i].name]=datas[i].value;
    }
    var result = requestJSONData('html/dictionary/security/save',obj);
    if(result.success){
        alertSuccess('保存成功');
        ajaxReloadPage('mainContent','html/dictionary/security/dicList');
    }else{
        alertError(result.message);
    }
}

var columns=[
    {
        width:150,
        name:'id'
    },
    {
        width:200,
        name:'type',
        renderer:function(v){
            v=parseInt(v);
            if(v==0){
                return '项目关键字';
            }else if(v==1){
                return '评估类型';
            }else if(v==2){
                return '评估状态';
            }else if(v==3){
                return '媒体名称';
            }else if(v==4){
                return '行业';
            }else{
                return '';
            }
        }
    },
    {
        width:200,
        name:'keyValue'
    },
    {
        name:'createDate',
        width:160,
        renderer:function(v){
            return new Date(v).format("yyyy-MM-dd hh:mm:ss");
        }
    },
    {
        width:100,
        renderer:function(v,rec){
            return '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">'+
                '<a class="green" href="javascript:void(0);" data-rel="tooltip" title="编辑" onclick="edit('+rec.id+')">'+
                '<i class="fa fa-lg fa-pencil bigger-130"></i>'+
                '</a>'+
                '<a class="red" href="javascript:void(0);" data-rel="tooltip" title="删除" onclick="createDeleteModal('+rec.id+',null,removeUser)">'+
                '<i class="fa fa-lg fa-trash bigger-130"></i>'+
                '</a>'+
                '</div>';
        }
    }
];
function listTable(params){
    $('#userTable').htable({
        url:appPath+'html/dictionary/security/list',
        params:$.extend({},params),
        columns:columns,
        pager:$('#paging')
    });

}
function removeUser(id,modal){
    var result=requestStringData('html/dictionary/security/delete/'+id);
    if(result.success){
        alertSuccess('操作成功');
        listTable();
    }else{
        alertError(result.message);
    }
    return true;
}
function edit(id){
    if(id){
        $('#mainContent').load(appPath+"html/dictionary/security/addDic?id="+id);
    }else{
        $('#mainContent').load(appPath+"html/dictionary/security/addDic")
    }
}
