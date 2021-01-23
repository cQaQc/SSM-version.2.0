<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/layui/css/style.css">
    <script src="/layui/layui.js" ></script>
</head>
<body>
<div class="login-main">
    <!-- 表单选项 -->
    <div style="padding: 15px;">

        <form class="layui-form">
            <div class="layui-input-inline">
                <div class="layui-inline" style="width: 85%">
                    <input type="password" id="opwd" required
                           lay-verify="required" placeholder="原密码" autocomplete="off" class="layui-input">
                </div>
                <!-- 对号 -->
                <div class="layui-inline">
                    <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
                </div>
                <!-- 错号 -->
                <div class="layui-inline">
                    <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
                </div>
            </div>
            <!-- 密码 -->
            <div class="layui-input-inline">
                <div class="layui-inline" style="width: 85%">
                    <input type="hidden" name="num" value="${num}">
                    <input type="hidden" id="adminId" name="adminId" value="${admin.adminId}">
                    <input type="hidden" id="id" name="id" value="${reader.id}">
                    <input type="password" id="pwd" name="pwd" required
                           lay-verify="required" placeholder="新密码" autocomplete="off" class="layui-input">
                </div>
                <!-- 对号 -->
                <div class="layui-inline">
                    <i class="layui-icon" id="pri" style="color: green;font-weight: bolder;" hidden></i>
                </div>
                <!-- 错号 -->
                <div class="layui-inline">
                    <i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
                </div>
            </div>

            <!-- 确认密码 -->
            <div class="layui-input-inline">
                <div class="layui-inline" style="width: 85%">
                    <input type="password" id="rpwd"  required  lay-verify="required"
                           placeholder="重复新密码" autocomplete="off" class="layui-input">
                </div>
                <!-- 对号 -->
                <div class="layui-inline">
                    <i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;" hidden></i>
                </div>
                <!-- 错号 -->
                <div class="layui-inline">
                    <i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
                </div>
            </div>

            <div class="layui-input-inline login-btn" style="width: 85%">
                <button type="submit" lay-submit lay-filter="sub" class="layui-btn">点击修改</button>
            </div>
        </form>
    </div>
</div>

    <script>
        layui.use(['form','jquery','layer'], function () {
            var form   = layui.form;
            var $      = layui.jquery;
            var layer  = layui.layer;

            //添加表单失焦事件
            //验证表单
            $('#opwd').blur(function() {
                var opwd = $(this).val();
                var adminId=$('#adminId').val();
                var id =$('#id').val();
                $.ajax({
                    url:'/book/check',
                    type:'post',
                    dataType:'json',
                    data:{
                        opwd: opwd,
                        adminId: adminId,
                        id: id,
                        num: ${num}
                    },

                    //验证原密码是否正确
                    success:function(data){
                        if (data.code==0) {
                            $('#ri').removeAttr('hidden');
                            $('#wr').attr('hidden','hidden');
                        } else {
                            $('#wr').removeAttr('hidden');
                            $('#ri').attr('hidden','hidden');
                            layer.msg(data.msg);
                            form.render();
                        }

                    }
                })

            });


            //验证两次密码是否一致
            $('#rpwd').blur(function() {
                if($('#pwd').val() != $('#rpwd').val()){
                    $('#rpwr').removeAttr('hidden');
                    $('#rpri').attr('hidden','hidden');
                    layer.msg('两次输入密码不一致!');
                }else {
                    $('#rpri').removeAttr('hidden');
                    $('#rpwr').attr('hidden','hidden');
                };
            });

            //添加表单监听事件,提交注册信息
            form.on('submit(sub)', function(data) {
                $.ajax({
                    url:'/book/alterPwd',
                    data:data.field,
                    dataType:'json',
                    type:'post',
                    success:function(data){
                        if (data.code==0) {
                            layer.alert(data.msg,function(){
                                window.parent.location.href = "/book/tologin";//刷新父页面
                                parent.layer.close(index);//关闭弹出层
                            });
                        }else {
                            layer.msg(data.message);
                        }
                    }
                })
                //防止页面跳转
                return false;
            });

        });
    </script>
</body>
</html>

