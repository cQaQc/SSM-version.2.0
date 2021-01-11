<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>导航栏</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/layui/layui.js"></script>

</head>

<!-- 头部区域 layui水平导航栏 -->
<body>
<div class="layui-header">
    <div class="layui-logo">图书管理系统</div>
    <ul class="layui-nav layui-layout-left">

        <c:if test="${admin!=null}">

            <li class="layui-nav-item">
                <a href="javascript:;">图书管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/library/index">图书列表</a></dd>
                    <dd><a href="/type/bookType">分类管理</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/reader/readerIndex">读者列表</a></li>
            <li class="layui-nav-item"><a href="/listDisBackAdmin">借阅管理</a></li>
            <li class="layui-nav-item"><a onclick="alterPwd('0');">修改密码</a></li>
        </c:if>


        <c:if test="${reader!=null}">
            <li class="layui-nav-item"><a href="library/frontIndex">图书列表</a></li>
            <li class="layui-nav-item"><a href="listDisBack">借阅记录</a></li>
            <li class="layui-nav-item"><a onclick="alterPwd('1');">修改密码</a></li>
        </c:if>
    </ul>


    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="https://pic.cnblogs.com/avatar/2188008/20201020233049.png" class="layui-nav-img">
                <c:if test="${admin!=null}">欢迎管理员：${admin.name}</c:if>
                <c:if test="${reader!=null}">欢迎读者：${reader.name}</c:if>
            </a>
        </li>
        <li class="layui-nav-item"><a href="/book/loginout">退出</a></li>
    </ul>
</div>



<script>
    function alterPwd(num){//添加
        layer.open({
            type: 2,
            title: '修改密码',
            skin: 'layui-layer-demo', //加上边框
            area: ['500px', '300px'], //宽高
            offset:'rt', //坐标
            content: '/toAlterpwdPage?state='+num
        });
    }
</script>

</body>
</html>
