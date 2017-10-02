<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="javascript" type="text/javascript" src="/admin/js/My97DatePicker/WdatePicker.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>轮播编辑</title>
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
    <form action="/banner_edit" method="post" enctype="multipart/form-data">
        <div style="display:none">
            <input type="text" value="${param.id}" id="id" name="id">
        </div>
        <div style="padding-left:11px;padding-bottom:5px;">
            <table style="table-layout:fixed;">
                <tr>
                    <td style="width:70px;">商品ID：</td>
                    <td style="width:150px;">
                        <input name="gid"  required="true" type="text"onfocus="javascript:if(this.value=='${param.gid}')this.value='';" emptyText value='${param.gid}'>
                    </td>
                    <td style="width:70px;">名称：</td>
                    <td>
                        <input name="name"  required="true" type="text" value='${param.name}' onfocus="javascript:if(this.value=='${param.name}')this.value='';"emptyText>
                    </td>
                    </td>
                </tr>
                <tr>
                    <td >图片：</td>
                    <td >    
                        <input id="img" name="img"  required="true" type="file" emptyText="选择图片"/>
                    </td>
                    <td >链接：</td>
                    <td >
                        <input name="link"  required="true" type="text" value='${param.link}' onfocus="javascript:if(this.value=='${param.link}')this.value='';"emptyText>
                    </td>
                </tr>
                <tr>
                    <td >状态：</td>
                    <td >
                        <input name="state"  required="true" type="text" value='${param.state}' onfocus="javascript:if(this.value=='${param.state}')this.value='';"emptyText=${param.state}>
                    </td>
                    <td >添加时间：</td>
                    <td >
                        <input name="intime" class="Wdate" name="inTime"type="text" required="true" emptyText onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})">
                    </td>
                </tr>           
            </table>
        </div>
        <div style="text-align:center;padding:10px;">               
            <input type="submit" style="width:60px;margin-right:20px;">
            <input type="button" onclick="window.CloseOwnerWindow(action)" style="width:60px;" value="取消">
        </div>        
    </form>
    <script type="text/javascript">


    </script>
    <script language="JavaScript">
        setTimeout('window.CloseOwnerWindow(action)',3000);
    </script>
</body>
</html>
