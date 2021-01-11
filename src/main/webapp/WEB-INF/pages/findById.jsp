<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 蜘蛛啊全是腿儿
  Date: 2020/9/29
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>全部书籍展示</title>
</head>
<body>
<h1>书籍id=${book.bookID}：</h1>
<div>
    <table>
        <thead>
        <tr>
            <th>编号</th>
            <th>书名</th>
            <th>库存</th>
            <th>详细信息</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td>${book.bookID}</td>
                <td>${book.bookName}</td>
                <td>${book.bookCounts}</td>
                <td>${book.detail}</td>
            </tr>
        </tbody>
    </table>
</div>
<a href="/book/homepage">返回书籍列表</a>
</body>
</html>
