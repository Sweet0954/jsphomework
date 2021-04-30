<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--分页条的开始--%>
<div id="page_nav">
    <%--	大于首页,才显示	--%>
    <c:if test="${pageNumber > 1}">
        <a href="book/page/1?min=${requestScope.min}&max=${requestScope.max}">首页</a>
        <a href="book/page/${pageNumber - 1}?min=${requestScope.min}&max=${requestScope.max}">上一页</a>
    </c:if>

    <%--页码输出的开始--%>
    <c:choose>
        <%--情况1：如果总页码小于等于5的情况，页码的范围是：1-总页码--%>
        <c:when test="${bookPageTotal <= 5 }">
            <c:set var="begin" value="1"/>
            <c:set var="end" value="${bookPageTotal }"/>
        </c:when>
        <%--情况2：总页码大于5的情况。--%>
        <c:when test="${bookPageTotal > 5 }">
            <c:choose>
                <%--小情况1：当前页码为前面3个：1，2，3的情况，页码范围：1-5.--%>
                <c:when test="${pageNumber <= 3 }">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="5"/>
                </c:when>
                <%--小情况2：当前页码为最后3个，8，9，10，页码范围是：总页码-4 - 总页码--%>
                <c:when test="${pageNumber > bookPageTotal-3}">
                    <c:set var="begin" value="${bookPageTotal-4}"/>
                    <c:set var="end" value="${bookPageTotal}"/>
                </c:when>
                <%--小情况3：4，5，6，7，页码范围是：当前页码减2 - 当前页码加2--%>
                <c:otherwise>
                    <c:set var="begin" value="${pageNumber-2}"/>
                    <c:set var="end" value="${pageNumber+2}"/>
                </c:otherwise>
            </c:choose>
        </c:when>
    </c:choose>

    <c:forEach begin="${begin}" end="${end}" var="i">
        <c:if test="${i == pageNumber}">
            【${i}】
        </c:if>
        <c:if test="${i != pageNumber}">
            <a href="book/page/${i}?min=${requestScope.min}&max=${requestScope.max}">${i}</a>
        </c:if>
    </c:forEach>
    <%--页码输出的结束--%>

    <%-- 如果已经 是 最后一页,则不显示下一页,末页 --%>
    <c:if test="${pageNumber < bookPageTotal}">
        <a href="book/page/${pageNumber+1}?min=${requestScope.min}&max=${requestScope.max}">下一页</a>
        <a href="book/page/${bookPageTotal}?min=${requestScope.min}&max=${requestScope.max}">末页</a>
    </c:if>

    共${bookPageTotal}页，${bookTotal}条记录
    到第<input value="${pageNumber}" name="pn" id="pn_input"/>页
    <input id="searchPageBtn"  type="button" value="确定">
    <script type="text/javascript">
        $(function () {
            // 调到指定页码
            $("#searchPageBtn").click(function () {
                // 获取输入框中的页码
                var pageNo = $("#pn_input").val();

                var pageTotal = ${bookPageTotal};

                if ( pageNo < 1 || pageNo > pageTotal){
                    alert("输入有误!!!");
                    return false;
                }

                // Javascript语言中提供了一个Location地址栏对象
                // 它有一个属性叫href,它可以获取浏览器地址栏中的地址
                // href 属性可读,可写
                // alert(location.href)
                location.href = "book/page/" + pageNo + "?min=${requestScope.min}&max=${requestScope.max}";
            });
        });
    </script>
</div>
<%--分页条的结束--%>
