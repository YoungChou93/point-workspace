<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- 针对移动设备，为了确保适当的绘制和触屏缩放 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.2.1.min.js"></script>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/res/css/style.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <title>注册</title>
    <style type="text/css">
        html, body {
            font-size: 100%;
            width: 100%;
            height:100%;
        }

        body {
            font-size: 100%;
        }

        .banner {
            background: url(${pageContext.request.contextPath}/res/img/registerbackground.jpg) fixed center center no-repeat;
            background-size: cover;
            width: 100%;
            height:100%;
        }

        .banner-top {
            width: 30%;
            padding: 2em 30px;
            background: rgba(228, 232, 246, 0.56);
            margin: 0 auto;
            min-width: 250px;
        }

        .bnr-left {
            width: 60%;
            float: left;
        }

        .bnr-right {
            width: 40%;
            float: right;
        }

        .welcome {
            padding: 30px 0 0 0;
        }

        .welcome h1 {
            color: #FFF;
            font-size: 4.0em;
            margin-bottom: 2%;
            font-weight: 100;
            text-align: center;
            line-height: 1.5em;
            text-transform: uppercase;
        }

        .error {
            font-family: 微软雅黑;
            font-size: 15px;
            color: red;
        }
    </style>
</head>
<body>
<div class="banner">
    <div class="container">
        <div class="welcome">
            <h1>WElCOME TO CHINA CITYSCAPE</h1>
        </div>
        <div class="banner-top text-center">
            <img src="${pageContext.request.contextPath}/res/img/logo.png"
                 style="height: 90px; text-align: center;"/>
            <div id="register">
                <font color="red">${errorMsg}</font>
                <form class="form-horizontal" method="post" style="margin: 20px;" id="registerfrom"
                      action="${pageContext.request.contextPath}/user/register.action">
                    <div class="form-group">
                        <input type="text" class="form-control" name="email"
                               id="inputEmail" placeholder="Email" value="${registerUserCustom.email}">
                        <label id="emailError" class="error"></label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="nickname"
                               id="inputNickname" placeholder="Nickname" value="${registerUserCustom.nickname}">
                        <label id="nicknameError" class="error"></label>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="password"
                               id="inputPassword" placeholder="Password">
                        <label id="passwordError" class="error"></label>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control"
                               id="inputConfirmPassword" name="confirmPassword" placeholder="Confirm Password">
                        <label id="confirmPasswordError" class="error"></label>
                    </div>
                    <div class="form-group">
                        <div class="bnr-left">
                            <img
                                    src="${pageContext.request.contextPath}/getVerifyCode.action"
                                    id="registerVerifyCode"/> <a
                                href="javascript:changeRegisterVerifyCode()">换张图</a>
                        </div>
                        <div class="bnr-right">
                            <input type="text" class="form-control" name="verifyCode"
                                   id="inputVerifyCode" placeholder="VerifyCode">
                        </div>
                        <label id="verifyCodeError" class="error"></label>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">注册</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {

        $("#emailError").css("display", "none");
        $("#passwordError").css("display", "none");
        $("#verifyCodeError").css("display", "none");
        /*
         * 2. 给注册按钮添加submit()事件，完成表单校验
         */
        $("#registerfrom").submit(function () {
            $("#msg").text("");
            var bool = true;
            if (!validateEmail()) {
                bool = false;
            }

            if (!validateNickname()) {
                bool = false;
            }

            if (!validatePassword()) {
                bool = false;
            }

            if (!validateConfirmPassword()) {
                bool = false;
            }

            if (!validateVerifyCode()) {
                bool = false;
            }

            var newPassword = $("#inputPassword").val();
            var confirmPassword = $("#inputConfirmPassword").val();
            if (confirmPassword != newPassword) {
                $("#confirmPasswordError").css("display", "");
                $("#confirmPasswordError").text("两次密码输入不一致");
                bool = false;
            }

            return bool;
        });

        /*
         * 输入框得到焦点时隐藏错误信息
         */
        $("#inputEmail").focus(function () {
            $("#emailError").css("display", "none");
        });

        $("#nicknameEmail").focus(function () {
            $("#nicknameError").css("display", "none");
        });

        $("#inputPassword").focus(function () {
            $("#passwordError").css("display", "none");
        });

        $("#inputConfirmPassword").focus(function () {
            $("#confirmPasswordError").css("display", "none");
        });

        $("#inputVerifyCode").focus(function () {
            $("#verifyCodeError").css("display", "none");
        });
        /*
         *  输入框推动焦点时进行校验
         */
        $("#inputEmail").blur(function () {
            var inputName = $(this).attr("name");
            invokeValidateFunction(inputName);
        })

        $("#inputNickname").blur(function () {
            var inputName = $(this).attr("name");
            invokeValidateFunction(inputName);
        })

        $("#inputPassword").blur(function () {
            var inputName = $(this).attr("name");
            invokeValidateFunction(inputName);
        })

        $("#inputConfirmPassword").blur(function () {
            var inputName = $(this).attr("name");
            invokeValidateFunction(inputName);
        })

        $("#inputVerifyCode").blur(function () {
            var inputName = $(this).attr("name");
            invokeValidateFunction(inputName);
        })
    });

    /*
     * 输入input名称，调用对应的validate方法。
     * 例如input名称为：loginname，那么调用validateLoginname()方法。
     */
    function invokeValidateFunction(inputName) {
        inputName = inputName.substring(0, 1).toUpperCase() + inputName.substring(1);
        var functionName = "validate" + inputName;
        return eval(functionName + "()");
    }

    /*
     * 校验登录名
     */
    function validateEmail() {
        var bool = true;
        $("#emailError").css("display", "none");
        var value = $("#inputEmail").val();
        if (!value) {// 非空校验
            $("#emailError").css("display", "");
            $("#emailError").text("邮箱不能为空！");
            bool = false;
        } else if (value.length < 10 || value.length > 40) {//长度校验
            $("#emailError").css("display", "");
            $("#emailError").text("邮箱长度在10 ~ 40之间！");
            bool = false;
        } else if (!value.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {
            $("#emailError").css("display", "");
            $("#emailError").text("邮箱格式错误");
            bool = false;
        }
        return bool;
    }

    function validateNickname() {
        var bool = true;
        $("#nicknameError").css("display", "none");
        var value = $("#inputNickname").val();
        if (!value) {// 非空校验
            $("#nicknameError").css("display", "");
            $("#nicknameError").text("昵称不能为空！");
            bool = false;
        } else if (value.length < 3 || value.length > 16) {//长度校验
            $("#nicknameError").css("display", "");
            $("#nicknameError").text("昵称长度在3 ~ 16之间！");
            bool = false;
        }
        return bool;
    }

    /*
     * 校验密码
     */
    function validatePassword() {
        var bool = true;
        $("#passwordError").css("display", "none");
        var value = $("#inputPassword").val();
        if (!value) {// 非空校验
            $("#passwordError").css("display", "");
            $("#passwordError").text("密码不能为空！");
            bool = false;
        } else if (value.length < 5 || value.length > 15) {//长度校验
            $("#passwordError").css("display", "");
            $("#passwordError").text("密码长度错误！");
            bool = false;
        }
        return bool;
    }

    function validateConfirmPassword() {
        var bool = true;
        $("#confirmPasswordError").css("display", "none");
        var value = $("#inputConfirmPassword").val();
        if (!value) {// 非空校验
            $("#confirmPasswordError").css("display", "");
            $("#confirmPasswordError").text("确认密码不能为空！");
            bool = false;
        } else if (value.length < 5 || value.length > 15) {//长度校验
            $("#confirmPasswordError").css("display", "");
            $("#confirmPasswordError").text("确认密码长度错误！");
            bool = false;
        }
        return bool;
    }

    /*
     * 校验验证码
     */
    function validateVerifyCode() {
        var bool = true;
        $("#verifyCodeError").css("display", "none");
        var value = $("#inputVerifyCode").val();
        if (!value) {//非空校验
            $("#verifyCodeError").css("display", "");
            $("#verifyCodeError").text("验证码不能为空！");
            bool = false;
        } else if (value.length != 4) {//长度不为4就是错误的
            $("#verifyCodeError").css("display", "");
            $("#verifyCodeError").text("验证码长度错误！");
            bool = false;
        }
        return bool;
    }

    /*
     * 换一张验证码
     */
    function changeLoginVerifyCode() {
        /*
         * 1. 获取<img>元素
         * 2. 重新设置它的src
         * 3. 使用毫秒来添加参数
         */
        $("#loginVerifyCode").attr(
            "src",
            "${pageContext.request.contextPath}/getVerifyCode.action?a="
            + new Date().getTime());

    }

    function changeRegisterVerifyCode() {
        /*
         * 1. 获取<img>元素
         * 2. 重新设置它的src
         * 3. 使用毫秒来添加参数
         */
        $("#registerVerifyCode").attr(
            "src",
            "${pageContext.request.contextPath}/getVerifyCode.action?a="
            + new Date().getTime());

    }

    <c:if test="${!empty registerUserCustom}">
    $('#myTab a:last').tab('show');
    </c:if>

</script>
</body>
</html>