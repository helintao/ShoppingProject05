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
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="true">添加用户</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit()" plain="true">修改用户信息</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="remove()" plain="true">删除用户</a>
        </div>
        <div class="wu-toolbar-search">
            <label>用户名称：</label><input id="wu-text" class="wu-text" style="width:100px">
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="findAdminForUserName()">开始搜索</a>
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
                <td width="60" align="right">用户名:</td>
                <td><input type="text" name="userName" class="wu-text easyui-validatebox"
                           data-options="required:true,missingMessage:'请填写用户名'"/></td>
            </tr>
            <tr>
                <td align="right">密码:</td>
                <td><input type="text" name="password" class="wu-text  easyui-validatebox"
                           data-options="required:true,missingMessage:'请填写密码'"/></td>
            </tr>
            <tr>
                <td align="right">邮箱:</td>
                <td><input type="text" name="email" class="wu-text"/></td>
            </tr>
            <tr>
                <td align="right">地址:</td>
                <td><input type="text" name="address" class="wu-text "/></td>
            </tr>
            <tr>
                <td align="right">手机:</td>
                <td><input type="text" name="phone" class="wu-text "/></td>
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
                <td width="60" align="right">用户名:</td>
                <td><input type="text" id="edit-userName" name="edit-userName" class="wu-text easyui-validatebox"
                           data-options="required:true,missingMessage:'请填写用户名'"/></td>
            </tr>
            <tr>
                <td align="right">密码:</td>
                <td><input type="text" id="edit-password" name="edit-password" class="wu-text  easyui-validatebox"
                           data-options="required:true,missingMessage:'请填写密码'"/></td>
            </tr>
            <tr>
                <td align="right">邮箱:</td>
                <td><input type="text" id="edit-email" name="edit-email" class="wu-text"/></td>
            </tr>
            <tr>
                <td align="right">地址:</td>
                <td><input type="text" id="edit-address" name="edit-address" class="wu-text "/></td>
            </tr>
            <tr>
                <td align="right">手机:</td>
                <td><input type="text" id="edit-phone" name="edit-phone" class="wu-text "/></td>
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
            $.messager.alert('信息提示', '请填写用户信息!');
            return;
        }
        //准备数据，对表单进行序列化，
        // 可以将表单的数据显示为name='我的菜单'&url='aaaa'&icon=ddd
        var data = $("#wu-form-2").serialize();

        //发起ajax请求
        $.ajax({
            url: 'addAdmin',//请求路径
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
            url: 'updateAdmin',
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
        $.messager.confirm('信息提示', '确定要删除该用户信息？', function (result) {
            if (result) {
                var items = $('#wu-datagrid-2').datagrid('getSelected');
                $.ajax({
                    url: 'deleteAdmin',
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
            title: "添加用户信息",
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
                $("#edit-userName").val(item.userName);
                $("#edit-password").val(item.password);
                $("#edit-email").val(item.email);
                $("#edit-address").val(item.address);
                $("#edit-phone").val(item.phone);
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
        url: 'toFindAllAdminList',
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
            {field: 'userName', title: '用户名', width: 100, sortable: true},
            {field: 'password', title: '密码', width: 180, sortable: true},
            {field: 'email', title: '邮箱', width: 100},
            {field: 'address', title: '地址', width: 100},
            {field: 'phone', title: '手机', width: 100},
        ]]
    });

    function findAdminForUserName() {
        var userName = $('#wu-text').val();
        $.ajax({
            url: 'findAdminForUserName',//请求路径
            data: {userName: userName},//向服务端提交的数据
            dataType: "json",//服务器端返回的数据类型
            type: "post",
            success: function (data) {
                if (data.type == 'success') {
                    $.messager.alert('信息提示', '查找成功！', 'info');
                    $('#wu-datagrid-2').treegrid('loadData',data);
                }
                else {
                    $.messager.alert('信息提示', data.msg, 'info');
                }
            }
        });
    }
</script>

