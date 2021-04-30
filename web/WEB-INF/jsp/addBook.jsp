<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加书籍</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <jsp:include page="common/header.jsp"/>
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="x-body">
    <form class="layui-form" action="book/add" method="post">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h1>
                        <small>${msg}</small>
                    </h1>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="name" class="layui-form-label">
                <span class="x-red">*</span>书名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" required>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>必填项
            </div>
        </div>
        <div class="layui-form-item">
            <label for="author" class="layui-form-label">
                <span class="x-red">*</span>作者
            </label>
            <div class="layui-input-inline">
                <input type="text" id="author" name="author"
                       autocomplete="off" class="layui-input" required>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>必填项
            </div>
        </div>
        <div class="layui-form-item">
            <label for="version" class="layui-form-label">
                <span class="x-red">*</span>版本
            </label>
            <div class="layui-input-inline">
                <input type="text" id="version" name="version"
                       autocomplete="off" class="layui-input" required>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>必填项
            </div>
        </div>
        <div class="layui-form-item">
            <label for="price" class="layui-form-label">
                <span class="x-red">*</span>价格
            </label>
            <div class="layui-input-inline">
                <input type="text" id="price" name="price" required=""
                       autocomplete="off" class="layui-input" required>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>必填项
            </div>
        </div>
        <div class="layui-form-item">
            <label for="img_pagth" class="layui-form-label">
                <span class="x-red">*</span>图书封面地址
            </label>
            <div class="layui-input-inline">
                <input type="text" id="img_pagth" name="img_pagth"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="link" class="layui-form-label">
                <span class="x-red">*</span>百度网盘链接
            </label>
            <div class="layui-input-inline">
                <input type="text" id="link" name="link"
                       class="layui-input" required>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>必填项
            </div>
        </div>
        <div class="layui-form-item">
            <label for="extractioncode" class="layui-form-label">
                <span class="x-red">*</span>百度网盘提取码
            </label>
            <div class="layui-input-inline">
                <input type="text" id="extractioncode" name="extractioncode"
                       class="layui-input" required>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>必填项
            </div>
        </div>
        <div class="layui-form-item">
            <label for="extractioncode" class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="add" lay-submit="">
                添加
            </button>
        </div>
    </form>
</div>
</body>

</html>
