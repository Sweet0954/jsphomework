<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>修改购物车页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <jsp:include page="common/header.jsp"/>
</head>

<body>
<div class="x-body">
    <form class="layui-form" action="cart/update">
        <input type="hidden" name="id" value="${cartItem.id}">
        <span class="x-red" style="color: red">${msg}</span>
        <div class="layui-form-item">
            <label for="name" class="layui-form-label">
                <span class="x-red"></span>商品名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required="" lay-verify="required" value="${cartItem.name}"
                       autocomplete="off" disabled readonly class="layui-input layui-disabled" style="background: #1E9FFF">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="count" class="layui-form-label">
                <span class="x-red"></span>数量
            </label>
            <div class="layui-input-inline">
                <input type="text" id="count" name="count"
                       autocomplete="off" class="layui-input" value="${cartItem.count}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="price" class="layui-form-label">
                <span class="x-red"> </span>单价
            </label>
            <div class="layui-input-inline">
                <input type="text" id="price" name="price"
                       autocomplete="off" disabled readonly class="layui-input layui-disabled" value="${cartItem.price}" style="background: #1E9FFF">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="totalPrice" class="layui-form-label">
                <span class="x-red"> </span>金额
            </label>
            <div class="layui-input-inline">
                <input type="text" id="totalPrice" name="totalPrice" required=""
                       autocomplete="off" isabled readonly class="layui-input layui-disabled" value="${cartItem.totalPrice}" style="background: #1E9FFF">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="totalPrice" class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="add" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>
</body>

</html>