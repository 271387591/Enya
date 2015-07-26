$(document).ready(function () {
    $("#inputNeedtail").keyup(function () {
        num = 120 - $(this).val().length;
        $("#hnum").html(num);
    });
    Calendar.setup({
        weekNumbers: true,
        inputField : "productdate",
        trigger    : "productdate",
        dateFormat: "%Y-%m-%d",
        showTime: false,
        minuteStep: 1,
        onSelect   : function() {this.hide();}
    });
    $('#updateUserBtn').click(function(){
        var uphototx=$('#uphototx').val();
        if(uphototx){
            if(!(/\.(jpe?g|png|gif|bmp)$/i.test(uphototx))){
                $('#uphototxMsg').css('color','red');
            }else{
                $('#uphototxMsg').css('color','');
            }
        }
        var obj={};
        obj.id=$('input[name=id]').val();
        obj.email=$('#inputEmail').val();
        obj.nickName=$('#inputName').val();
        obj.mobile=$('#inputProductName').val();
        obj.gender=$('#provinceid').val();
        obj.birth=$('#productdate').val();
        obj.address=$('#inputNeedtail').val();
        $.ajaxFileUpload({
            url: appPath + 'html/web/registerUser',
            secureuri:false,
            fileElementId:['uphototx'],
            dataType: 'text/html',
            data: obj,
            error: function() {
            },
            success: function(response) {
                var result=JSON.parse(response);
                if(result.success){
                    alert("注册成功");
                }else{
                    alert(result.msg);
                }
            }
        });

    });

});

function uphoto() {
    $("#uphototx").click();
}
 
