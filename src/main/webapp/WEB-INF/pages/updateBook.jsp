<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>添加图书页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/layui/css/style.css">
    <script src="/layui/layui.js"></script>
    <style>
        body{padding: 20px;}
        .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
        .demo-footer{padding: 50px 0; color: #999; font-size: 14px;}
        .demo-footer a{padding: 0 5px; color: #01AAED;}
    </style>
</head>
<body>
<form class="layui-form layui-form-pane">
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">书名：</label>
            <div class="layui-input-inline">
                <input type="text" name="bookName" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${book.bookName}">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">作者：</label>
            <div class="layui-input-inline">
                <input type="text" name="author" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${book.author}">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">库存：</label>
            <div class="layui-input-inline">
                <input type="text" name="bookCounts"
                       lay-verify="required"  autocomplete="off" class="layui-input" value="${book.bookCounts}">
            </div>
        </div>


        <div class="layui-inline">
            <div class="layui-input-inline">
                <input type="hidden" name="bookID" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${book.bookID}">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">书本描述：</label>
            <div class="layui-input-block">
            <textarea style="width:100%; height:150px" placeholder="请输入书本描述" name="detail"
                      lay-verify="required"  class="layui-textarea">${book.detail}</textarea>
            </div>
        </div>

        <button class="layui-btn" lay-submit lay-filter="updatebook">确认修改</button>
        <button type="reset" class="layui-btn" style="float: right">重置</button>


    </div>

</form>

<script>

    layui.use(['form','layer','jquery'], function () {
        const form = layui.form;
        const $ = layui.jquery;

        //添加ajax表单提交
        form.on('submit(updatebook)',function (data) {
            if(!new RegExp("^[0-9]*$").test(data.field.bookCounts)){
                layer.msg("库存必须是数字!");
                return false;
            }
            $.ajax({
                url:'/book/updatebook',
                data:data.field,
                dataType:'json',
                type:'post',
                success:function (data) {
                    if (data.code==0){
                        window.parent.location.reload();  //刷新父页面
                        layer.msg(data.msg,{icon:1});
                        parent.layer.close(index);  //关闭弹出层
                    }else{
                        layer.msg(data.msg,{icon:2});
                    }
                }
            })
            return false;
        })
    });
</script>

</body>
</html>
