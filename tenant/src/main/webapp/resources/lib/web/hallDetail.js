/**
 * Created by lihao1 on 7/24/15.
 */
var iBShare = {
    //初始化
    init: function() {
        var $shareBox = $(".bshare-custom");
        //加载分享工具
        var tools = '<a title="分享到QQ空间" class="bshare-qzone"></a>';
        tools += '<a title="分享到新浪微博" class="bshare-sinaminiblog"></a>';
        tools += '<a title="分享到人人网" class="bshare-renren"></a>';
        tools += '<a title="分享到腾讯微博" class="bshare-qqmb"></a>';
        tools += '<a title="分享到网易微博" class="bshare-neteasemb"></a>';
        tools += '<a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>';
        $shareBox.append(tools);
        //绑定分享事件
        $shareBox.children("a").click(function() {
            var parents = $(this).parent();
            $.post(appPath+'html/web/hallPs/s/'+hallId);
        });
    }
}


function getComment(pageIndex){
    $.get(appPath+'html/web/hallComment/ExhibitionHall/'+hallId+'/'+pageIndex,{},function(result){
        if(result.success){
            var tmpl = document.getElementById('commentTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#commentDiv').html(doTtmpl(result));
            $("#pagination").pagination({
                items: result.total,
                itemsOnPage: 10,
                cssStyle: 'light-theme',
                currentPage:result.pageIndex,
                onPageClick: function (pageNumber, event) {
                    getComment(pageNumber);
                }
            });
        }
    });
}

$(function(){
    getComment(1);
    $.post(appPath+'html/web/hallPs/p/'+hallId);
});