{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                               编辑公告 #{$ann->id}
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">请采用 Markdown 语法编写</div>
                    </div>
                </div>
            </div>
        </header>
     <div class="container-xl px-4 mt-n10">
        <div class="col-lg-12 col-md-12">
            <section class="content-inner margin-top-no">
                <div class="card">
                    <div class="card-header">
                   内容
                    </div>
                    <div class="card-body">
                            <div class="form-group form-group-label">
                                <link rel="stylesheet"
                                      href="https://cdn.jsdelivr.net/npm/editor.md@1.5.0/css/editormd.min.css"/>
                                <div id="editormd">
                                    <textarea style="display:none;" id="content">{$ann->markdown}</textarea>
                                </div>
                            </div>
                    </div>
                    <div class="card-footer">
                     <div class="d-grid gap-2">
                      <button id="submit" type="submit" class="btn btn-primary btn-block">确认修改
                      </button>
                      </div>
                    </div>
                </div>
                {include file='dialog.tpl'}
            </section>
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
            saveHTMLToTextarea: true,
            emoji: true
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
        function submit() {
            $.ajax({
                type: "PUT",
                url: "/admin/announcement/{$ann->id}",
                dataType: "json",
                data: {
                    content: editor.getHTML(),
                    markdown: editor.getMarkdown()
                },
                success: data => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
                    } else {
                        $("#result").modal();
                        document.getElementById('msg').innerHTML = data.msg;
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
        $$.getElementById('submit').addEventListener('click', submit);
    });
</script>
