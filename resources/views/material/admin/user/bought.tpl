{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                #{$user->id} [{$user->user_name}] 用户购买明细
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4"></div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
          <form id="main_form">
                    <div class="card mb-4">
                        <div class="card-body">
                               <div class="mb-3">
                                    <label class="form-label" for="buy_shop">选择套餐</label>
                                    <button id="buy_shop" class="form-control maxwidth-edit" name="buy_shop"
                                            data-toggle="dropdown">
                                        请选择套餐
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="buy_shop">
                                        {foreach $shops as $shop}
                                            <li>
                                                <a href="#" class="dropdown-option" onclick="return false;"
                                                   val="{$shop->id}" data="buy_shop">{$shop->name}</a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                                <div>
                                    <label class="form-label" for="buy_type">类型</label>
                                    <button id="buy_type" class="form-control maxwidth-edit" name="buy_type"
                                            data-toggle="dropdown" value="0">
                                        添加
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="buy_type">
                                        <li>
                                            <a href="#" class="dropdown-option" onclick="return false;" val="0"
                                               data="buy_type">添加</a>
                                        </li>
                                        <li>
                                            <a href="#" class="dropdown-option" onclick="return false;" val="1"
                                               data="buy_type">购买</a>
                                        </li>
                                    </ul>
                                </div>
                        </div>
                        <div class="card-footer">
                                       <div class="d-grid gap-2">
                                            <button id="submit" type="submit" class="btn btn-block btn-brand">添加
                                            </button>
                                        </div>
                        </div>
                </form>
        </div>
                <div class="card mb-4">
                    <div class="card-body">
                            <p>显示表项: {include file='table/checkbox.tpl'}</p>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-body table-responsive">
                    {include file='table/table.tpl'}
                </div>
                </div>
                <div aria-hidden="true" class="modal modal-va-middle fade" id="delete_modal" role="dialog"
                     tabindex="-1">
                    <div class="modal-dialog modal-xs">
                        <div class="modal-content">
                            <div class="modal-heading">
                                <a class="modal-close" data-dismiss="modal">×</a>
                                <h2 class="modal-title">确认要删除该条购买记录？</h2>
                            </div>
                            <div class="modal-inner">
                                <p>操作不可逆，请您确认。</p>
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

    window.addEventListener('load', () => {
        {include file='table/js_2.tpl'}
    });
    function delete_modal_show(id) {
        deleteid = id;
        $("#delete_modal").modal();
    }
    $$.getElementById('delete_input').addEventListener('click', delete_id);
    function delete_id() {
        $.ajax({
            type: "DELETE",
            url: "/admin/user/bought",
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
</script>

{literal}
<script>
    $('#main_form').validate({
        submitHandler: () => {
            $.ajax({
                type: "POST",
                url: "bought/buy",
                dataType: "json",
                {/literal}
                data: {
                    buy_shop: $$getValue('buy_shop'),
                    buy_type: $$getValue('buy_type'),
                    {literal}
                },
                success: (data) => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        {/literal}
                        window.setTimeout("window.location.reload()", {$config['jump_delay']});
                        {literal}
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                error: (jqXHR) => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `${
                            data.msg
                            } 发生错误了`;
                }
            });
        }
    });
</script>
{/literal}
