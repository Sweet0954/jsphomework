<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>店铺首页</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <jsp:include page="common/header.jsp"/>
        <style>
            .b_list {
                color: #007DDB;
            }
            a {
                text-decoration: none;
                color: black;
                font-size: 13px;
            }
        </style>
    </head>
    <body>
    <div id="main">
        <div id="book">
            <div class="book_cond">
                <form action="book/page/1" method="get">
                    价格：<input id="min" type="text" name="min" value="${min}" placeholder="$"> 元 -
                    <input id="max" type="text" name="max" value="${max}" placeholder="$"> 元
                    <input type="submit" value="查询" />
                </form>
            </div>
            <div style="text-align: center">
                <c:if test="${empty cart.items}">
                    <%--购物车为空的输出--%>
                    <span id="cartTotalCount"> </span>
                    <div>
                        <span style="color: red">当前购物车为空</span>
                    </div>
                </c:if>
                <c:if test="${not empty cart.items}">
                    <%--购物车非空的输出--%>
                    <span id="cartTotalCount">您的购物车中有${sessionScope.cart.totalCount}件商品</span>
                </c:if>
            </div>
            <c:forEach var="book" items="${bookList}">
                <div class="b_list">
                    <div class="img_div">
                        <img class="book_img" alt="" src="${book.imgPath}" />
                    </div>
                    <div class="book_info">
                        <div class="book_name">
                            <span class="sp1">书名:</span>
                            <span class="sp2">${book.name}</span>
                        </div>
                        <div class="book_author">
                            <span class="sp1">作者:</span>
                            <span class="sp2">${book.author}</span>
                        </div>
                        <div class="book_version">
                            <span class="sp1">版本:</span>
                            <span class="sp2">${book.version}</span>
                        </div>
                        <div class="book_price">
                            <span class="sp1">价格:</span>
                            <span class="sp2">${book.price}</span>
                        </div>
                        <div class="book_sales">
                            <span class="sp1">销量:</span>
                            <span class="sp2">${book.sales}</span>
                        </div>
                        <div class="book_add">
                            <button onclick="x_admin_show('购物车详情','cart/addItem?id= + ${book.id}')">加入购物车</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <jsp:include page="common/page_nav.jsp"/>

    </div>
    </body>
</html>