<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录界面</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/layui/css/style.css">
    <script src="/layui/layui.js"></script>
</head>
<body>

<div class="login-main">
    <header class="layui-elip">图书管理系统登录</header>

    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" name="name" required
                   lay-verify="required" placeholder="学号" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required
                   lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <select name="access" id="access" lay-verify="required">
                <option value="">请选择权限</option>
                <option value="0" >管理员</option>
                <option value="1" >读者</option>
            </select>
        </div>

        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="login" class="layui-btn">登录</button>
        </div>
        <hr/>
        <p>
            <a href="/book/toregist" class="fl">立即注册</a>
            <a href="javascript:;" class="fr" onclick="forgetpsw();">忘记密码？</a>
        </p>
    </form>
</div>



<script>
    // 1. 模块加载
    layui.use(['form','layer','jquery'], function () {
        // 操作对象
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;


        form.on('submit(login)',function (data) {
            $.ajax({
                type:'POST',
                url:'/book/dologin',
                data:data.field,
                dataType:'json',

                success:function (data) {
                    if (data.stu === '0'){
                        location.href = "/book/homepage";

                    }else if (data.stu === '1') {
                        location.href = "/book/homepagefy";

                    } else{
                        layer.msg(data.msg);
                    }
                }
            })
            return false;
        })
    });

    //点击'忘记密码'触发
    function forgetpsw(){
        layer.msg('联系管理员(博客园：柯神_)或到图书馆进行重置');
    }
</script>
</body>
</html>
