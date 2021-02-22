<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>归还图书</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/layui/css/style.css">
    <script src="/layui/layui.js"></script>
</head>

<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <jsp:include page="/WEB-INF/pages/nav/nav.jsp" flush="true"/>
</div>

<table class="layui-hide" id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    {{#  if(d.state =="1"){ }}
    <a class="layui-btn layui-btn-normal backBook" lay-event="backBook">确认归还</a>
    {{#  } }}
    {{#  if(d.state =="2"){ }}
    <button class="layui-btn  lend layui-btn-disabled backBook" lay-event="lend" disabled="disabled">已归还</button>
    {{#  } }}
</script>
<div id="testDiv"></div>

<script>
    layui.use(['layer', 'table', 'carousel', 'upload', 'element', 'slider','laytpl'], function(){
        var layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element //元素操作
            ,slider = layui.slider //滑块
            ,laytpl = layui.laytpl

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 550
            ,url: '/book/lendHistoryAdmin' //数据接口
            ,title: '借阅记录'
            ,page: true
            ,limit: 6
            ,limits: [5,10,15,20]
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'id', title: '编号', width:100, sort: true}
                ,{field: 'name', title: '借阅人', width: 100}
                ,{field: 'bookID', title: '图书ID', width: 150}
                ,{field: 'bookName', title: '书名', width: 150}
                ,{field: 'lendTime', title: '借阅时间', width:300, sort: true}
                ,{field: 'backTime', title: '归还时间', width: 300}
                ,{field: 'count', title: '借阅数量', width: 100},
                ,{fixed: 'right', title: '状态', width:100 , toolbar: '#barDemo'}
            ]]
        });


        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data
                ,layEvent = obj.event;
            if(layEvent === 'backBook'){
                layer.confirm('确认归还此图书吗？', function(index){
                    backBook(data,obj,index);
                });
            }
        });
        var $=layui.$;
        function backBook(data1,obj,index){
            $.ajax({
                url:'/book/backBook?bookID='+data1.bookID,
                dataType:'json',
                type:'post',
                success:function (data) {
                    if (data.success){
                        //当前行数
                        var i =$("tr").index(obj.tr)-1;
                        //获取当前dom
                        var dom = $('.backBook').eq(i);
                        if(dom.hasClass('layui-btn-normal')){
                            dom.removeClass('layui-btn-normal');
                            //变为禁用
                            dom.addClass('layui-btn-disabled');
                            //去除点击事件
                            dom.attr("disabled",true);
                            dom.attr("lay-event","");

                            dom.html(data.message);
                        }
                        layer.close(index);

                    }else{
                        layer.msg(data.message);
                    }
                }
            })
        }
    });



</script>
</body>
</html>

