{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                节点被封IP
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">这里是最近的节点上捕捉到的进行非法行为的IP。</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <div class="card shadow mb-4">
                <div class="card-body">
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
                    {include file='dialog.tpl'}
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <label class="form-label" for="ip">要解封的IP</label>
                </div>
                <div class="card-body">
                    <div class="form-group form-group-label">
                        <input class="form-control maxwidth-edit" id="ip" type="text">
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-grid gap-2">
                        <a class="btn btn-primary waves-attach" id="unblock"><span class="icon">check</span>&nbsp;解封</a>
                    </div>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <p>IP 归属地查询（Powered by <a href="https://skk.moe" target="_blank">Sukka</a>）</p>
                    <iframe src="https://find-ip.skk.moe"
                        allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr"
                        sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
                        style="width:100%;height:80px;border:0;border-radius:4px;overflow:hidden"></iframe>
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
    $("#unblock").click(function() {
        $.ajax({
            type: "POST",
            url: "/admin/unblock",
            dataType: "json",
            data: {
                ip: $$getValue('ip')
            },
            success: data => {
                if (data.ret) {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                    window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
                } else {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                }
                // window.location.reload();
            },
            error: jqXHR => {
                alert(`发生错误：${
                        jqXHR.status
                        }`);
            }
        })
    });
    window.addEventListener('load', () => {
        {include file='table/js_2.tpl'}
    });
</script>
