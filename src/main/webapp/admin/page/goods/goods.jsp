<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品列表</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="/admin/css/demo.css" rel="stylesheet" type="text/css" />
    <script src="/admin/js/boot.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;">
    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td style="width:100%;">
                    <a class="mini-button" iconCls="icon-add" href="/admin/page/goods/goods_add.jsp">添加</a>
                    <a class="mini-button" iconCls="icon-add" onclick="edit()">修改</a>
                    <%--<a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>--%>
                    <%--<a class="mini-button" iconCls="icon-add" onclick="edits()">编辑</a>--%>
                    <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>
                </td>
                <td style="white-space:nowrap;">
                    <input id="key" class="mini-textbox"  style="width:150px;" onenter="onKeyEnter"/>
                    <a class="mini-button" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>
</div>
<div id="datagrid1" class="mini-datagrid" style="width:100%;height:640px;" allowResize="true"
     url="/ad_goods_queryAll"  idField="id" multiSelect="true"
>
    <div property="columns">
        <!--<div type="indexcolumn"></div>        -->
        <div type="checkcolumn" ></div>
        <div field="id" width="50" headerAlign="center" allowSort="true">ID</div>
        <div field="name" width="120" headerAlign="center" allowSort="true">名称</div>
        <div field="className" width="90" headerAlign="center" allowSort="true">类别</div>
        <div field="zhutu" headerAlign="center">主图</div>
        <div field="price" width="90" headerAlign="center" allowSort="true">价格</div>
        <div field="oprice" width="90" headerAlign="center" allowSort="true">原价</div>
        <div field="stock" width="90" headerAlign="center" allowSort="true">库存</div>
        <div field="sale" width="90" headerAlign="center" allowSort="true">销量</div>
        <div field="stateName" width="90" headerAlign="center" allowSort="true">状态</div>
        <div field="params" width="90" headerAlign="center" allowSort="true">参数</div>
        <div field="profile" width="120" headerAlign="center" allowSort="true">商品简介</div>
        <div field="timetime" width="125" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss" allowSort="true">添加时间</div>
    </div>
</div>

<script type="text/javascript">
    mini.parse();

    var grid = mini.get("datagrid1");
    grid.load();
    grid.sortBy("createtime", "desc");


    function add() {

        mini.open({
            url: bootPATH + "../page/goods/goods_add.html",
            title: "商品添加", width: 1200, height: 800,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {

                grid.reload();
            }
        });
    }
    function edit() {
        var row = grid.getSelected();
        if (row) {
            location.href='/ad_goods_queryById?action=goods&id='+row.id;
        } else {
            alert("请选中一条记录");
        }
    }
    function editp() {
        var row = grid.getSelected();
        if (row) {
            location.href='/ad_goods_queryById?action=img&id='+row.id;
        } else {
            alert("请选中一条记录");
        }
    }
    function edits() {
        var row = grid.getSelected();
        if (row) {
            mini.open({
                url: bootPATH + "../page/goods/goods_add.jsp",
                title: "编辑商品", width: 1200, height: 800,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "edit", id: row.id };
                    //alert(row.id);
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    grid.reload();
                }
            });
        } else {
            alert("请选中一条记录");
        }
    }
    function remove() {

        var rows = grid.getSelecteds();
        if (rows.length > 0) {
            if (confirm("确定删除选中记录？")) {
                var ids = [];
                for (var i = 0, l = rows.length; i < l; i++) {
                    var r = rows[i];
                    ids.push(r.id);
                }
                var id = ids.join(',');
                grid.loading("操作中，请稍后......");
                $.ajax({
                    url:"/ad_goods_delete?id="+id,
                    success: function (text) {
                        grid.reload();
                    },
                    error: function () {
                    }
                });
            }
        } else {
            alert("请选中一条记录");
        }
    }
    function search() {
        var key = mini.get("key").getValue();
        grid.load({ key: key });
    }
    function onKeyEnter(e) {
        search();
    }
    /////////////////////////////////////////////////
    function onBirthdayRenderer(e) {
        var value = e.value;
        if (value) return mini.formatDate(value, 'yyyy-MM-dd');
        return "";
    }
    function onMarriedRenderer(e) {
        if (e.value == 1) return "是";
        else return "否";
    }
    var Genders = [{ id: 1, text: '男' }, { id: 2, text: '女'}];
    //        var state=[{id:0,text:'上架'},{id:1,text:'下架'},{id:2,text:'缺货'}]
    function onGenderRenderer(e) {
        for (var i = 0, l = Genders.length; l < i; i++) {
            var g = Genders[i];
            if (g.id == e.value) return g.text;
        }
        return "";
    }

</script>
</body>
</html>