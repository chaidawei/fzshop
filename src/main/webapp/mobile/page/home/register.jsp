<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta charset="utf-8">
    <title>用户注册</title>
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/ectouch.css">
    <script type="text/javascript">var tpl = '/mobile/b2c/themes/default';</script>
</head>

<body style="max-width:640px;" class="b-color-f">
<div id="loading" style="display: none;"><img src="/mobile/b2c/themes/default/statics/img/loading.gif"></div>


<header class="dis-box header-menu b-color color-whie"><a class="" href="javascript:history.go(-1)"><i class="iconfont icon-jiantou"></i></a>
    <h3 class="box-flex">注册</h3>
    <p><a href="index.jsp"><i class="iconfont icon-home"></i></a></p>
</header>
<div class="con padding-all">
    <div class="user-register">
        <div class="tab-content">
            <div class="tab-pane active">
                <form action="/mobile/home/register.do" method="post" name="formUser" class="validforms">
                    <input type="hidden" name="flag" id="flag" value="register">
                    <div class="ect-bg-colorf">
                        <ul class="register-list-box">
                            <li class="dis-box user-register-box">
                                <div class="box-flex reg-left-input"><input placeholder="请输入手机号" name="phone" type="text" id="username" datatype="s3-15" nullmsg="请输入手机号"></div>
                            </li>
                            <li class="dis-box user-register-box input-text item-password">
                                <input class="reg-left-input" type="password" name="password" placeholder="请输入密码" minlength="6" datatype="*" nullmsg="请输入密码(至少六位)">
                                <b class="tp-btn btn-off"></b>
                            </li>
                            <li class="dis-box user-register-box">
                                <div class="box-flex reg-left-input"><input placeholder="请输入昵称" name="username" type="text" datatype="s3-15" nullmsg="请输入昵称"></div>
                            </li>
                            <li class="dis-box user-register-box">
                                <input class="box-flex reg-left-input" type="text" name="email" placeholder="请输入电子邮箱" datatype="e" nullmsg="请输入电子邮箱">
                            </li>
                        </ul>
                    </div>
                    <p class="ect-checkbox ect-padding-tb ect-margin-tb ect-margin-bottom0">
                        <input id="agreement" name="agreement" type="checkbox" value="1" checked="checked">
                        <label for="agreement">我已看过并接受《<a href="#" style="color:blue" target="_blank">用户协议</a>》<i></i></label>
                    </p>
                    <div class="ect-padding-tb">
                        <button name="Submit" type="submit" class="btn-submit">注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.json.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/common.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/utils.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/validform.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/js/ectouch.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/js/simple-inheritance.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/js/jquery.scrollUp.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/ectouch.js"></script>
<script language="javascript">
    var handler = function(e) { //禁止浏览器默认行为
        e.preventDefault();
    };
</script>
<script>
    $('.btn-off').on('click', function() {
        if ($(this).hasClass('btn-on')) {
            $(this).removeClass('btn-on');
            $(this).prev().attr('type', 'password');
        } else {
            $(this).addClass('btn-on');
            $(this).prev().attr('type', 'text');
        }
    });
</script>
</body>
</html>
