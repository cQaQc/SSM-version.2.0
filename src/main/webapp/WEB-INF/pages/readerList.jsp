<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/layui/css/style.css">
    <script src="/layui/layui.js" ></script>
    <title>图书管理系统</title>
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/WEB-INF/pages/nav/nav.jsp" flush="true"/>


<table class="layui-hide" id="demo" lay-filter="test"></table>

<div class="layui-tab-item layui-show">
    <div id="pageDemo"></div>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>

<script>
    layui.use('element', function(){
        var element = layui.element;

    });
</script>

<script>
    layui.use(['laydate', 'laypage', 'layer', 'table'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,$ = layui.$


        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 550
            ,url: '/book/readerList' //数据接口
            ,title: '图书表'
            ,page: true
            ,limit: 6
            ,limits: [5,10,15,20]
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'id', title: '编号', width:150, sort: true}
                ,{field: 'name', title: '姓名', width:150}
                ,{field: 'sno', title: '学号', width:150,sort: true}
                ,{field: 'birth', title: '生日', width:200, sort: true}
                ,{field: 'major', title: '专业', width: 120}
                ,{fixed: 'right', title: '操作',width: 200, align:'center', toolbar: '#barDemo'}
            ]]
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'del'){
                layer.confirm('真的删除这一行么', function(index){
                    del(data.id,obj,index);
                });
            }
        });

        function del(id,obj,index){
            $.ajax({
                url:'/book/readerDel?id='+id,
                dataType:'json',
                type:'post',
                success:function (data) {
                        obj.del();
                        layer.msg(data.msg,{time: 1000});
                        layer.close(index);
                }
            })
        }
    });



</script>
</body>
</html>
