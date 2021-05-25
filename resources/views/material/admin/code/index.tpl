{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                充值码{if $config['enable_donate']===true}与捐赠{/if}管理
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">编辑当前节点</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <div class="card mb-4">
                <div class="card-header">
                    系统中金额流转记录。
                </div>
                <div class="card-body">
                    <div class="card-inner mb-3">
                        <span class="badge badge-md bg-primary">今日流水：￥{$user->calIncome("today")}</span>
                        <span class="badge badge-md bg-secondary">昨日流水：￥{$user->calIncome("yesterday")}</span>
                        <span class="badge badge-md bg-success">本月流水：￥{$user->calIncome("this month")}</span>
                        <span class="badge badge-md bg-info">上月流水：￥{$user->calIncome("last month")}</span>
                        <span class="badge badge-md bg-warning text-dark">总共流水：￥{$user->calIncome("total")}</span>
                    </div>
                    <p>显示表项:
                        {include file='table/checkbox.tpl'}
                    </p>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <div class="table-responsive">
                        {include file='table/table.tpl'}
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="justify-content-end">
                        <div class="btn-group mx-auto" role="group" aria-label="Basic example">
                            <a class="btn btn-primary" href="/admin/code/create">充值码</a>
                            {if $config['enable_donate']===true}
                                <a class="btn btn-primary" href="/admin/donate/create">捐赠和支出</a>
                            {/if}
                        </div>
                    </div>
                </div>
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
    {include file='table/js_1.tpl'}
    $(document).ready(function() {
        {include file='table/js_2.tpl'}
    });
</script>
