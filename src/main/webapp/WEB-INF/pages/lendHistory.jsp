<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <title>读者未还图书</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/WEB-INF/pages/nav/nav.jsp" flush="true"/>
</div>

<table class="layui-hide" id="demo" lay-filter="test"></table>
                                                                                        ，

<script type="text/html" id="barDemo">
    {{#  if(d.state =="1"){ }}
    <p style="color:limegreen;font-size:1.3em;">未还</p>
    {{#  } }}
    {{#  if(d.state =="2"){ }}
    <p style="color:red;font-size:1.3em;" >已还</p>
    {{#  } }}
</script>

<div id="testDiv"></div>

<script src="/layui/layui.js"></script>
<script>

    layui.use(['element','laydate','laytpl','table'], function(){
        var laydate = layui.laydate //日期
            ,element = layui.element
            ,table = layui.table //表格
            ,laytpl = layui.laytpl

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 550
            ,url: '/book/lendHistory' //数据接口
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
    });

</script>
</body>
</html>
