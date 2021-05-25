{include file='admin/main.tpl'}
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/editor.md@1.5.0/css/editormd.min.css" />
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                查看工单
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">回复用户的工单</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <div class="col-lg-12 col-sm-12">
                <section class="content-inner margin-top-no">
                    <div class="card">
                        <div class="card-header">
                            <div class="form-group form-group-label">
                                <label class="form-label" for="content">内容</label>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="editormd">
                                <textarea style="display:none;" id="content"></textarea>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="form-group">
                                <div class="d-grid gap-2 d-md-block">
                                    <button id="submit" type="submit"
                                        class="btn btn-brand">添加</button>
                                    <button id="close" type="submit"
                                        class="btn btn-brand-accent">添加并关闭</button>
                                    <button id="close_directly" type="submit"
                                        class="btn btn-brand-accent">直接关闭</button>
                                    <button id="changetouser" class="btn btn-brand"
                                        onClick="changetouser_modal_show()" data-bs-toggle="modal"
                                        data-bs-target="#changetouser_modal">切换为该用户</button>
                                </div>
                            </div>
                        </div>
                    </div>


                                    <div class="modal fade" id="changetouser_modal" tabindex="-1" role="dialog"
                                        aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">确认要切换为该用户？</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>切换为该用户以后，你随时可以通过菜单底部的「返回管理员身份」按钮返回本条工单。</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">取消</button>
                                                    <button type="button" id="changetouser_input"
                                                        class="btn btn-primary" data-bs-dismiss="modal">确定</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                    <div class="fenye">
                    {$render}
                    </div>
                    {foreach $ticketset as $ticket}
                        <div class="card mb-3">
                            <div class="row g-0">
                                <div class="col col-sm-2 align-self-start">
                                            <img src="{$ticket->User()->gravatar}"
                                        class="rounded-circle img-thumbnail img-fluid mx-auto d-block mt-4">
                                        <p class="card-title text-center mt-2">用户: {$ticket->User()->user_name}</p>
                                        <p class="card-text  text-center mb-4"><small class="text-muted">{$ticket->datetime()}</small>
                                        </p>
                                </div>
                                <div class="col-sm-10">
                                    <div class="card-body">
                                        <p class="card-text">内容: <hr>{$ticket->content}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                    <div class="fenye">
                    {$render}
                    </div>
                    {include file='dialog.tpl'}
            </div>
        </div>
    </main>
</div>
{include file='admin/footer.tpl'}

<script src="https://cdn.jsdelivr.net/npm/editor.md@1.5.0/editormd.min.js"></script>
<script>
    function changetouser_modal_show() {
        $("#changetouser_modal").modal();
    }
    window.addEventListener('load', () => {
        function submit() {
            $("#result").modal();
            $$.getElementById('msg').innerHTML = `正在提交。`;
            $.ajax({
                type: "PUT",
                url: "/admin/ticket/{$id}",
                dataType: "json",
                data: {
                    content: editor.getHTML(),
                    status
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
        $$.getElementById('submit').addEventListener('click', () => {
            status = 1;
            submit();
        });
        $$.getElementById('close').addEventListener('click', () => {
            status = 0;
            submit();
        });
        $$.getElementById('close_directly').addEventListener('click', () => {
            status = 0;
            $("#result").modal();
            $$.getElementById('msg').innerHTML = `正在提交。`;
            $.ajax({
                type: "PUT",
                url: "/admin/ticket/{$id}",
                dataType: "json",
                data: {
                    content: '这条工单已被关闭',
                    status
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
        });

        function changetouser_id() {
            $.ajax({
                type: "POST",
                url: "/admin/user/changetouser",
                dataType: "json",
                data: {
                    userid: {$ticket->User()->id},
                    adminid: {$user->id},
                    local: '/admin/ticket/' + {$ticket->id} +'/view'
                },
                success: data => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.setTimeout("location.href='/user'", {$config['jump_delay']});
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
        $$.getElementById('changetouser_input').addEventListener('click', () => {
            changetouser_id();
        });
    });
    (() => {
        editor = editormd("editormd", {
            path: "https://cdn.jsdelivr.net/npm/editor.md@1.5.0/lib/", // Autoload modules mode, codemirror, marked... dependents libs path
            height: 450,
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
</script>
