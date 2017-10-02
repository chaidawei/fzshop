<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>添加大分类</title>
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
     
    <form id="form1" method="post" action="../../../ad_class_add02.do">
        <%--<input name="id" class="mini-hidden" />--%>
        <div style="padding-left:11px;padding-bottom:5px;">
            <table style="table-layout:fixed;">
                <tr>
                    <td style="width:170px;">请输入大分类名称:</td>
                    <td style="width:150px;">    
                        <input name="name" class="mini-textbox" required="true"  emptyText="请输入大分类名称"/>
                    </td>
                </tr>
            </table>
        </div>

                <input type="submit" value="提交" ><br><br>
                <input type="reset" value="取消">


    </form>


</body>
</html>
