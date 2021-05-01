<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <jsp:include page="common/header.jsp"/>
</head>

<body>
<div class="x-nav">
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <xblock>
        <button class="layui-btn" onclick="x_admin_show('添加用户','./role-add.html')"><i class="layui-icon"></i>添加
        </button>
        <span class="x-right" style="line-height:40px">共有数据：${orderList.size()}}条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>订单编号</th>
            <th>创建时间</th>
            <th>总金额</th>
            <th>状态</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${orderList}" var="order">
        <tr>
            <td>${order.orderId}</td>
            <td>${order.createTime}</td>
            <td>${order.price}</td>
            <td class="td-status">
                <span class="layui-btn layui-btn-normal layui-btn-mini">已付款</span></td>
            <td class="td-manage">
                <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">
                    <i class="layui-icon">&#xe601;</i>
                </a>
                <a title="编辑"  onclick="x_admin_show('编辑','role-add.html')" href="javascript:;">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>

</html>
