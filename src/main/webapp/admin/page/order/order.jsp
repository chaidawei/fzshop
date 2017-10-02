﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单列表</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../../css/demo.css" rel="stylesheet" type="text/css" />

    <script src="../../js/boot.js" type="text/javascript"></script>
</head>
<body>
    <div style="width:100%;">
        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                       <%-- <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>--%>
                        <a class="mini-button" iconCls="icon-add" onclick="edit()">编辑</a>
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
         url="/fz_order_select.do"  idField="id" multiSelect="true">
        <div property="columns">
            <!--<div type="indexcolumn"></div>        -->
            <div type="checkcolumn" ></div>
            <div field="id" width="120" headerAlign="center" allowSort="true">ID</div>
            <div field="custId" width="120" headerAlign="center" allowSort="true">会员ID</div>
            <div field="addId" headerAlign="center">收货地址ID</div>
            <div field="orderNum" width="120" headerAlign="center" allowSort="true">订单号</div>
            <div field="total" width="120" headerAlign="center" allowSort="true">订单总额</div>
            <div field="state" width="120" headerAlign="center" allowSort="true">订单状态</div>
            <div field="payStatus" width="120" headerAlign="center" allowSort="true">付款状态</div>
            <div field="payType" width="120" headerAlign="center" allowSort="true">付款方式</div>
            <div field="fhStatus" width="120" headerAlign="center" allowSort="true">发货状态</div>
            <div field="time" width="100" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">订单时间</div>
            <div field="serialNo" width="100" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">发货单号</div>
        </div>
    </div>
    

    <script type="text/javascript">
        mini.parse();

        var grid = mini.get("datagrid1");
        grid.load();
        grid.sortBy("createtime", "desc");

        function add() {
            mini.open({
                url: "/admin/page/order/order_edit.html",
                title: "添加新分类", width: 600, height: 400,
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
                    url:"/admin/page/order/order_edit.html",
                    title: "编辑订单", width: 600, height: 400,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "edit", id: row.id };
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
                        url: "/ad_order_delete.do?id="+id,
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
        function onGenderRenderer(e) {
            for (var i = 0, l = Genders.length; i < l; i++) {
                var g = Genders[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }

    </script>
</body>
</html>