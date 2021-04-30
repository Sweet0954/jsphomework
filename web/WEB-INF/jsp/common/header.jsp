<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--写永远固定相对路径跳转的结果-->
<%
    String basePath = request.getScheme()
            + "://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";
%>
<%--<%=basePath%>--%>
<%--<base href="http://localhost:8080/homework3/">--%>
<base href="<%=basePath%>">
<link rel="shortcut icon" href="static/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="static/css/font.css">
<link rel="stylesheet" href="static/css/xadmin.css">
<!-- 引入 layui.css -->
<link rel="stylesheet" href="//unpkg.com/layui@2.6.5/dist/css/layui.css">
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="static/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

