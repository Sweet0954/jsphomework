<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>购物车页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <jsp:include page="common/header.jsp"/>
    <script type="text/javascript">
        $(function () {
            $(".deleteItem").click(function () {
                return confirm("你确定要删除【"+ $(this).parent().parent().find("td:first").text() +"】?");
            });
           /* $(".allCheckBox").click(function () {
                var check = $(".allCheckBox").prop('checked');
                if (check == true) {
                    location.href = "cart/totalPrice";
                    $(".allCheckBox").prop("checked",true);
                    $(".itemCheckBox").prop("checked",true);
                } else {
                    $(".itemCheckBox").prop("checked",false);
                }
            });
            $(".itemCheckBox").click(function () {
                var id = $(".itemId").val();
                alert(id);
            });*/
        });
    </script>
</head>

<body>
<div class="x-nav">
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="book/cart" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="x_admin_show('订单详情','cart/addOrder/${sessionScope.user.id}',600,400)"><i class="layui-icon">&#xe65e;</i>${totalPrice!=0?totalPrice:""}清空购物车</button>
        <span class="x-right" style="line-height:40px">共有数据：${sessionScope.cart.items.size()} 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <%--<c:if test="${not empty sessionScope.cart.items}">
                <th>
                    <input type="checkbox" name="" lay-skin="primary" class="allCheckBox">
                </th>
            </c:if>--%>
            <th>商品名称</th>
            <th>数量</th>
            <th>单价</th>
            <th>金额</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:if test="${empty sessionScope.cart.items}">
            <%--如果购物车空的情况--%>
            <tr>
                <td colspan="5"><a href="book/page/1">亲，当前购物车为空！快跟小伙伴们去浏览商品吧！！！</a></td>
            </tr>
        </c:if>
        <c:if test="${not empty sessionScope.cart.items}">
            <c:forEach items="${cart.items}" var="entry">
                <tr>
                    <%--<input type="hidden" class="itemId" value="${entry.key}">--%>
                    <%--<td>
                        <input type="checkbox" name="" lay-skin="primary" class="itemCheckBox">
                    </td>--%>
                    <td>${entry.value.name}</td>
                    <td>${entry.value.count}</td>
                    <td>${entry.value.price}</td>
                    <td>${entry.value.totalPrice}</td>
                    <td class="td-manage">
                        <a title="编辑"  onclick="x_admin_show('编辑','cart/updateCart?id=${entry.key}')" href="javascript:;">
                            <i class="layui-icon">&#xe642;</i>
                        </a>
                        <a title="删除" class="deleteItem" href="cart/delete?id=${entry.key}">
                            <i class="layui-icon">&#xe640;</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>

</div>
</body>

</html>