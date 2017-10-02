<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>月销售报表</title>
    <link href="../../css/demo.css" rel="stylesheet" type="text/css" />
    <script src="../../js/boot.js" type="text/javascript"></script>
</head>
<body>
<body>
<h1>月销售报表</h1>
<div style="width:800px;">
    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td width="100%">
                    <input id="date1" class="mini-monthpicker" value="2017-07" />
                    <a class="mini-button" onclick="search1()">查询</a>
                </td>
                <td style="white-space:nowrap;">
                    <input id="key" class="mini-textbox" emptyText="请输入商品名" style="width:150px;" onenter="onKeyEnter"/>
                    <a class="mini-button" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>
</div>
<div id="datagrid1" class="mini-datagrid" url="order?query=queryMonthOrder" style="width:800px;height:280px;" allowResize="true">
    <div property="columns">
        <div field="id" headerAlign="center" allowSort="true">编号</div>
        <div field="name" headerAlign="center" allowSort="true">商品</div>
        <div field="num" headerAlign="center" allowSort="true">月销售量</div>
        <div field="total" headerAlign="center" allowSort="true">月销售额</div>
        <div field="month" headerAlign="center" allowSort="true">时间</div>
    </div>
</div>
<script type="text/javascript">
    mini.parse();
    var grid = mini.get("datagrid1");
    grid.load();
    function search() {
        var key = mini.get("key").getValue();
        grid.load({ key: key });
    }
    function formatTen(num) {
        return num > 9 ? (num + "") : ("0" + num);
    }
    function formatDate(date) {
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        return year + "-" + formatTen(month);
    }
    function search1() {
        var date1 = mini.get("date1").getValue();
        var date = formatDate(date1);
        grid.load({ date1: date });
    }
</script>
</body>
</body>
</html>