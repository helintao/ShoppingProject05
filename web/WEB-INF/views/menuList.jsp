<%--
  Created by IntelliJ IDEA.
  User: HLT
  Date: 2019/6/24
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar-2">
        <div class="wu-toolbar-button">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="true">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit()" plain="true">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="remove()" plain="true">删除</a>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancel()" plain="true">取消</a>--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="reload()" plain="true">刷新</a>--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-print" onclick="openAdd()" plain="true">打印</a>--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-help" onclick="openEdit()" plain="true">帮助</a>--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="remove()" plain="true">撤销</a>--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="cancel()" plain="true">重做</a>--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-sum" onclick="reload()" plain="true">总计</a>--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-back" onclick="reload()" plain="true">返回</a>--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-tip" onclick="reload()" plain="true">提示</a>--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-save" onclick="reload()" plain="true">保存</a>--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-cut" onclick="reload()" plain="true">剪切</a>--%>
        </div>
        <div class="wu-toolbar-search">
            <%--<label>起始时间：</label><input class="easyui-datebox" style="width:100px">--%>
            <%--<label>结束时间：</label><input class="easyui-datebox" style="width:100px">--%>
            <%--<label>用户组：</label>--%>
            <%--<select class="easyui-combobox" panelHeight="auto" style="width:100px">--%>
            <%--<option value="0">选择用户组</option>--%>
            <%--<option value="1">黄钻</option>--%>
            <%--<option value="2">红钻</option>--%>
            <%--<option value="3">蓝钻</option>--%>
            <%--</select>--%>
            <label>菜单名称：</label><input class="wu-text" style="width:100px">
            <a href="#" class="easyui-linkbutton" iconCls="icon-search">开始搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" class="easyui-treegrid" toolbar="#wu-toolbar-2"></table>
</div>
<!-- Begin of easyui-dialog 添加菜单-->
<div id="wu-dialog-2" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'"
     style="width:400px; padding:10px;">
    <form id="wu-form-2" method="post">
        <table>
            <tr>
                <td width="60" align="right">菜单名称:</td>
                <td><input type="text" name="name" class="wu-text easyui-validatebox"
                           data-options="required:true,missingMessage:'请填写菜单名称'"/></td>
            </tr>
            <tr>
                <td align="right">父级菜单:</td>
                <td><input type="text" name="parentId" class="wu-text"/></td>
            </tr>
            <tr>
                <td align="right">菜单URL:</td>
                <td><input type="text" name="url" class="wu-text"/></td>
            </tr>
            <tr>
                <td align="right">菜单图标:</td>
                <td><input type="text" name="icon" class="wu-text  easyui-validatebox"
                           data-options="required:true,missingMessage:'请选择菜单图标'"/></td>
            </tr>
        </table>
    </form>
</div>
<!-- Begin of easyui-dialog 修改菜单-->
<div id="edit-dialog-2" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'"
     style="width:400px; padding:10px;">
    <form id="edit-form-2" method="post">
        <input type="hidden" id="edit-id" name="id"/>
        <table>
            <tr>
                <td width="60" align="right">菜单名称:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox"
                           data-options="required:true,missingMessage:'请填写菜单名称'"/></td>
            </tr>
            <tr>
                <td align="right">父级菜单:</td>
                <td><input type="text" id="edit-parentId" name="parentId" class="wu-text"/></td>
            </tr>
            <tr>
                <td align="right">菜单URL:</td>
                <td><input type="text" id="edit-url" name="url" class="wu-text"/></td>
            </tr>
            <tr>
                <td align="right">菜单图标:</td>
                <td><input type="text" id="edit-icon" name="icon" class="wu-text  easyui-validatebox"
                           data-options="required:true,missingMessage:'请选择菜单图标'"/></td>
            </tr>
        </table>
    </form>
</div>

