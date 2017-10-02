<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>订单报表</title>
    <link href="../../css/demo.css" rel="stylesheet" type="text/css" />
    <script src="../../js/boot.js" type="text/javascript"></script>
</head>
<body>
<body>
<h1>订单报表</h1>
<div style="width:100%;">
    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td width="100%">
                    <input id="date1" class="mini-datepicker" value="2017-07-12" required="true" />
                    <a class="mini-button" onclick="search1()">查询</a>
                </td>
                <td style="white-space:nowrap;">
                    <input id="key" class="mini-textbox" emptyText="请输入订单号" style="width:180px;" onenter="onKeyEnter"/>
                    <a class="mini-button" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>
</div>
<div id="datagrid1" class="mini-datagrid" url="order?query=queryOrder" style="width:100%;height:280px;" allowResize="true">
    <div property="columns">
        <div field="order_num" headerAlign="center" allowSort="true">订单号</div>
        <div field="name" headerAlign="center" allowSort="true">所买商品</div>
        <div field="address" headerAlign="center" allowSort="true">买家地址</div>
        <div field="total" headerAlign="center" allowSort="true">订单总额</div>
        <div field="state" headerAlign="center" allowSort="true">订单状态</div>
        <div field="time" headerAlign="center" allowSort="true">订单时间</div>
        <div field="pay_type" headerAlign="center" allowSort="true">付款方式</div>
    </div>
</div>
<script type="text/javascript">
    mini.parse();
    var grid = mini.get("datagrid1");
    grid.load();
    function search(){
        var key = mini.get("key").getValue();
        var str = /FZ\d{19}$/;
        if (key.length != 21 ) {
            alert("请输入正确的21位订单号")
        }else if (!key.match(str)){
            alert("请输入正确的以FZ开头的21位订单号码")
        }else{
            grid.load({key: key});
        }
    }
    function formatTen(num) {
        return num > 9 ? (num + "") : ("0" + num);
    }
    function formatDate(date) {
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        return year + "-" + formatTen(month)+ "-" + formatTen(day);
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