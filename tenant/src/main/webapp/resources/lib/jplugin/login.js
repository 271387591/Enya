/**
 * Created by lihao1 on 7/24/15.
 */
$('#loginModel').on('show.bs.modal', function (event) {
    if(!$('#loginFailDiv').hasClass('hidden')){
        $('#loginFailDiv').addClass('hidden')
    }
    $('#loginModel').find('input').val('');
});
function submit_form(btn){
    var regEmail=/^((([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6}\;))*(([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})))$/;
    var username=$('#username').val();
    var password=$('#password').val();
    if(!regEmail.test(username)){
        $(".username_msg").html('请输入您的邮箱');
        $("#username").focus();
        setTimeout(function(){$(".username_msg").html('');},3000);
        return false;
    }
    if(password == ''){
        $(".password_msg").html('请输入您的密码');
        setTimeout(function(){$(".password_msg").html('');},3000);
        $("#password").focus();
        return false;
    }
    $.post(appPath+'j_security_check',{
        username:username,
        password:password
    },function(result){
        var ret=jQuery.parseJSON(result);
        if(ret.success){
            window.location.reload();
        }else{
            $('#loginFailDiv').removeClass('hidden');
        }
    });
}