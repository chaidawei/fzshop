<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta charset="utf-8">
    <title>搜索结果</title>
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/ectouch.css">
    <script type="text/javascript">var tpl = '/mobile/b2c/themes/default';</script>
</head>

<body style="max-width:640px;" class>
<div id="loading" style="display: none;"><img src="/mobile/b2c/themes/default/statics/img/loading.gif"></div>
<style>
    a.a-sequence {
        width: 3.5rem;
        height: 0rem;
        line-height: 3rem;
        margin-left: 0.5rem;
    }

    a.s-filter {
        line-height: 3rem;
        padding-left: 0rem;
    }
</style>
<div class="con">
    <div class="category">
        <section class="search">
            <div class="text-all dis-box j-text-all text-all-back">
                <a class="a-icon-back j-close-search" href="javascript:history.go(-1)"><i class="iconfont icon-jiantou is-left-font"></i></a>
                <div class="box-flex input-text n-input-text i-search-input">
                    <i class="iconfont icon-sousuo"></i>
                    <a href="/mobile/home/search.html">
                        <input class="j-input-text" type="text" placeholder="请输入您搜索的关键词!"></a>
                    <i class="iconfont icon-guanbi1 is-null j-is-null"></i>
                </div>
                <a class="a-sequence j-a-sequence"><i class="iconfont icon-pailie" data="1"></i></a>
            </div>
        </section>
        <section class="product-sequence dis-box">
            <a class="box-flex active" id="defaultSearch">默认</a>
            <a class="select-list box-flex">销量<i class="iconfont icon-xiajiantou"></i></a>
            <a class="select-list box-flex">人气<i class="iconfont icon-xiajiantou"></i></a>
            <a class="select-list box-flex">价格<i class="iconfont icon-xiajiantou"></i></a>
            <a href="#j-filter-div" class="box-flex s-filter j-s-filter">筛选</a>
        </section>
        <section class="product-list j-product-list product-list-medium" data="1">
            <ul id="j-product-box">
                <%--<script id="j-product" type="text/html">
                    {{each list as vo i}}
                    <li>
                        <div class="product-div">
                            <a class="product-div-link" href="{{vo.url}}"></a>
                            <img class="product-list-img" src="{{vo.goods_thumb}}"/>
                            <div class="product-text">
                                <h4>{{vo.goods_name}}</h4>
                                <p class="dis-box p-t-remark"><span class="box-flex">库存：{{vo.goods_number}}</span><!--<span class="box-flex">销量：{{vo.sales_count}}</span>--></p>
                                <p><span class="p-price t-first ">{{vo.shop_price}}<small><del>{{vo.market_price}}</del></small></span></p>
                                <a href="javascript:addCart({{vo.goods_id}})" class="icon-flow-cart fr j-goods-attr"><i class="iconfont icon-gouwuche"></i></a>
                            </div>
                        </div>
                    </li>
                    {{/each}}
                </script>--%>
                <c:forEach items="${goods}" var="g">
                    <li>
                        <div class="product-div">
                            <a class="product-div-link" href="/mobile/home/goodsdetails/${g.get("id")}.html"></a>
                            <img class="product-list-img" src="/upload/goods/${g.get("logo")}">
                            <div class="product-text">
                                <h4>${g.get("name")}</h4>
                                <p class="dis-box p-t-remark"><span class="box-flex">库存：${g.get("stock")}</span><!--<span class="box-flex">销量：0</span>--></p>
                                <p><span class="p-price t-first ">￥${g.get("price")}元<small><del>￥${g.get("oprice")}元</del></small></span></p>
                                <a href="javascript:addToCart(${g.get("id")})" class="icon-flow-cart fr j-goods-attr"><i class="iconfont icon-gouwuche"></i></a>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </section>
        <div style="font-size: 14px;color: grey;text-align: center">
            <p>正在加载...</p>
        </div>
    </div>
</div>
<script src="/mobile/js/jquery-weui.js"></script>

<script>
    var loading = false;
    $(document.body).infinite().on("infinite", function () {
        if (loading) return;
        loading = true;
        setTimeout(function () {
            var star=$("#j-product-box > li").length;
            var id="${id}";
            var key="${key}";
            $.ajax({
                type: "get",
                url: "/mobile/home/searchResMore.do",
                cache: false,
                data: {star:star,id:id,key:key},
                dataType: "text",
                success: function (data) {
                    $("#j-product-box").append(data);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                }
            });
            loading = false;
        }, 200);
    });
