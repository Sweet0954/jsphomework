<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <jsp:include page="common/header.jsp"/>

    <style>
        span {
            font-size: 20px;
            text-align: center;
            color: red;
        }
        a {
            font-size: 20px;
            color: #00F7DE;
        }
    </style>
</head>
<body class="login-bg">
<div class="login">
    <span style="align-content: center">${requestScope.msg}</span>
    <div class="message">宇哥的系统注册</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form" action="book/user/regist">
        <input name="username" placeholder="用户名" type="text" lay-verify="required" value="${user.username}">
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码" type="password">
        <hr class="hr15">
        <input name="rePassword" lay-verify="required" placeholder="确认密码" type="password">
        <hr class="hr15">
        <input name="email" placeholder="邮箱" type="text" lay-verify="required">
        <hr class="hr15">
        <input value="注册" lay-submit lay-filter="login" style="width:100%;" type="submit">
    </form>
    <a href="book/forget">忘记密码</a>
    <a style="float: right" href="book/index">登录</a>
</div>
</body>
</html>
