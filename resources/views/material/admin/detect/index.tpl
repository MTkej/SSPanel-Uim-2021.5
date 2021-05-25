{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                审计管理规则
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">系统中所有过滤规则。</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <div class="card mb-4">
                <div class="card-body">
                    显示表项: {include file='table/checkbox.tpl'}
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    {include file='table/table.tpl'}
                </div>
                <div class="card-footer">
                    <div class="d-grid gap-2">
                        <a class="btn btn-primary btn-block" href="/admin/detect/create">添加规则</a>

                    </div>
                </div>
            </div>
            <div aria-hidden="true" class="modal modal-va-middle fade" id="s" role="dialog" tabindex="-1">
                <div class="modal-dialog modal-xs">
                    <div class="modal-content">
                        <div class="modal-heading">
                            <a class="modal-close" data-dismiss="modal">×</a>
                            <h2 class="modal-title">确认要删除？</h2>
                        </div>
                        <div class="modal-inner">
                            <p>请您确认。</p>
                        </div>
                        <div class="modal-footer">
                            <p class="text-right">
                                <button class="btn btn-flat btn-brand-accent waves-attach waves-effect"
                                    data-dismiss="modal" type="button">取消
                                </button>
                                <button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal"
                                    id="delete_input" type="button">确定
                                </button>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
<div class="modal fade" id="delete_modal(1)" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete_modal">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
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
    {include file='table/js_1.tpl'}
    function delete_modal_show(id) {
        deleteid = id;
        $("#delete_modal").modal();
    }
    window.addEventListener('load', () => {
        {include file='table/js_2.tpl'}
        function delete_id() {
            $.ajax({
                type: "DELETE",
                url: "/admin/detect",
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
                    $$.getElementById('msg').innerHTML = `${ldelim}data.msg{rdelim} 发生错误了。`;
                }
            });
        }
        $$.getElementById('delete_input').addEventListener('click', () => {
            delete_id();
        });
    });
</script>
