{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                添加节点
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">编辑当前节点</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <form id="main_form">
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="card-inner">
                            <div class="mb-3">
                                <label class="form-label" for="name">节点名称</label>
                                <input class="form-control maxwidth-edit" id="name" type="text" name="name">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="server">节点地址</label>
                                <input class="form-control maxwidth-edit" id="server" type="text" name="server">
                                <div class="form-text">
                                如果填写为域名，“节点IP”会自动设置为解析的IP<br>
                                附加说明，适用于 SS 节点以及SS 中转，即 sort 为 0 或 10<br>
                                单个端口偏移格式：8.8.8.8;port=80#10080<br>
                                多个端口偏移格式：8.8.8.8;port=80#10080+443#10443<br>
                                重写节点入口地址：8.8.8.8;server=in.nodeserver.com<br>
                                以上两项同时使用：8.8.8.8;server=in.nodeserver.com|port=80#10080+443#10443
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="server">节点IP</label>
                                <input class="form-control maxwidth-edit" id="node_ip" name="node_ip" type="text">
                                 <div class="form-text">如果“节点地址”填写为域名，则此处的值会被忽视</div>

                            </div>
                            <div class="form-group form-group-label" hidden="hidden">
                                <label class="form-label" for="method">加密方式</label>
                                <input class="form-control maxwidth-edit" id="method" type="text" name="method"
                                    value="aes-256-cfb">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="rate">流量比例</label>
                                <input class="form-control maxwidth-edit" id="rate" type="text" name="rate" value="1">
                            </div>
                            <div class="mb-3" hidden="hidden">
                                <div class="checkbox switch">
                                    <label for="custom_method">
                                        <input class="access-hide" id="custom_method" type="checkbox"
                                            name="custom_method" checked="checked" disabled><span
                                            class="switch-toggle"></span>自定义加密
                                    </label>
                                </div>
                            </div>
                            <div class="mb-3" hidden="hidden">
                                <div class="checkbox switch">
                                    <label for="custom_rss">
                                        <input class="access-hide" id="custom_rss" type="checkbox" name="custom_rss"
                                            checked="checked" disabled><span class="switch-toggle"></span>自定义协议&混淆
                                    </label>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label mb-1" for="sort">单端口多用户启用</label>
                                <select id="mu_only" class="form-select maxwidth-edit" name="is_multi_user">
                                    <option value="0">只启用普通端口</option>
                                    <option value="-1">单端口多用户与普通端口并存</option>
                                    <option value="1">只启用单端口多用户</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <div class="form-check">
                                    <label class="form-label" for="type">是否显示</label>
                                    <input class="form-check-input" id="type" name="type" type="checkbox">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label for="status" class="form-label" for="status">节点状态</label>
                                        <input type="text" class="form-control" id="status" name="status" value="可用">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label class="form-label" for="sort">节点类型</label>
                                        <select id="sort" class="form-control maxwidth-edit" name="sort">
                                            <option value="0">Shadowsocks</option>
                                            <option value="9">Shadowsocks 单端口多用户</option>
                                            <option value="10">Shadowsocks 中转</option>
                                            <option value="11">V2Ray</option>
                                            <option value="12">V2Ray 中转</option>
                                            <option value="13">Shadowsocks V2Ray-Plugin&Obfs</option>
                                            <option value="14">Trojan</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="info">节点描述</label>
                                <input class="form-control maxwidth-edit" id="info" type="text" name="info" value="无描述">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label class="form-label" for="class">节点等级</label>
                                        <input class="form-control maxwidth-edit" id="class" type="text" value="0"
                                            name="class">
                                           <div class="form-text">不分级请填0，分级填写相应数字</div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label class="form-label" for="group">节点群组</label>
                                        <input class="form-control maxwidth-edit" id="group" type="text" value="0"
                                            name="group">
                                            <div class="form-text">分组为数字，不分组请填0</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label class="form-label" for="node_bandwidth_limit">节点流量上限（GB）</label>
                                        <input class="form-control maxwidth-edit" id="node_bandwidth_limit" type="text"
                                            value="0" name="node_bandwidth_limit">
                                           <div class="form-text"></div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label class="form-label" for="bandwidthlimit_resetday">节点流量上限清空日</label>
                                        <input class="form-control maxwidth-edit" id="bandwidthlimit_resetday"
                                            type="text" value="1" name="bandwidthlimit_resetday">
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="node_speedlimit">节点限速（Mbps）</label>
                                <input class="form-control maxwidth-edit" id="node_speedlimit" type="text" value="0"
                                    name="node_speedlimit">
                                    <div class="form-text">不限速填0，对于每个用户端口生效</div>
                            </div>

                        </div>
                    </div>
                    <div class="card-footer">
                    <div class="d-grid gap-2">
                     <button id="submit" type="submit" class="btn btn-primary btn-block">添加节点
                     </button>
                    </div>
                    </div>
                </div>
            </form>
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
    {literal}
        $('#main_form').validate({
            rules: {
                name: {required: true},
                method: {required: true},
                rate: {required: true},
                info: {required: true},
                group: {required: true},
                status: {required: true},
                node_speedlimit: {required: true},
                sort: {required: true},
                node_bandwidth_limit: {required: true},
                bandwidthlimit_resetday: {required: true}
            },
            submitHandler: () => {
                if ($$.getElementById('custom_method').checked) {
                    var custom_method = 1;
                } else {
                    var custom_method = 0;
                }

                if ($$.getElementById('type').checked) {
                    var type = 1;
                } else {
                    var type = 0;
                }
            {/literal}
            if ($$.getElementById('custom_rss').checked) {
                var custom_rss = 1;
            } else {
                var custom_rss = 0;
            }
            $.ajax({
                type: "POST",
                url: "/admin/node",
                dataType: "json",
                data: {
                    name: $$getValue('name'),
                    server: $$getValue('server'),
                    node_ip: $$getValue('node_ip'),
                    method: $$getValue('method'),
                    custom_method,
                    rate: $$getValue('rate'),
                    info: $$getValue('info'),
                    type,
                    group: $$getValue('group'),
                    status: $$getValue('status'),
                    node_speedlimit: $$getValue('node_speedlimit'),
                    sort: $$getValue('sort'),
                    class: $$getValue('class'),
                    node_bandwidth_limit: $$getValue('node_bandwidth_limit'),
                    bandwidthlimit_resetday: $$getValue('bandwidthlimit_resetday'),
                    custom_rss,
                    mu_only: $$getValue('mu_only')
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
                error: (jqXHR) => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `发生错误：${
                            jqXHR.status
                            }`;
                }
            });
        }
    });
</script>
