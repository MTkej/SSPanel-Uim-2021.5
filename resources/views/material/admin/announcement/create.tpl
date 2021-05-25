{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                添加公告
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">请采用 Markdown 语法编写</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <div class="col-lg-12 col-md-12">
                <div class="card mb-4">
                    <div class="card-header">
                        内容
                    </div>
                    <div class="card-body">
                        <div class="form-group form-group-label">
                            <link rel="stylesheet"
                                href="https://cdn.jsdelivr.net/npm/editor.md@1.5.0/css/editormd.min.css" />
                            <div id="editormd">
                                <textarea style="display:none;" id="content"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group form-group-label">
                                        <label class="form-label mb-3" for="vip">VIP等级</label> <code>发送给等于或高于这个等级的用户
                                            0为不分级</code>
                                        <input class="form-control maxwidth-edit" id="vip" type="text" name="vip">
                                        <div class="checkbox switch mt-3">
                                            <input class="form-check-input " id="issend" name="issend" type="checkbox">
                                            <label class="form-label " for="issend">是否发送邮件</label>
                                        </div>
                                        <div class="checkbox switch">
                                            <input class="form-check-input" id="PushBear" name="PushBear"
                                                type="checkbox">
                                            <label class="form-label" for="PushBear">是否使用PushBear</label>
                                            <code>向关注了二维码的用户以微信方式推送消息</code>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="d-grid gap-2">
                            <button id="submit" type="submit" class="btn btn-primary btn-block">添加
                            </button>
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

<script src="https://cdn.jsdelivr.net/npm/editor.md@1.5.0/editormd.min.js"></script>
<script>
    (() => {
        editor = editormd("editormd", {
            path: "https://cdn.jsdelivr.net/npm/editor.md@1.5.0/lib/", // Autoload modules mode, codemirror, marked... dependents libs path
            height: 720,
            saveHTMLToTextarea: true
        });
        /*
        // or
        var editor = editormd({
            id   : "editormd",
            path : "../lib/"
        });
        */
    })();
    window.addEventListener('load', () => {
        function submit(page = -1) {
            if ($$.getElementById('issend').checked) {
                var issend = 1;
            } else {
                var issend = 0;
            }
            if ($$.getElementById('PushBear').checked) {
                var PushBear = 1;
            } else {
                var PushBear = 0;
            }
            if (page === -1) {
                sedPage = 1;
            } else {
                sedPage = page;
                var PushBear = 0;
            }
            $.ajax({
                type: "POST",
                url: "/admin/announcement",
                dataType: "json",
                data: {
                    content: editor.getHTML(),
                    markdown: $('.editormd-markdown-textarea').val(),
                    vip: $$getValue('vip'),
                    issend,
                    PushBear,
                    page: sedPage
                },
                success: data => {
                    if (data.ret === 1) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
                    } else if (data.ret === 2) {
                        submit(data.msg);
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
        $$.getElementById('submit').addEventListener('click', () => {
            submit();
        });
    });
</script>
