<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品添加</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="/admin/css/demo.css" rel="stylesheet" type="text/css" />
    <script src="/admin/js/boot.js" type="text/javascript"></script>
    <style type="text/css">
    html, body {
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
     <%--<span style="font-size: 15px ">&nbsp;&nbsp;&nbsp;》商品添加</span>--%>
    <form id="form1" action="/ad_goods_save" method="post" enctype="multipart/form-data">
        <input name="id" class="mini-hidden" value="${goods.id}"/>
        <div style="padding-left:11px;padding-bottom:5px;">
            <table style="table-layout:fixed;">
                <tr>
                    <td style="width:70px;">商品名称：</td>
                    <td style="width:800px;" colspan="7">
                        <input name="name" style="width: 800px"  required="true" value="${goods.name}" emptyText="请输入商品名称" />
                    </td>
                </tr>
                <tr>
                    <td style="width:70px;">商品简介：</td>
                    <td colspan="7">
                        <input name="proFile" style="width: 800px" required="true" emptyText="请输入商品简介" value="${goods.proFile}"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:70px;">分类：</td>
                    <td style="width:150px;">
                        <input id="btnEdit1" name="classId" class="mini-buttonedit" onbuttonclick="onButtonEdit" required="true" text="${className}"/>

                        <script type="text/javascript">
                            mini.parse();
                            function onButtonEdit(e) {
                                var btnEdit = this;
                                mini.open({
                                    url: "/admin/page/goods/selectclass.jsp",
                                    showMaxButton: false,
                                    title: "选择树",
                                    width: 350,
                                    height: 350,
                                    ondestroy: function (action) {
                                        if (action == "ok") {
                                            var iframe = this.getIFrameEl();
                                            var data = iframe.contentWindow.GetData();
                                            data = mini.clone(data);
                                            if (data) {
                                                btnEdit.setValue(data.id);
                                                btnEdit.setText(data.name);
                                            }
                                        }
                                    }
                                });
                            }
                        </script>
                    </td>
                    <td style="width:70px;">价格：</td>
                    <td >    
                        <input name="price"  required="true" emptyText="请输入价格" value="${goods.price}"/>(元)
                    </td>
                    <td style="width:70px;">库存：</td>
                    <td >    
                        <input name="stock"  required="true" emptyText="请输入库存" value="${goods.stock}"/>(件)
                    </td>
                </tr>
               
                <tr>
                    <td >状态：</td>
                    <td >
                        <select name="state" class="mini-radiobuttonlist">
                            <option value="0" >下架</option>
                            <option value="1" selected>上架</option>
                            <option value="2">缺货</option>
                        </select>
                    </td>
                    <td style="width:70px;">参数：</td>
                    <td >
                        <input name="params" required="true" emptyText="请输入参数" value="${goods.params}"/>
                    </td>
                </tr>
                <%--<tr>--%>
                    <%--<c:if test="${empty goods.id}">--%>
                        <%--<td>商品图片：</td>--%>
                        <%--<td><input type="file" name="logo" emptyText="请选择图片" multiple/>(请最多上传六张图片)</td>--%>
                    <%--</c:if>--%>
                <%--</tr>--%>
                <tr>
                    <td>商品主图(1张)：</td>
                        <td><input type="file" name="logo"/></td>
                </tr>
                <tr style="width: 1300px">
                        <c:if test="${not empty goods.logo}">
                    <td colspan="10">
                            <div style="width: 100px;height: 100px;border: 1px dashed grey;float: left">
                                <img src="/upload/goods/logo/${goods.logo}" style="width: 100px;height: 100px"  name="${goods.logo}" id="${goods.id}" onclick="deletepz(this)">
                            </div>
                    </td>
                        </c:if>
                </tr>
                <tr>
                    <td>商品图片(6张)：</td>
                    <td><input type="file" name="photo" multiple/></td>
                </tr>
                <tr style="width: 1300px">
                        <td colspan="10">
                    <c:forEach items="${img}" var="img">
                            <div style="width: 100px;height: 100px;border: 1px dashed grey;float: left">
                                <img src="/upload/goods/${img.img}" style="width: 100px;height: 100px" name="${img.img}" id="${img.id}" onclick="deletep(this)">
                            </div>
                    </c:forEach>
                        </td>
                </tr>
                <tr>
                    <td>商品描述：</td>
                </tr>
                <tr>
                    <td colspan="7">
                        <script id="editor" name="content" emptyText="请填写描述" type="text/plain"   required="true">
                            ${goods.content}
                        </script>
                        <script type="text/javascript" src="/admin/js/baidu/ueditor.config.js"></script>
                        <script type="text/javascript" src="/admin/js/baidu/ueditor.all.js"></script>
                        <script>
                            var cfg = {
                                lang: 'zh-cn',
                                initialFrameWidth: '100%',
                                initialFrameHeight: 150,
                                elementPathEnabled:false,
                                autoHeight:true
                            };
                            var ue = UE.getEditor('editor',cfg);
                        </script>
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align:center;padding:10px;">               
            <%--<a class="mini-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       --%>
            <input type="submit" style="width:60px;margin-right:20px;"/>
            <input type="button" onclick="history.go(-1)" style="width:60px;margin-right:20px;" value="取消"/>
        </div>        
    </form>
    <script type="text/javascript">

        function deletepz(zhu) {
            var id = zhu.id;
            var logo = zhu.name;
            if(confirm('确定要删除主图吗?')) {
                $.ajax({
                    type: 'post',
                    url: 'ad_goods_delImg',
                    data: {id: id, logo: logo},
                    cache: false,
                    success: function (d) {
                        for (i = 0; i < 1; i++) {
                            window.location.reload()
                        }
                    }
                })
            }
        }

        function deletep(img) {
            var id = img.id;
            var name = img.name;
            if(confirm('确定要删除图片吗?')) {
                $.ajax({
                    type: 'post',
                    url: 'ad_goodsimg_delete',
                    data: {id: id, name: name},
                    cache: false,
                    success: function (d) {
                        for (i = 0; i < 1; i++) {
                            window.location.reload()
                        }
                    }
                })
            }
        }
        mini.parse();
        var form = new mini.Form("form1");

        function SaveData() {
            var o = form.getData();
            form.validate();
           if (form.isValid() == false) return;

            var json = mini.encode([o]);
//            alert(json)
            $.ajax({
                url: "../data/AjaxService.jsp?method=SaveEmployees",
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
                    url:"../../../queryById?id="+data.id,
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
            if (action == "close" && form.isChanged()) {
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

            positionCombo.load("../data/AjaxService.jsp?method=GetPositionsByDepartmenId&id=" + dept_id);
            positionCombo.setValue("");
        }



    </script>
</body>
</html>