</script>
<div class="filter-top" id="scrollUp">
    <i class="iconfont icon-dingbu"></i>
</div>

<div id="j-filter-div" class="j-filter-div filter-div ts-5 c-filter-div">
    <div class="mask-filter-div"></div>
    <section class="close-filter-div j-close-filter-div">
        <div class="close-f-btn">
            <i class="iconfont icon-fanhui"></i>
            <span>关闭</span>
        </div>
    </section>
    <section class="con-filter-div">
        <form class="hold-height" method="post" id="form" action="">
            <input type="hidden" name="id" class="cat" value="0">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="price-range padding-all m-top08">
                        <label>价格</label>
                        <div class="price-slider">
                            <div id="slider-range" class="slider ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                                <div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 0%; width: 0%;"></div>
                                <a class="ui-slider-handle ui-state-default ui-corner-all" href="" style="left: 0%;"></a>
                                <a class="ui-slider-handle ui-state-default ui-corner-all" href="" style="left: 0%;"></a></div>
                            <div class="slider-info">
                                <span id="slider-range-amount">0 ~ 0</span>
                            </div>
                        </div>
                        <input type="hidden" id="min" name="price_min" value="0">
                        <input type="hidden" id="max" name="price_max" value="0">
                    </div>
                    <div class="select-two">
                        <a class="select-title padding-all j-menu-select">
                            <label class="fl">品牌</label>
                            <span class="fr t-jiantou j-t-jiantou jian001" id="j-t-jiantou">
                                <em class="fl">全部</em><i class="iconfont icon-jiantou tf-180 ts-2"></i>
                            </span>
                        </a>
                        <ul class="j-sub-menu padding-all j-get-one" data-istrue="true" style="display: none;">
                            <li class="ect-select" data-attr="0">
                                <label class="ts-1">全部<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="12">
                                <label class="ts-1">nb<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="13">
                                <label class="ts-1">Apple<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="14">
                                <label class="ts-1">nike<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="15">
                                <label class="ts-1">ca<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="16">
                                <label class="ts-1">Prada<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="17">
                                <label class="ts-1">华为荣耀<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="22">
                                <label class="ts-1">Jack w<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="27">
                                <label class="ts-1">Jack J<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="30">
                                <label class="ts-1">Gucci<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="31">
                                <label class="ts-1">魅族<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="32">
                                <label class="ts-1">Only<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="34">
                                <label class="ts-1">Bally<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <li class="ect-select" data-attr="35">
                                <label class="ts-1">ECCO<i class="fr iconfont icon-gou ts-1"></i></label>
                            </li>
                            <input type="hidden" name="brand" value="0">
                        </ul>
                        <input type="hidden" id="filter_attr" name="filter_attr" value="0">
                    </div>
                    <div class="ect-button-more dis-box padding-all">
                        <a class="box-flex btn-reset j-filter-reset" onclick="javascript:clear_filter();">清空选项</a>
                        <button type="submit" class="box-flex btn-submit">确定</button>
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>

<script type="text/javascript">
    function clear_filter() {
        $(".touchweb-com_listType .range").text("全部");
        $(".touchweb-com_listType input").each(function () {
            if ($(this).attr('class') != 'cat') {
                $(this).val("");
            }
        });
        $(".ui-slider-handle").css("left", "0");
        $(".ui-slider-range").css({left: 0, width: 0});
        $("#slider-range-amount").html(0);
        $("#min ,#max").val(0);
        $('input[name="brand"]').val(0);
        $("#filter_attr").val(0);
    }