<!-- End of easyui-dialog -->
<script type="text/javascript">
    /**
     * Name 添加记录
     */
    function add() {

        //对表单进行验证
        var validate = $("#wu-form-2").form("validate");
        if (!validate) {
            $.messager.alert('信息提示', '请填写菜单信息!');
            return;
        }
        //准备数据，对表单进行序列化，
        // 可以将表单的数据显示为name='我的菜单'&url='aaaa'&icon=ddd
        var data = $("#wu-form-2").serialize();

        //发起ajax请求
        $.ajax({
            url: 'addMenu',//请求路径
            data: data,//向服务端提交的数据
            dataType: "json",//服务器端返回的数据类型
            type: "post",
            success: function (data) {
                if (data.type == 'success') {
                    $.messager.alert('信息提示', '添加菜单成功！', 'info');
                    $('#wu-datagrid-2').treegrid("reload");
                    $('#wu-dialog-2').dialog('close');
                }
                else {
                    $.messager.alert('信息提示', '添加失败！', 'info');
                }
            }
        });
    }

    /**
     * Name 修改记录
     */
    function edit() {
        var data = $("#edit-form-2").serialize();
        $.ajax({
            url: 'upDateMenu',
            data: data,
            dataType: "json",
            type: 'post',
            success: function (data) {
                if (data.type == 'success') {
                    $.messager.alert('信息提示', '提交成功！', 'info');
                    $('#wu-datagrid-2').treegrid("reload");
                    $('#edit-dialog-2').dialog('close');
                }
                else {
                    $.messager.alert('信息提示', data.msg, 'info');
                }
            }
        });
    }

    /**
     * Name 删除记录
     */
    function remove() {
        $.messager.confirm('信息提示', '确定要删除该记录？', function (result) {
            if (result) {
                var items = $('#wu-datagrid-2').datagrid('getSelected');
                $.ajax({
                    url: 'delete',
                    data: {id: items.id},
                    dataType: 'json',
                    type: 'post',
                    success: function (data) {
                        if (data.type == 'success') {
                            $.messager.alert('信息提示', '删除成功！', 'info');
                            $('#wu-datagrid-2').treegrid("reload");
                        }
                        else {
                            $.messager.alert('信息提示', data.msg, 'info');
                        }
                    }
                });
            }
        });
    }

    /**
     * Name 打开添加窗口
     */
    function openAdd() {

        $('#wu-form-2').form('clear');
        $('#wu-dialog-2').dialog({
            closed: false,
            modal: true,
            title: "添加菜单信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#wu-dialog-2').dialog('close');
                }
            }]
        });
    }

    /**
     * Name 打开修改窗口
     */
    function openEdit() {
        $('#edit-form-2').form('clear');
        var item = $('#wu-datagrid-2').datagrid('getSelected');
        if (item == null || item == 0) {
            $.messager.alert('信息提示', '请选择数据项！', 'info');
            return;
        }

        $('#edit-dialog-2').dialog({
            closed: false,
            modal: true,
            title: "修改信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog-2').dialog('close');
                }
            }],
            onBeforeOpen: function () {
                $("#edit-id").val(item.id);
                $("#edit-name").val(item.name);
                $("#edit-parentId").val(item.parentId);
                $("#edit-url").val(item.url);
                $("#edit-icon").val(item.icon);
            }
        });
    }

    /**
     * Name 分页过滤器
     */
    function pagerFilter(data) {
        if (typeof data.length == 'number' && typeof data.splice == 'function') {// is array
            data = {
                total: data.length,
                rows: data
            }
        }
        var dg = $(this);
        var opts = dg.datagrid('options');
        var pager = dg.datagrid('getPager');
        pager.pagination({
            onSelectPage: function (pageNum, pageSize) {
                opts.pageNumber = pageNum;
                opts.pageSize = pageSize;
                pager.pagination('refresh', {pageNumber: pageNum, pageSize: pageSize});
                dg.datagrid('loadData', data);
            }
        });
        if (!data.originalRows) {
            data.originalRows = (data.rows);
        }
        var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
        var end = start + parseInt(opts.pageSize);
        data.rows = (data.originalRows.slice(start, end));
        return data;
    }

    /**
     * Name 载入数据
     */
    $('#wu-datagrid-2').treegrid({
        url: 'findMenuList',
        rownumbers: true,
        singleSelect: true,
        pageSize: 20,
        pagination: true,
        multiSort: true,
        fitColumns: true,
        idField: 'id',
        treeField: 'name',
        fit: true,
        columns: [[
            {field: 'name', title: '菜单名称', width: 100, sortable: true},
            {field: 'parentId', title: '上级菜单', width: 180, sortable: true},
            {field: 'url', title: '菜单路径', width: 100},
            {field: 'icon', title: '菜单图标', width: 100},
        ]]
    });
</script>
