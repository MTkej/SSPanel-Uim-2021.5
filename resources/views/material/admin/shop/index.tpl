{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                商品列表
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">系统中所有商品的列表。</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <div class="card mb-4">
                <div class="card-body">
                    <p>显示表项:
                        {include file='table/checkbox.tpl'}
                    </p>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        {include file='table/table.tpl'}
                    </div>
                </div>
                <!-- Button trigger modal -->
                <div class="modal fade" id="delete_modal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">确认要下架？</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>提示：下架会关闭所有购买过的此套餐的自动续费！</p>
                                <p>请您确认。</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-primary" id="delete_input">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-grid gap-2">
                        <a class="btn btn-primary btn-block" href="/admin/shop/create">添加商品</a>
                    </div>
                </div>
            </div>
            {include file='dialog.tpl'}
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
    {include file='table/js_1.tpl'}
    window.addEventListener('load', () => {
        table_1 = $('#table_1').DataTable({
            ajax: {
                url: '{$table_config['ajax_url']}',
                type: "POST"
            },
            processing: true,
            order: [
                [2, 'desc']
            ],
            stateSave: true,
            columnDefs: [{
                targets: ['_all'],
                className: 'mdl-data-table__cell--non-numeric'
            }],
            columns: [
                {foreach $table_config['total_column'] as $key => $value}
                    {
                        "data": "{$key}"
                    },
                {/foreach}
            ],
            {include file='table/lang_chinese.tpl'}
        })
        var has_init = JSON.parse(localStorage.getItem(`${ldelim}window.location.href{rdelim}-hasinit`));
        if (has_init !== true) {
            localStorage.setItem(`${ldelim}window.location.href{rdelim}-hasinit`, true);
        } else {
            {foreach $table_config['total_column'] as $key => $value}
                var checked = JSON.parse(localStorage.getItem(`${ldelim}window.location.href{rdelim}-haschecked-checkbox_{$key}`));
                if (checked == true) {
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
                url: "/admin/shop",
                dataType: "json",
                data: {
                    id: deleteid
                },
                success: data => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        $$.getElementById(`row_delete_${ldelim}deleteid{rdelim}`).setAttribute('disabled', 'true')
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                error: jqXHR => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `${ldelim}data.msg{rdelim} 发生了错误。`;
                }
            });
        }
        $$.getElementById('delete_input').addEventListener('click', delete_id);
    })
</script>
