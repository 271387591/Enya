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
            $.post(appPath+'html/web/exhPs/s/'+exhId);
        });
    }
};
function initMap(lng,lat){
    var map = new BMap.Map("mbguideMap");
    map.setCurrentCity("成都");
    var point = new BMap.Point(lng, lat);
    map.centerAndZoom(point, 11);
    var marker = new BMap.Marker(point);
    map.addOverlay(marker);
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});
    var top_left_navigation = new BMap.NavigationControl();
    var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL});
    map.addControl(top_left_control);
    map.addControl(top_left_navigation);
    map.addControl(top_right_navigation);
    map.panTo(point);
}



function getComment(pageIndex){
    $.get(appPath+'html/web/hallComment/Exhibition/'+exhId+'/'+pageIndex,{},function(result){
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
function getNews(pageIndex){
    $.get(appPath+'html/web/exhNews/'+exhId+'/'+pageIndex,{},function(result){
        if(result.success){
            var tmpl = document.getElementById('indexNewsTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#mbmbnewsContent').html(doTtmpl(result));
            $("#newsPagination").pagination({
                items: result.total,
                itemsOnPage: 10,
                cssStyle: 'light-theme',
                currentPage:result.pageIndex,
                onPageClick: function (pageNumber, event) {
                    getNews(pageNumber);
                }
            });
        }
    });
}
function getTrade(pageIndex){
    $.get(appPath+'html/web/exhTrade/'+exhId+'/'+pageIndex,{},function(result){
        if(result.success){
            var tmpl = document.getElementById('exhTradeTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#mbtradeContent').html(doTtmpl(result));
            $("#tradePagination").pagination({
                items: result.total,
                itemsOnPage: 10,
                cssStyle: 'light-theme',
                currentPage:result.pageIndex,
                onPageClick: function (pageNumber, event) {
                    getNews(pageNumber);
                }
            });
        }
    });
}

$(document).ready(function () {
    $.post(appPath+'html/web/exhPs/p/'+exhId);
    $(".mydllist dd").click(function () {
        var strid = $(this).attr("id");
        $(".mydllist dd").each(function () {
            $(this).removeClass("selected");
            $("#mb" + $(this).attr("id").substr(2)).css("display", "none");
        });
        $(this).addClass("selected");
        $("#mb" + strid.substr(2)).css("display", "block");
        if(strid=='mmdesctription'){
            $.get(appPath+'html/web/exhDes/'+exhId,{},function(result){
                $('#mbdesctriptionContent').html(result.data);
            });
        }else if(strid=='mmguide'){
            $.get(appPath+'html/web/exhGuide/'+exhId,{},function(result){
                $('#mbguideContent').html(result.data);
            });
        }else if(strid=='mmguideto'){
            $.get(appPath+'html/web/exhGuideTo/'+exhId,{},function(result){
                $('#mbguidetoContent').html(result.data);
            });
            initMap(lng,lat);

        }else if(strid=='mmnews'){
            getNews(1);
        }else if(strid=='mmtarvel'){
            $.get(appPath+'html/web/exhTravel/'+exhId,{},function(result){
                $('#mbtarvelContent').html(result.data);
            });
        }else if(strid=='mmsponsor'){
            $.get(appPath+'html/web/exhSponsor/'+exhId,{},function(result){
                $('#mbsponsorContent').html(result.data);
            });
        }else if(strid=='mmtrade'){
            getTrade(1);
        }
    });
});
