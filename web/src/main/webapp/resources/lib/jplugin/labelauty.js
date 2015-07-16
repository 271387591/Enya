(function($){

    var methods = {
        init:function(options){
            var o = $.extend({
                mode:'SINGLE'//MULTI
            }, options || {});
            var self = this;
            methods.rdochecked(self);
            if (o.mode == "SINGLE") {
                //单选
                this.find(".rdobox").click(function () {
                    $(this).prev().prop("checked", "checked");
                    methods.rdochecked(self);
                });
            } else {
                //多选
                this.find(".chkbox").click(function () {
                    //
                    if ($(this).prev().prop("checked") == true) {
                        $(this).prev().removeAttr("checked");
                    }
                    else {
                        $(this).prev().prop("checked", "checked");
                    }
                    methods.rdochecked(self);
                });
            }

        },
        rdochecked:function(self){
            self.find('input').each(function (i) {
                var rdobox = self.find('input').eq(i).next();
                if (self.find('input').eq(i).prop("checked") == false) {
                    rdobox.removeClass("checked");
                    rdobox.addClass("unchecked");
                    rdobox.find(".check-image").removeClass("check-image-check-back");
                    rdobox.find(".check-image").addClass("check-image-uncheck-back");
                }
                else {
                    rdobox.removeClass("unchecked");
                    rdobox.addClass("checked");
                    rdobox.find(".check-image").addClass("check-image-check-back");
                    rdobox.find(".check-image").removeClass("check-image-uncheck-back");
                }
            });

        }
    };

    $.fn.labelauty = function(method) {
        if (methods[method] && method.charAt(0) != '_') {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' +  method + ' does not exist on jQuery.pagination');
        }

    };

})(jQuery);



//(function ($) {
//    $.fn.labelauty = function (tag, tag2) {
//
//        //判断是否选中
//        rdochecked(tag);
//
//        //单选or多选
//        if (tag2 == "rdo") {
//            //单选
//            $(tag).find(".rdobox").click(function () {
//                $(this).prev().prop("checked", "checked");
//                rdochecked(tag);
//            });
//        } else {
//            //多选
//            $(".chkbox").click(function () {
//                //
//                if ($(this).prev().prop("checked") == true) {
//                    $(this).prev().removeAttr("checked");
//                }
//                else {
//                    $(this).prev().prop("checked", "checked");
//                }
//                rdochecked(tag);
//            });
//        }
//
//        //判断是否选中
//        function rdochecked(tag) {
//            $(tag).find('input').each(function (i) {
//                var rdobox = $(tag).find('input').eq(i).next();
//                if ($(tag).find('input').eq(i).prop("checked") == false) {
//                    rdobox.removeClass("checked");
//                    rdobox.addClass("unchecked");
//                    rdobox.find(".check-image").removeClass("check-image-check-back");
//                    rdobox.find(".check-image").addClass("check-image-uncheck-back");
//                }
//                else {
//                    rdobox.removeClass("unchecked");
//                    rdobox.addClass("checked");
//                    rdobox.find(".check-image").addClass("check-image-check-back");
//                    rdobox.find(".check-image").removeClass("check-image-uncheck-back");
//                }
//            });
//        }
//    }
//}(jQuery));