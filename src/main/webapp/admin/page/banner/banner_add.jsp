<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="javascript" type="text/javascript" src="/admin/js/My97DatePicker/WdatePicker.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>添加轮播</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="/admin/js/boot.js" type="text/javascript"></script>
    <style type="text/css">
        html, body
        {
            font-size:12px;
            padding:0;
            margin:0;
            border:0;
            height:100%;
            overflow:hidden;
        }
    </style>
</head>
<body>

<form action="/banner_add" method="post" enctype="multipart/form-data">
    <div style="padding-left:11px;padding-bottom:5px;">
        <table style="table-layout:fixed;">
            <tr>
                <td style="width:70px;">产品ID：</td>
                <td style="width:150px;">
                    <input id="gid" name="gid" required="true"  emptyText="请输入产品ID"/>
                </td>

            </tr>
            <tr>
                <td >轮播名称：</td>
                <td >
                    <input id="name" name="name"  required="true" emptyText="名称"/>
                </td>
            </tr>
            <tr>
                <td style="width:70px;"> 选择图片：</td>
                <td >
                    <input id="img" name="img"  required="true" type="file" emptyText="选择图片"/>
                </td>
            </tr>
            <tr>
                <td >链接地址：</td>
                <td >
                    <input id="link" name="link" required="true" emptyText="链接"/>
                </td>
            </tr>
            <tr>
                <td >轮播状态：</td>
                <td >
                    <input id="state" name="state"  required="true" emptyText="选择状态"/>
                </td>
            </tr>
            <tr>
                <td >添加时间：</td>
                <td >
                    <input id="intime" class="Wdate" name="intime"type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})"required="true" emptyText="请选择日期">
                </td>
            </tr>
        </table>
    </div>
    <div style="text-align:center;padding:10px;">
        <input type="submit" onclick="add()" value="确定">
        <input type="button" onclick="window.CloseOwnerWindow(action)" value="关闭">
    </div>


</form>
<script type="text/javascript">
function add() {

}
</script>
</body>
</html>
