var iBShare = {
    init: function() {
        var $shareBox = $(".bshare-custom");
        var tools = '<a title="分享到QQ空间" class="bshare-qzone"></a>';
        tools += '<a title="分享到新浪微博" class="bshare-sinaminiblog"></a>';
        tools += '<a title="分享到人人网" class="bshare-renren"></a>';
        tools += '<a title="分享到腾讯微博" class="bshare-qqmb"></a>';
        tools += '<a title="分享到网易微博" class="bshare-neteasemb"></a>';
        tools += '<a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>';
        $shareBox.append(tools);
        $shareBox.children("a").click(function() {
            var parents = $(this).parent();
            $.post(appPath+'html/web/newsPs/s/'+newsId);
        });
    }
};



function getComment(pageIndex){
    $.get(appPath+'html/web/hallComment/News/'+newsId+'/'+pageIndex,{},function(result){
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
$(document).ready(function () {
    $.post(appPath+'html/web/newsPs/p/'+newsId);
    getComment(1);

});
