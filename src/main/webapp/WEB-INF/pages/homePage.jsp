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

<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <jsp:include page="/WEB-INF/pages/nav/nav.jsp" flush="true"/>
<div style="height: 10px"></div>
    <!-- 搜索条件表单 -->
    <div class="demoTable layui-form">
        <div class="layui-inline">
            <input class="layui-input"
                   name="bookname" id="bookname" autocomplete="off"
                   placeholder="请输入书名">
        </div>

        <div class="layui-inline">
            <input class="layui-input"
                   name="author" id="author" autocomplete="off"
                   placeholder="请输入作者">
        </div>

        <button class="layui-btn" data-type="reload">搜索</button>

        <a style="margin-left: 70px" class="layui-btn layui-btn-normal" onclick="add();">添加图书</a>
    </div>
</div>

<table class="layui-hide" id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-sm" lay-event="see">查看</a>
    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>

<script>
    //添加
    function add(){
        layer.open({
            type: 2,
            title: '添加图书',
            skin: 'layui-layer-demo', //加上边框
            area: ['800px', '600px'], //宽高
            content: '/book/addbook'
        });
    }


    layui.use(['laydate', 'laypage', 'layer', 'table', ], function(){
        var laydate = layui.laydate //日期
            ,layer = layui.layer //弹层
            ,table = layui.table //表格



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
                ,{field: 'bookID', title: '编号', width:150, sort: true}
                ,{field: 'bookName', title: '书名', width:200}
                ,{field: 'author', title: '作者', width: 200}
                ,{field: 'bookCounts', title: '库存', width: 100, sort: true}
                ,{field: 'detail', title: '详细信息', width: 100}
                ,{fixed: 'right', width: 200, align:'center', toolbar: '#barDemo'}
            ]]
        });

        var $ = layui.$, active = {
            reload: function(){
                var bname = $('#bookname');
                var author = $('#author');

                //执行重载
                table.reload('demo', {
                    //一定要加不然乱码
                    method: 'post'
                    ,page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        bname: bname.val(),
                        author: author.val(),
                    }
                });
            }
        };


        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'see'){
                layer.alert('编号: '+ data.bookID+'<br>书名: '+data.bookName+'<br>作者：'+data.author+'<br>库存: '+data.bookCounts+'<br>详细信息: '+data.detail);

            } else if(layEvent === 'del'){
                layer.confirm('真的删除这一行数据么?',{icon: 3}, function(index){
                    del(data.bookID,obj,index);
                    layer.close(index);
                });
            } else if(layEvent === 'edit'){
                    edit(data);
            }
        });
        //后边两个参数仅仅是因为要执行动态删除dom
        function del(bookID,obj,index){
            $.ajax({
                url:'/book/delebook?bookID='+bookID,
                dataType:'json',
                type:'post',
                success:function (data) {
                        console.log(data);
                        var oldData = table.cache["demo"];                        obj.del(); //删除对应行（tr）的DOM结构
                        layer.close(index);
                        layer.msg("删除成功",{time: 10},function(){
                        table.reload('demo',{data : oldData});
                    });
                }
            })
        }


        function edit(data){//修改

            layer.open({
                type: 2,
                title: '修改图书信息',
                skin: 'layui-layer-demo', //加上边框
                area: ['800px', '600px'], //宽高
                method: 'post',
                content: '/book/updatebook?'
                    +'bookID='+data.bookID
            });
        }
    });
</script>

</body>
</html>
