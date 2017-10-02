<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>添加小分类</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    
    <script src="../../js/boot.js" type="text/javascript"></script>

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
     
    <form id="form1" method="post" >
        <%--<input name="id" class="mini-hidden" />--%>
        <div style="padding-left:11px;padding-bottom:5px;">
            <table style="table-layout:fixed;">
                <input type="text" name="" hidden id="">
                <tr>
                    <td style="width:150px;">名称:</td>
                    <td style="width:150px;">

                        <input name="id" class="mini-textbox" required="true"  emptyText="请名称"/>
                    </td>

                </tr>
                <tr>
                    <td style="width:150px;">名称:</td>
                    <td style="width:150px;">    
                        <input name="name" class="mini-textbox" required="true"  emptyText="请名称"/>
                    </td>

                </tr>
                <tr>
                    <td >父类ID：</td>
                    
                    <td style="width:150px;">
                        <input name="pid" class="mini-textbox" required="true"  emptyText="pid"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:150px;">路径:</td>
                    <td style="width:150px;">
                        <input name="path" class="mini-textbox" required="true"  emptyText="请输入分类名称"/>
                    </td>

                </tr>
            </table>
        </div>
            <a class="mini-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>
            <a class="mini-button" onclick="onCancel" style="width:60px;">取消</a>
          <%--  <input type="submit" value="提交" ><br><br>
                <input type="reset" value="取消">--%>
    </form>
    <script type="text/javascript">
        mini.parse();

        var form = new mini.Form("form1");

        function SaveData() {
            var o = form.getData();
            form.validate();
            if (form.isValid() == false) return;

            var json = mini.encode(o);

          /*  可以放数组下面是例子
            var json = mini.encode([o]);*/
           /* 想看看json把json转成string*/
           // alert(JSON.stringify(json))
            $.ajax({
                url: "../../../ad_class_update02.do",
                type: 'post',
                data: { data: json },
                cache: false,
                success: function (text) {
                    CloseWindow("save");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
        }

        ////////////////////
        //标准方法接口定义
        function SetData(data) {
            if (data.action == "edit") {
                //跨页面传递的数据对象，克隆后才可以安全使用
                data = mini.clone(data);

                $.ajax({
                    url: "../../../ad_class_update.do?id=" + data.id,
                    cache: false,
                    success: function (text) {
                        var o = mini.decode(text);
                        form.setData(o);
                        form.setChanged(false);

                        onDeptChanged();
                        mini.getbyName("position").setValue(o.position);
                    }
                });
            }
        }

        function GetData() {
            var o = form.getData();
            return o;
        }
        function CloseWindow(action) {
            if (action == "close" &amp;&amp; form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();
        }
        function onOk(e) {
            SaveData();
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
        //////////////////////////////////
        function onDeptChanged(e) {
            var deptCombo = mini.getbyName("dept_id");
            var positionCombo = mini.getbyName("position");
            var dept_id = deptCombo.getValue();

            positionCombo.load("" + dept_id);
            positionCombo.setValue("");
        }



    </script>

</body>
</html>
