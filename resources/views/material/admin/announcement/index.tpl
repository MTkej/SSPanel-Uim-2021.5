{include file='admin/main.tpl'}

<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                公告管理
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">已发布公告列表。</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <div class="card shadow mb-4">
                <div class="card-body">
                    <p>显示表项: {include file='table/checkbox.tpl'}</p>
                </div>
            </div>
        </div>
        <div class="container-xl  px-4 mt-5">
            <div class="card mb-4">
                <div class="card-body">
                    <div class="table-responsive">
                        {include file='table/table.tpl'}
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-grid gap-2">
                        <a class="btn btn-primary btn-block"
                            href="/admin/announcement/create">添加公告</a>
                    </div>
                </div>
                <div aria-hidden="true" class="modal modal-va-middle fade" id="delete_modal" role="dialog"
                    tabindex="-1">
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
    {include file='table/js_1.tpl'}
    window.addEventListener('load', () => {
        {include file='table/js_2.tpl'}
        function delete_id() {
            $.ajax({
                type: "DELETE",
                url: "/admin/announcement",
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
        $$.getElementById('delete_input').addEventListener('click', delete_id);
    })
</script>
