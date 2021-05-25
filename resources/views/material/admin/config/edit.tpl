{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                配置编辑 #{$edit_config->id}
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4"></div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
                <div class="card">
                    <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label" for="key">配置名</label>
                                <input class="form-control maxwidth-edit" id="key" type="text" value="{$edit_config->key}" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="name">配置名称</label>
                                <input class="form-control maxwidth-edit" id="name" type="text" value="{$edit_config->name}" readonly>
                            </div>
                        {if $edit_config->comment!=''}
                            <div class="mb-3">
                                <label class="form-label" for="comment">配置描述</label>
                                <textarea class="form-control maxwidth-edit" id="comment" rows="4" readonly>{$edit_config->comment}</textarea>
                            </div>
                        {/if}
                        {if strpos($edit_config->key,'.bool.') === false}
                            <div class="mb-3">
                                <label class="form-label" for="value">配置值</label>
                                <textarea class="form-control maxwidth-edit" id="value" rows="5">{$edit_config->getValue()}</textarea>
                            </div>
                        {else}
                            <div class="mb-3">
                                    <label class="form-label" for="value">配置开关</label>
                                    <select id="value" class="form-control maxwidth-edit" name="value">
                                        <option value="0" {if !$edit_config->getValue()}selected{/if}>关闭</option>
                                        <option value="1" {if $edit_config->getValue()}selected{/if}>开启</option>
                                    </select>

                            </div>
                        {/if}
                        </div>

                    <div class="card-footer">
                                    <div class="d-grid gap-2">
                                        <button id="submit" type="submit"
                                                class="btn btn-primary btn-block">修改
                                        </button>
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
    window.addEventListener('load', () => {
        function submit() {
            $.ajax({
                type: "PUT",
                url: "/admin/config/update/{$edit_config->key}",
                dataType: "json",
                data: {
                    value: $$getValue('value')
                },
                success: data => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                error: jqXHR => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `发生错误：${
                        jqXHR.status
                    }`;
                }
            });
        }
        $("html").keydown(event => {
            if (event.keyCode == 13) {
                submit();
            }
        });
        $$.getElementById('submit').addEventListener('click', submit);
    })
</script>
