{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                注册设置
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">注册设置</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <section class="content-inner margin-top-no">
                <div class="card mb-4">
                    <div class="card-body">
                            <div class="form-group form-group-label mb-4">
                                <input class="form-control maxwidth-edit" id="name" type="text" value="{$edit_config->name}" readonly>
                            </div>
                            <div class="form-group form-group-label">
                                    <select id="value" class="form-control maxwidth-edit" name="value">
                                        {$value = $edit_config->getValue()}
                                        <option value="open" {if $value == 'open'}selected{/if}>开启</option>
                                        <option value="close" {if $value == 'close'}selected{/if}>关闭</option>
                                        <option value="invite" {if $value == 'invite'}selected{/if}>仅限邀请码</option>
                                    </select>
                            </div>
                    </div>
                    <div class="card-footer">
                      <div class="d-grid gap-2">
                     <button id="submit" type="submit" class="btn btn-block btn-brand waves-attach waves-light">修 改
                     </button>
                      </div>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-body">
                            <p>显示表项: {include file='table/checkbox.tpl'}</p>
                    </div>
                </div>
                                <div class="card mb-4">
                                    <div class="card-body">
                <div class="table-responsive">
                    {include file='table/table.tpl'}
                </div>
                                    </div>
                                </div>
                {include file='dialog.tpl'}
    </div>
</main>

{include file='admin/footer.tpl'}

<script>
    {include file='table/js_1.tpl'}
    window.addEventListener('load', () => {
        {include file='table/js_2.tpl'}
    });
</script>
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
                        window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
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
