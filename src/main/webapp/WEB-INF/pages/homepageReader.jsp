<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>图书展示</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/layui/css/style.css">
    <script src="/layui/layui.js"></script>
</head>

<body>

<div class="layui-layout layui-layout-admin">
    <jsp:include page="/WEB-INF/pages/nav/nav.jsp" flush="true"/>
</div>
<div style="height: 50px"></div>

<table class="layui-hide" id="demo" lay-filter="test"></table>


<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn-normal layui-btn-sm lend" lay-event="lend">借阅</button>
</script>

<script>

    layui.use(['layer', 'table','element'], function(){
        var layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element=layui.element

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 550
            ,url: '/book/booklist' //数据接口
            ,title: '图书名单'
            ,page: true //开启分页
            ,limit: 5
            ,limits: [5,10,15,20]
            ,toolbar: true //true：仅开启工具栏，不显示左侧模板
            ,totalRow: true
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'bookID', title: '编号', width:80, sort: true}
                ,{field: 'bookName', title: '书名', width:150}
                ,{field: 'author', title: '作者', width: 100}
                ,{field: 'bookCounts', title: '库存', width: 100, sort: true}
                ,{field: 'detail', title: '详细信息', width: 200}
                ,{fixed: 'right', width: 200, align:'center', toolbar: '#barDemo'}
            ]]
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'lend') {
                layer.confirm('确认借阅此书吗?', function (index) {
                    lend(obj, index, data);
                });
            }
        });

        function lend(obj, index, data1) {
            var $=layui.$
            $.ajax({
                url: '/book/lend?'
                    + 'bookID=' + data1.bookID,
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    if (data.status == 1) {
                        //当前行数
                        var i = $("tr").index(obj.tr) - 1;

                        //获取当前dom
                        var dom = $('.lend').eq(i);

                        if (dom.hasClass('layui-btn-normal')) {
                            dom.removeClass('layui-btn-normal');
                            //变为禁用
                            dom.addClass('layui-btn-disabled');
                            //去除点击事件
                            dom.attr("disabled", "disabled");
                            dom.html('已借阅');
                        }
                        //更新库存
                        obj.update({
                            bookCounts: data1.bookCounts
                        });
                        layer.close(index);

                    } else if (data.status == '2') {
                        layer.msg('您已经借过该图书!', {icon: 5});
                    }else if(data.status == '0') {
                        layer.msg('该图书库存不足!', {icon: 5});
                    }
                }
            })


        }

    });
</script>

</body>
</html>
