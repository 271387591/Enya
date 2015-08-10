/**
 * Created by lihao1 on 7/24/15.
 */
function advertHallRun(){

}
$(function(){
    //$.get(appPath+'html/web/advertHall',{},function(result){
    //    if(result.success){
    //        var tmpl = document.getElementById('hallAdvertTpl').innerHTML;
    //        var doTtmpl = doT.template(tmpl);
    //        $('#HallAdvert').html(doTtmpl(result));
    //        $(".slides-banner .slides-css:first").show();
    //        $(".slides-banner-title:first").show();
    //    }
    //});
    $.ajax({
        async: false,
        url: appPath + 'html/web/advertHall',
        data: {},
        cache: false,
        type: "GET",
        success: function (result) {
            if(result.success){
                var tmpl = document.getElementById('hallAdvertTpl').innerHTML;
                var doTtmpl = doT.template(tmpl);
                $('#HallAdvert').html(doTtmpl(result));
                $(".slides-banner .slides-css:first").show();
                $(".slides-banner-title:first").show();
            }
        }
    });

    $.get(appPath+'html/web/hotHallList',{},function(result){
        if(result.success){
            var tmpl = document.getElementById('hallListTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#hotHallDiv').html(doTtmpl(result));
        }
    });
    var exhLimit=7;
    if($(window).width()>1300){
        exhLimit=9;
    }
    $.get(appPath+'html/web/indexExh',{limit:exhLimit},function(result){
        if(result.success){
            var tmpl = document.getElementById('exhListTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#exhListDiv').html(doTtmpl(result));
        }
    });
    $.get(appPath+'html/web/indexComment',{},function(result){
        if(result.success){
            var tmpl = document.getElementById('indexCommentTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#indexCommentDiv').html(doTtmpl(result));
        }
    });

    var Interval_control = '';
    var current_index = 0;
    $("#HallAdvert .slides-banner .slides-css").hide();
    $("#HallAdvert .slides-banner .slides-css:first").show();
    $("#HallAdvert .slides-banner-title").hide();
    $("#HallAdvert .slides-banner-title:first").show();

    show_pic = function(index){
        $("#HallAdvert .slides-css").each(function(i){
            $(this).hide();
            if(i == index)
            {
                $(this).show();
            }
        });
    };

    show_content = function(index){
        $("#HallAdvert .slides-banner-title").each(function(i){
            $(this).hide();
            if(i == index)
            {
                $(this).show();
            }
        });
    };

    show_point = function(index){
        $("#HallAdvert .slides-banner-point a").each(function(i){
            if($(this).hasClass("icon-css-on"))
            {
                $(this).removeClass("icon-css-on");
                $(this).addClass("icon-css");
            }
            if(i == index)
            {
                if($(this).hasClass("icon-css"))
                {

                    $(this).removeClass("icon-css");
                }
                $(this).addClass("icon-css-on");
            }
        });

    };

    slides = function(){
        $("#HallAdvert .slides-icon a").each(function(index){
            $(this).click(function(){
                current_index = index;
                show_point(index);
                show_content(current_index);
                show_pic(current_index);
            });
        });
    };
    slides();
    var initRun=function(){
        show_point(current_index);
        show_content(current_index);
        show_pic(current_index);

        if (current_index == ($("#HallAdvert .slides-banner .slides-css a").length - 1))
        {
            current_index = -1;
        }

        current_index ++;
    };
    initRun();
    Interval_control = setInterval(initRun,8000);//设置自动切换函数

    //当触发mouseenter事件时，取消正在执行的自动切换方法，触发mouseouter事件时重新设置自动切换
    $("#HallAdvert .slides-banner .slides-css,.slides-banner-title").mouseenter(function() {
        clearInterval(Interval_control);//停止自动切换
    }).mouseleave(function() {
        Interval_control = setInterval(
            function(){
                show_point(current_index);
                show_content(current_index);
                show_pic(current_index);

                if (current_index == ($("#HallAdvert .slides-banner .slides-css a").length - 1))
                {
                    current_index = -1;
                }

                current_index ++;
            }
            ,
            8000
        );//设置自动切换函数

    });




});