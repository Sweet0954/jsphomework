<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
    <jsp:include page="common/header.jsp"/>
    <script type="text/javascript">
        $(function () {
            $("a.deleteClass").click(function () {
                return confirm("你确定要删除【"+ $(this).parent().parent().find("td:first").text() +"】?");
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="x-nav">
        <%--<span class="layui-breadcrumb">
          <a href="">店铺首页</a>
          <a href="">演示</a>
          <a>
            <cite>导航元素88</cite></a>
        </span>--%>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="book/allBook?pageNumber=${pageNumber+1}" title="刷新">
            <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
        <xblock>
            <button class="layui-btn" onclick="x_admin_show('新增书籍','book/addBook',600,400)"><i class="layui-icon">添加书籍</i></button>
            <span class="x-right" style="line-height:40px">共有数据：${bookTotal} 条</span>
        </xblock>
        <table class="layui-table">
            <thead>
            <tr>
                <%--<th>
                    <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
                </th>--%>
                <th>书籍名称</th>
                <th>作者</th>
                <th>版本</th>
                <th>单价</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="book" items="${bookList}">
                <tr>
                    <%--<td>
                        <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                    </td>--%>
                    <td>${book.name}</td>
                    <td>${book.author}</td>
                    <td>${book.version}</td>
                    <td>${book.price}</td>
                    <td class="td-manage">
                        <a title="修改" onclick="x_admin_show('修改图书信息','book/updateBook?id=${book.id}',600,400)">
                            <i class="layui-icon">&#xe642;</i>
                        </a>
                        <a title="删除" class="deleteClass" href="book/deleteBook?pageNumber=${pageNumber}&id=${book.id}">
                            <i class="layui-icon">&#xe640;</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <%--分页页面--%>
    <jsp:include page="common/book_page_nav.jsp"/>
</div>
</body>
</html>
