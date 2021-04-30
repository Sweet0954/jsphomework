<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>${msg}</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/update" method="post">
        <input type="hidden" name="id" value="${book.id}"/> <br>
        书籍名称：<input type="text" name="name" value="${book.name}"/> <br>
        书籍作者：<input type="text" name="author" value="${book.author}"/> <br>
        书籍版本：<input type="text" name="version" value="${book.version}"/> <br>
        书籍单价：<input type="text" name="price" value="${book.price}"/> <br>
        <input type="submit" value="提交"/>
    </form>
</div>
</body>
</html>
