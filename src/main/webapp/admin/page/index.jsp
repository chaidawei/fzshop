<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<!DOCTYPE html>
<head>
    <title>系统界面 NavTree</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" /><link href="../css/demo.css" rel="stylesheet" type="text/css" />
    <script src="../js/boot.js" type="text/javascript"></script>
    <style type="text/css">
        body{
            margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
        }
        .header {
            background:url(../images/header.gif) repeat-x 0 -1px;

        }
    </style>
</head>
<body>

<!--Layout-->
<div id="layout1" class="mini-layout" style="width:100%;height:100%;">
    <div class="header" region="north" height="70" showSplit="false" showHeader="false">
        <h1 style="margin:0;padding:25px 0px 10px 20px;cursor:default;font-size: 35px;font-family:'Trebuchet MS',Arial,sans-serif;">丰泽系统</h1>
        <div style="position:absolute;top:18px;right:10px;">
            <%--<a class="mini-button mini-button-iconTop" iconCls="icon-add" onclick="onQuickClick" plain="true">快捷</a>--%>
            <%--<a class="mini-button mini-button-iconTop" iconCls="icon-date" onclick="onClick"  plain="true" >消息</a>--%>
            <%--<a class="mini-button mini-button-iconTop" iconCls="icon-edit" onclick="onClick"  plain="true" >设置</a>--%>
            <%--<a class="mini-button mini-button-iconTop" iconCls="icon-close" onclick="onClick"  plain="true" >关闭</a>--%>

        </div>
    </div>
    <div title="center" region="center" bodyStyle="overflow:hidden;" style="border:0;">
        <!--Splitter-->
        <div class="mini-splitter" style="width:100%;height:100%;" borderStyle="border:0;">
            <div size="180" maxSize="250" minSize="100" showCollapseButton="true" style="border-width:1px;">
                <!--Tree-->
                <ul id="leftTree" class="mini-tree" url="../js/listTree.txt" style="width:100%;height:100%;"
                    showTreeIcon="true" textField="name" idField="id" resultAsTree="false"
                    onnodeselect="onNodeSelect">
                </ul>

            </div>
            <div showCollapseButton="false" style="border:0px;" >
                <!--Tabs-->
                <div id="mainTabs" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;"
                     onactivechanged="onTabsActiveChanged" plain="false">
                    <div title="产品统计" url="/ad_good_baob" >
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    mini.parse();

    var tree = mini.get("leftTree");

    function showTab(node) {
        //判断是不是打开了，如果没有，新建tab
        var tabs = mini.get("mainTabs");
        var id = "tab$" + node.id;
        var tab = tabs.getTab(id);
        if (!tab) {
            tab = {};
            tab._nodeid = node.id;
            tab.name = id;
            tab.title = node.name;
            tab.showCloseButton = true;
            //这里拼接了url，实际项目，应该从后台直接获得完整的url地址
            tab.url = node.url;         //mini_JSPath + "../../docs/api/" + node.id + ".html";
            tabs.addTab(tab);
        }
        tabs.activeTab(tab);
    }

    function onNodeSelect(e) {
        //判断是不是叶节点
        var node = e.node;
        var isLeaf = e.isLeaf;

        if (isLeaf) {
            showTab(node);
        }
    }

    function onClick(e) {
        var text = this.getText();
        alert(text);
    }
    function onQuickClick(e) {
        tree.expandPath("datagrid");
        tree.selectNode("datagrid");
    }

    function onTabsActiveChanged(e) {
        var tabs = e.sender;
        var tab = tabs.getActiveTab();
        if (tab&&tab._nodeid) {

            var node = tree.getNode(tab._nodeid);
            if (node&&!tree.isSelectedNode(node)) {
                tree.selectNode(node);
            }
        }
    }
</script>

</body>
</html>