{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                编辑节点
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
                                <input class="form-control maxwidth-edit" id="name" name="name" type="text"
                                    value="{$node->name}">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="sort2">节点排序</label>
                                <input class="form-control maxwidth-edit" id="sort2" type="text" name="sort2"
                                    value="{$node->sort2}">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="server">节点地址 <code><i class="fa fa-info-circle"></i>
                                        如果填写为域名，“节点IP”会自动设置为解析的IP
                                    </code></label>
                                <input class="form-control maxwidth-edit" id="server" name="server" type="text"
                                    value="{$node->server}">

                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="server">节点IP <code><i class="fa fa-info-circle"></i>
                                        如果“节点地址”填写为域名，则此处的值会被忽视
                                    </code></label>
                                <input class="form-control maxwidth-edit" id="node_ip" name="node_ip" type="text"
                                    value="{$node->node_ip}">

                            </div>
                            <div class="mb-3" hidden="hidden">
                                <label class="form-label" for="method">加密方式</label>
                                <input class="form-control maxwidth-edit" id="method" name="method" type="text"
                                    value="{$node->method}">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="rate">流量比例</label>
                                <input class="form-control maxwidth-edit" id="rate" name="rate" type="text"
                                    value="{$node->traffic_rate}">
                            </div>
                            <div class="mb-3" hidden="hidden">
                                <div class="checkbox switch">
                                    <label for="custom_method">
                                        <input {if $node->custom_method==1}checked{/if} class="access-hide"
                                            id="custom_method" name="custom_method" type="checkbox"><span
                                            class="switch-toggle"></span>自定义加密
                                    </label>
                                </div>
                            </div>
                            <div class="mb-3" hidden="hidden">
                                <div class="checkbox switch">
                                    <label for="custom_rss">
                                        <input {if $node->custom_rss==1}checked{/if} class="access-hide" id="custom_rss"
                                            type="checkbox" name="custom_rss"><span
                                            class="switch-toggle"></span>自定义协议&混淆
                                    </label>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label mb-1" for="sort">单端口多用户启用</label>
                                <select id="mu_only" class="form-select maxwidth-edit" name="is_multi_user">
                                    <option value="0" {if $node->mu_only==0}selected{/if}>单端口多用户与普通端口并存
                                    </option>
                                    <option value="-1" {if $node->mu_only==-1}selected{/if}>只启用普通端口</option>
                                    <option value="1" {if $node->mu_only==1}selected{/if}>只启用单端口多用户</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <div class="form-check">
                                    <label class="form-label" for="type">是否显示</label>
                                    <input {if $node->type==1}checked{/if} class="form-check-input" id="type"
                                        name="type" type="checkbox">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label" for="status">节点状态</label>
                                <input type="text" class="form-control" id="status" name="status"
                                    value="{$node->status}">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="sort">节点类型</label>
                                <select id="sort" class="form-select maxwidth-edit" name="sort">
                                    <option value="0" {if $node->sort==0}selected{/if}>Shadowsocks</option>
                                    <option value="1" {if $node->sort==1}selected{/if}>VPN/Radius基础</option>
                                    <option value="2" {if $node->sort==2}selected{/if}>SSH</option>
                                    <option value="5" {if $node->sort==5}selected{/if}>Anyconnect</option>
                                    <option value="9" {if $node->sort==9}selected{/if}>Shadowsocks 单端口多用户
                                    </option>
                                    <option value="10" {if $node->sort==10}selected{/if}>Shadowsocks 中转</option>
                                    <option value="11" {if $node->sort==11}selected{/if}>V2Ray</option>
                                    <option value="12" {if $node->sort==12}selected{/if}>V2Ray 中转</option>
                                    <option value="13" {if $node->sort==13}selected{/if}>Shadowsocks
                                        V2Ray-Plugin
                                    </option>
                                </select>
                            </div>
                        <div class="mb-3">
                            <label class="form-label" for="info">节点描述</label>
                            <input class="form-control maxwidth-edit" id="info" name="info" type="text"
                                value="{$node->info}">
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label" for="class">节点等级 <code><i class="fa fa-info-circle"></i>
                                            不分级请填0，分级填写相应数字</code></label>
                                    <input class="form-control maxwidth-edit" id="class" name="class" type="text"
                                        value="{$node->node_class}">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label" for="group">节点群组 <code><i class="fa fa-info-circle"></i>
                                            分组为数字，不分组请填0</code></label>
                                    <input class="form-control maxwidth-edit" id="group" name="group" type="text"
                                        value="{$node->node_group}">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="node_bandwidth_limit">节点流量上限（GB）</label>
                            <input class="form-control maxwidth-edit" id="node_bandwidth_limit"
                                name="node_bandwidth_limit" type="text"
                                value="{$node->node_bandwidth_limit/1024/1024/1024}">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="bandwidthlimit_resetday">节点流量上限清空日</label>
                            <input class="form-control maxwidth-edit" id="bandwidthlimit_resetday"
                                name="bandwidthlimit_resetday" type="text" value="{$node->bandwidthlimit_resetday}">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="node_speedlimit">节点限速（Mbps）<code><i
                                        class="fa fa-info-circle"></i> 不限速填0，对于每个用户端口生效</code></label>
                            <input class="form-control maxwidth-edit" id="node_speedlimit" name="node_speedlimit"
                                type="text" value="{$node->node_speedlimit}">
                        </div>

                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-grid gap-2">
                        <button id="submit" type="submit" class="btn btn-block btn-brand waves-attach waves-light">确认修改
                        </button>
                    </div>
                </div>
            </form>
            {include file='dialog.tpl'}
        </div>

        <main>
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

{literal}
    <script>
        $('#main_form').validate({
            rules: {
                name: {required: true},
                server: {required: true},
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
                type: "PUT",
                url: "/admin/node/{$node->id}",
                dataType: "json",
                {literal}
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
                        sort: $$getValue('sort'),
                        node_speedlimit: $$getValue('node_speedlimit'),
                        class: $$getValue('class'),
                        node_bandwidth_limit: $$getValue('node_bandwidth_limit'),
                        bandwidthlimit_resetday: $$getValue('bandwidthlimit_resetday')
                    {/literal},
                    custom_rss,
                    mu_only: $$getValue('mu_only')
                },
                success: (data) => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});

                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                    }
                },
                {literal}
                    error: (jqXHR) => {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = `发生错误：${jqXHR.status}`;
                    }
                });
            }
        });
    {/literal}
</script>
