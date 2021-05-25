{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                用户列表
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">系统中所有用户的列表。</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <div class="col-lg-12 col-sm-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <p>
                            付费用户：{$user->paidUserCount()}
                        </p>
                        <p>显示表项:
                            {include file='table/checkbox.tpl'}
                        </p>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="form-group form-group-label mb-3">
                            <label class="form-label" for="quick_create"> 输入 email 快速创建新用户 </label>
                            <input class="form-control maxwidth-edit" id="quick_create" type="text">
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group form-group-label mb-2">
                                    <label class="form-label" for="new_user_add_shop">是否添加套餐</label>
                                    <select id="new_user_add_shop" class="form-control maxwidth-edit">
                                        <option value="0">不添加</option>
                                        {foreach $shops as $shop}
                                            <option value="{$shop->id}">{$shop->name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group form-group-label">
                                    <label class="form-label" for="new_user_money"> 用户余额「-1为按默认设置，其他为指定值」 </label>
                                    <input class="form-control maxwidth-edit" id="new_user_money" type="text"
                                        value="-1">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="d-grid gap-2">
                            <a id="quick_create_confirm" class="btn btn-primary btn-block">创建</a>
                        </div>

                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            {include file='table/table.tpl'}
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="delete_modal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">确认要删除？</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>请您确认。</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                <button type="button" id="delete_input" class="btn btn-primary" data-bs-dismiss="modal">确定</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="changetouser_modal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">确认要切换为该用户？</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                               <p>请您确认。</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                <button type="button" id="changetouser_input" class="btn btn-primary"
                                    data-bs-dismiss="modal">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='dialog.tpl'}
            </div>
        </div>
    </main>
                <!-- Footer -->
                <footer class="footer-admin mt-auto footer-light">
                    <div class="container-xl px-4">
                        <div class="row">
                            <div class="col-md-12 text-center small">&copy;{date("Y")} {$config['appName']} ©
                                Powered by <a href="/staff">SSPANEL</a>
                                {if $config['enable_analytics_code'] === true}{include file='analytics.tpl'}{/if}
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->
</div>

{include file='admin/footer.tpl'}

<script>
    function delete_modal_show(id) {
        deleteid = id;
        $("#delete_modal").modal();
    }

    function changetouser_modal_show(id) {
        changetouserid = id;
        $("#changetouser_modal").modal();
    }
    {include file='table/js_1.tpl'}
    window.addEventListener('load', () => {
        table_1 = $('#table_1').DataTable({
            order: [
                [1, 'asc']
            ],
            stateSave: true,
            serverSide: true,
            ajax: {
                url: "/admin/user/ajax",
                type: "POST",
            },
            columns: [
                {literal}
                    {"data": "op", "orderable": false},
                    {"data": "querys"},
                    {"data": "id"},
                    {"data": "user_name"},
                    {"data": "remark"},
                    {"data": "email"},
                    {"data": "money"},
                    {"data": "im_type"},
                    {"data": "im_value"},
                    {"data": "node_group"},
                    {"data": "expire_in"},
                    {"data": "class"},
                    {"data": "class_expire"},
                    {"data": "passwd"},
                    {"data": "port"},
                    {"data": "method"},
                    {"data": "protocol"},
                    {"data": "obfs"},
                    {"data": "obfs_param"},
                    {"data": "online_ip_count", "orderable": false},
                    {"data": "last_ss_time", "orderable": false},
                    {"data": "used_traffic"},
                    {"data": "enable_traffic"},
                    {"data": "last_checkin_time", "orderable": false},
                    {"data": "today_traffic"},
                    {"data": "enable"},
                    {"data": "reg_date"},
                    {"data": "reg_ip"},
                    {"data": "auto_reset_day"},
                    {"data": "auto_reset_bandwidth"},
                    {"data": "ref_by"},
                    {"data": "ref_by_user_name", "orderable": false},
                    {"data": "top_up", "orderable": false}
                {/literal}
            ],
            "columnDefs": [{
                targets: ['_all'],
                className: 'mdl-data-table__cell--non-numeric'
            }],
            {include file='table/lang_chinese.tpl'}
        });
        var has_init = JSON.parse(localStorage.getItem(`${ldelim}window.location.href{rdelim}-hasinit`));
        if (has_init !== true) {
            localStorage.setItem(`${ldelim}window.location.href{rdelim}-hasinit`, true);
        } else {
            {foreach $table_config['total_column'] as $key => $value}
                var checked = JSON.parse(localStorage.getItem(window.location.href + '-haschecked-checkbox_{$key}'));
                if (checked) {
                    $$.getElementById('checkbox_{$key}').checked = true;
                } else {
                    $$.getElementById('checkbox_{$key}').checked = false;
                }
            {/foreach}
        }
        {foreach $table_config['total_column'] as $key => $value}
            modify_table_visible('checkbox_{$key}', '{$key}');
        {/foreach}
        function delete_id() {
            $.ajax({
                type: "DELETE",
                url: "/admin/user",
                dataType: "json",
                data: {
                    id: deleteid
                },
                success: data => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        {include file='table/js_delete.tpl'}
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                error: jqXHR => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `${ldelim}jqXHR{rdelim} 发生了错误。`;
                }
            });
        }
        $$.getElementById('delete_input').addEventListener('click', delete_id);
        // $$.getElementById('search_button').addEventListener('click', () => {
        //     if ($$.getElementById('search') !== '') search();
        // });
        function changetouser_id() {
            $.ajax({
                type: "POST",
                url: "/admin/user/changetouser",
                dataType: "json",
                data: {
                    userid: changetouserid,
                    adminid: {$user->id},
                    local: '/admin/user'
                },
                success: data => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.setTimeout("location.href='/user'", {$config['jump_delay']});
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                error: jqXHR => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `${ldelim}jqXHR{rdelim} 发生了错误。`;
                }
            });
        }
        $$.getElementById('changetouser_input').addEventListener('click', changetouser_id);

        function quickCreate() {
            $.ajax({
                type: 'POST',
                url: '/admin/user/create',
                dataType: 'json',
                data: {
                    userEmail: $$getValue('quick_create'),
                    userMoney: $$getValue('new_user_money'),
                    userShop: $$getValue('new_user_add_shop')
                },
                success: data => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                    window.setTimeout("location.href='/admin/user'", 5000);
                },
                error: jqXHR => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `${ldelim}jqXHR{rdelim} 发生了错误。`;
                }
            })
        }
        $$.getElementById('quick_create_confirm').addEventListener('click', quickCreate)
    })
</script>
