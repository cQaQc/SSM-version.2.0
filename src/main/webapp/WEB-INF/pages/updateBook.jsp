<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h5>--请修改---</h5>
<form action="/book/updateBook" method="post" >
    <div>
        <input type="hidden" name="id" value="${book.bookID}">
    </div>
    <div>
        <input type="text" name="bookName" value="${book.bookName}">
    </div>
    <div>
        <input type="text" name="counts" value="${book.bookCounts}">
    </div>
    <div>
        <input type="text" name="detail" value="${book.detail}">
    </div>
    <div>
        <input type="submit" value="提交">
    </div>
</form>
</body>
</html>
