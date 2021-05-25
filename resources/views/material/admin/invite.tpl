{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                邀请与返利
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">公共邀请码功能已废弃，如需开放注册请在 .config.php 中将 register_mode 项目设置为 open</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <div class="card mb-4">
				<div class="card-body">
						<div class="form-group form-group-label mb-3">
							<label class="form-label" for="userid">需要修改邀请者的用户</label> <code>填写用户的ID</code>
							<input class="form-control maxwidth-edit" id="userid" type="text">
						</div>
						<div class="form-group form-group-label">
							<label class="form-label" for="refid">邀请者的ID</label> <code>ID为数字</code>
							<input class="form-control maxwidth-edit" id="refid" type="number">
						</div>
				</div>
					<div class="card-footer">
					    <div class="d-grid gap-2">
					        <a class="btn btn-primary" id="confirm">更 改</a>
					    </div>
					</div>
			</div>
            <div class="card mb-4">
                <div class="card-body">
                    <div class="card-inner">

                        <div class="form-group form-group-label mb-3">
                            <label class="form-label" for="uid">需要增加邀请链接数量的用户</label> <code>填写用户的ID，或者用户的完整邮箱</code>
                            <input class="form-control maxwidth-edit" id="uid" type="text">
                        </div>
                        <div class="form-group form-group-label">
                            <label class="form-label" for="prefix">邀请链接数量</label>
                            <input class="form-control maxwidth-edit" id="num" type="number">
                        </div>
                    </div>
                </div>
                    <div class="card-footer">
                        <div class="d-grid gap-2">
                            <a class="btn btn-primary" id="invite">增 加</a>
                        </div>
                    </div>
            </div>
            <div class="card">
            <div class="card-header">
            返利记录
            </div>
                <div class="card-body">

                        <p>显示表项: {include file='table/checkbox.tpl'}
                        </p>
                        <div class="card-table">
                            <div class="table-responsive">
                                {include file='table/table.tpl'}
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
    $$.getElementById('invite').addEventListener('click', () => {
        $.ajax({
            type: "POST",
            url: "/admin/invite",
            dataType: "json",
            data: {
                prefix: $$getValue('invite'),
                uid: $$getValue('uid'),
                num: $$getValue('num'),
            },
            success: data => {
                if (data.ret) {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                    window.setTimeout("location.href='/admin/invite'", {$config['jump_delay']} );
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
    })

    $$.getElementById('confirm').addEventListener('click', () => {
        $.ajax({
            type: "POST",
            url: "/admin/chginvite",
            dataType: "json",
            data: {
                prefix: $$.getElementById('confirm').value,
                userid: $$.getElementById('userid').value,
                refid: $$.getElementById('refid').value,
            },
            success: data => {
                if (data.ret) {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                    window.setTimeout("location.href='/admin/invite'", {$config['jump_delay']} );
                } else {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                }
                // window.location.reload();
            },
            error: jqXHR => {
                alert(`发生错误：${ldelim}jqXHR.status{rdelim}`);
            }
        })
    })

    window.addEventListener('load', () => {
        {include file='table/js_2.tpl'}
    });
</script>
