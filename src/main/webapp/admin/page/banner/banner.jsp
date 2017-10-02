<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>轮播列表</title>
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
                    <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>
                    <a class="mini-button" iconCls="icon-add" onclick="edit()">编辑</a>
                    <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>
                </td>
                <td style="white-space:nowrap;">
                    <input id="key" class="mini-textbox" emptyText="请输入名称" style="width:150px;" onenter="onKeyEnter"/>
                    <a class="mini-button" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>
</div>

<div id="datagrid1" class="mini-datagrid" style="width:100%;height:640px;" allowResize="true"
     url="/banner_show"  idField="id" multiSelect="true">
    <div property="columns">

        <div type="indexcolumn"></div>
        <div type="checkcolumn" ></div>
        <div field="id" width="120" headerAlign="center" allowSort="true" id="id">ID</div>
        <div field="gid" width="120" headerAlign="center" allowSort="true">商品ID</div>
        <div field="name" header="名称" > </div>
        <div field="img" width="120" headerAlign="center" allowSort="true"id="name">图片</div>
        <div field="link" width="120" headerAlign="center" allowSort="true">链接</div>
        <div field="state" width="120" headerAlign="center" allowSort="true">状态</div>
        <div field="time" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH-mm-ss" allowSort="true">添加时间</div>

    </div>
</div>


<script type="text/javascript">
    mini.parse();

    var grid = mini.get("datagrid1");
    grid.load();
    grid.sortBy("createtime", "desc");


    function add() {

        mini.open({
            url: "/admin/page/banner/banner_add.jsp",
            title: "添加新轮播", width: 600, height: 400,
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
            mini.open({

                url: "/admin/page/banner/banner_edit.jsp?id="+row.id+"&gid="+row.gid+"&name="+row.name+"&img="+row.img+"&link="+row.link+"&state="+row.state+"&intime="+row.inTime,
                title: "编辑轮播", width: 600, height: 400,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "edit"};
                },
                ondestroy: function (action) {
                    grid.reload();

                }
            });

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
                    url:"/banner_delete?id="+id,
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

</script>

</body>
</html>