</script>
<div class="div-messages"></div>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/swiper.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/ectouch.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.json.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery-ui-1.10.1.custom.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.scrollUp.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/common.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/echo.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/template.js"></script>
<script type="text/javascript">
    $('#hide-div').delay(1500).hide(0);
    var sliders = function () {
        // 筛选价格区间 js
        $("#slider-range").slider({
            range: true,
            min: 0,
            max: 1000,
            step: 100,
            values: [0, 300],
            slide: function (event, ui) {
                $("#slider-range-amount").text(ui.values[0] + " ~ " + ui.values[1]);
                $('input[name=price_min]').val(ui.values[0]);
                $('input[name=price_max]').val(ui.values[1]);
            }
        });
        var price_min = $('input[name=price_min]').val();
        var price_max = $('input[name=price_max]').val();
        $("#slider-range").slider({values: [price_min, price_max]});
        $("#slider-range-amount").text(price_min + " ~ " + price_max);
    }();

    var url = '';
    var total = 0;
    var page = localData.get('cat_0_page');
    page = (page === null) ? 1 : parseInt(page);
    // first request
    get_data(page);
    localData.set('cat_0_page', page);
    if (page == 1) {
        localData.set('cat_0_page_min', 1);
        localData.set('cat_0_page_max', 1);
    }
    if (page > 1) {
        localData.set('cat_0_page_min', page);
        localData.set('cat_0_page_max', page);
    }
    var minPage = localData.get('cat_0_page_max');
    var maxPage = localData.get('cat_0_page_max');
    minPage = (minPage === null) ? 1 : parseInt(minPage);
    maxPage = (maxPage === null) ? 1 : parseInt(maxPage);

    $(window).scroll(function () {
        var scrollTop = $(this).scrollTop();
        var scrollHeight = $(document).height();
        var windowHeight = $(this).height();
        // 下拉
        if (scrollTop + windowHeight == scrollHeight) {
            if (page >= maxPage) {
                $.ajax({
                    type: "post",
                    url: url,
                    data: 'page=' + (page + 1),
                    dataType: 'json',
                    async: false,
                    success: function (data) {
                        var html = template('j-product', data);
                        $('#j-product-box').append(html);
                        //rug
                        if (!isEmpty(data.list)) {
                            page++;
                            localData.set('cat_0_page', page);
                            if (page > maxPage) {
                                localData.set('cat_0_page_max', page);
                            }
                        }
                    }
                });
            }
        }
        // 上拉
        if (scrollTop == 0 && minPage > 1) {
            $.ajax({
                type: "post",
                url: url,
                data: 'page=' + (page - 1),
                dataType: 'json',
                async: false,
                success: function (data) {
                    var html = template('j-product', data);
                    $('#j-product-box').prepend(html);
                    page--;
                    localData.set('cat_0_page', page);
                    if (page < minPage) {
                        localData.set('cat_0_page_min', page);
                    }
                }
            });
        }
    });

    function get_data(page) {
        $.ajax({
            type: "post",
            url: url,
            data: 'page=' + page,
            dataType: 'json',
            async: false,
            success: function (data) {
                var html = template('j-product', data);
                $('#j-product-box').append(html);
            }
        });
    }

    /*
     * 检测对象是否是空对象(不包含任何可读属性)。
     * 方法既检测对象本身的属性，也检测从原型继承的属性(因此没有使hasOwnProperty)。
     */
    function isEmpty(obj) {
        for (var name in obj) {
            return false;
        }
        return true;
    }
    echo.init();
    $(function () {
        $('.ect-select').click(function () {
            var data = $(this).attr('data-attr');
            $(this).siblings('input[type="hidden"]').val(data);
        })
    })
    //属性
    $(function () {
        $('.j-sub-menu-attr li').click(function () {
            $(this).addClass('active').siblings('li').removeClass('active');
            var i = 0;
            var new_attr = new Array();
            $(".j-sub-menu-attr li").each(function () {
                if ($(this).hasClass('active')) {
                    new_attr[i] = $(this).find('label').attr('value');
                    i = i + 1;
                }
            });
            var new_attr_str = new_attr.join('.');
            //属性参数具体值
            $('input[name=filter_attr]').val(new_attr_str);
        })
    })
</script>

<script>
    $(function () {
        $("#defaultSearch").click(function () {
            $(this).addClass("active");
            $(".select-list").removeClass("active a-change");
        });
        $(".select-list").click(function () {
            $("#defaultSearch").removeClass("active");
            var a = $(".select-list").index(this);
            if ($(this).hasClass("active")) {
                if (!$(this).hasClass("a-change")) {
                    $(this).addClass("a-change");
                } else {
                    $(this).removeClass("a-change");
                }
            } else {
                $(this).addClass("active");
                $(".select-list").not(":eq(" + a + ")").removeClass("active a-change");
            }
        })
    })
</script>
</body>
</html>