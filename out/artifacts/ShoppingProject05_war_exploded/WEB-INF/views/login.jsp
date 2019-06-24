<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE>
<!-- saved from url=(0051)http://demo1.mycodes.net/denglu/HTML5_yonghudenglu/ -->
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>HTML5响应式用户登录界面模板</title>
    <meta name="description"
          content="particles.js is a lightweight JavaScript library for creating particles.">
    <meta name="author" content="Vincent Garreau">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" media="screen" href="./resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="./resources/css/reset.css">
<body>

<div id="particles-js">
    <div class="login" style="display: block;">
        <div class="login-top">登录</div>
        <div class="login-center clearfix">
            <div class="login-center-img">
                <img src="./resources/images/name.png">
            </div>
            <div class="login-center-input">
                <input type="text" name="userName" id="username" value=""
                       placeholder="请输入您的用户名" onfocus="this.placeholder=&#39;&#39;"
                       onblur="this.placeholder=&#39;请输入您的用户名&#39;">
                <div class="login-center-input-text">用户名</div>
            </div>
        </div>
        <div class="login-center clearfix">
            <div class="login-center-img">
                <img src="./resources/images/password.png">
            </div>
            <div class="login-center-input">
                <input type="password" name="password" id="password" value=""
                       placeholder="请输入您的密码" onfocus="this.placeholder=&#39;&#39;"
                       onblur="this.placeholder=&#39;请输入您的密码&#39;">
                <div class="login-center-input-text">密码</div>
            </div>
        </div>

        <div class="login-center clearfix">
            <div class="login-center-img">
                <img src="./resources/images/password.png">
            </div>
            <div class="login-center-input">
                <input style="width: 50%" type="text" name="cpacha" id="cpacha"
                       value="" placeholder="请输入验证码"
                       onfocus="this.placeholder=&#39;&#39;"
                       onblur="this.placeholder=&#39;请输入您的验证码&#39;">
                <div class="login-center-input-text">验证码</div>
                <img title="点击切换验证码" id="cpacha_img" class="cpacha_img" onclick="change()"
                     src="get_capcha?vcode=4&w=140&h=50&type=loginCpache"
                     style="width: 45%; height: 30px;">
            </div>

        </div>

        <div class="login-button">登录</div>
    </div>
    <div class="sk-rotating-plane"></div>
    <canvas class="particles-js-canvas-el" width="1147" height="952"
            style="width: 100%; height: 100%;"></canvas>
</div>

<!-- scripts -->
<script src="./resources/js/particles.min.js"></script>
<script src="./resources/js/app.js"></script>
<script src="./resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
    function hasClass(elem, cls) {
        cls = cls || '';
        if (cls.replace(/\s/g, '').length == 0) return false; //当cls没有参数时，返回false
        return new RegExp(' ' + cls + ' ').test(' ' + elem.className + ' ');
    }

    function addClass(ele, cls) {
        if (!hasClass(ele, cls)) {
            ele.className = ele.className == '' ? cls : ele.className + ' ' + cls;
        }
    }

    function removeClass(ele, cls) {
        if (hasClass(ele, cls)) {
            var newClass = ' ' + ele.className.replace(/[\t\r\n]/g, '') + ' ';
            while (newClass.indexOf(' ' + cls + ' ') >= 0) {
                newClass = newClass.replace(' ' + cls + ' ', ' ');
            }
            ele.className = newClass.replace(/^\s+|\s+$/g, '');
        }
    }

    document.querySelector(".login-button").onclick = function () {
        //前端页面的表单验证

        var username = $("#username").val();
        var password = $("#password").val();
        var cpacha = $("#cpacha").val();

        if (username == "" || username == "undefined") {
            alert("请输入用户名");
            return;
        }

        if (password == "" || password == "undefined") {
            alert("请输入密码");
            return;
        }

        if (cpacha == "" || cpacha == "undefined") {
            alert("请输入验证码");
            return;
        }

        addClass(document.querySelector(".login"), "active")
        addClass(document.querySelector(".sk-rotating-plane"), "active")
        document.querySelector(".login").style.display = "none"

        //发送Ajax请求
        $.ajax({
            url: "toLoginAction",
            data: {userName: username, password: password, cpacha: cpacha},
            dataType: "json",
            type: "post",
            success: function (obj) {
                if (obj.type == "success") {
                    //如果成功就跳转到主要
                    window.location = "index";
                } else {
                    removeClass(document.querySelector(".login"), "active")
                    removeClass(document.querySelector(".sk-rotating-plane"), "active")
                    document.querySelector(".login").style.display = "block";
                    alert(obj.msg);
                    change();
                }
            }
        });

    }

    //点击图片验证码图片可以切换验证码
    function change() {
        //获取图片的元素
        $("#cpacha_img").attr("src", "get_capcha?vcode=4&w=140&h=50&type=loginCpache&time=" + new Date().getTime());

    }


</script>

</body>
</html>