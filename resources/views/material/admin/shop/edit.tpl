{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                编辑商品
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">编辑{$shop->name}</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
                <div class="card">
                    <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label" for="name">名称</label>
                                <input class="form-control maxwidth-edit" id="name" type="text" value="{$shop->name}">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="price">价格</label>
                                <input class="form-control maxwidth-edit" id="price" type="text" value="{$shop->price}">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="auto_renew">自动续订天数</label>
                                <input class="form-control maxwidth-edit" id="auto_renew" type="text"
                                       value="{$shop->auto_renew}">
                                <div class="form-text">0为不允许自动续订，其他为到了那么多天之后就会自动从用户的账户上划钱抵扣</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="bandwidth">流量（GB）</label>
                                <input class="form-control maxwidth-edit" id="bandwidth" type="text"
                                       value="{$shop->bandwidth()}">
                            </div>
                            <div class="mb-3">
                                <div class="checkbox switch">
                                    <label for="auto_reset_bandwidth">
                                        <input {if $shop->auto_reset_bandwidth==1}checked{/if} class="access-hide"
                                               id="auto_reset_bandwidth" type="checkbox"><span
                                                class="switch-toggle"></span>续费时自动重置用户流量为上面这个流量值
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                            <div class="col-6 mb-3">
                                <label class="form-label" for="traffic-package-min">最低可购买用户等级</label>
                                <input class="form-control maxwidth-edit" id="traffic-package-min" type="text"
                                value="{if isset($shop->content['traffic_package'])}{$shop->content['traffic_package']['class']['min']}{else}0{/if}">
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label" for="traffic-package-max">最高可购买用户等级</label>
                                <input class="form-control maxwidth-edit" id="traffic-package-max" type="text"
                                value="{if $shop->content['traffic_package']}{$shop->content['traffic_package']['class']['max']}{else}0{/if}">
                            </div>
                            </div>
                            <div class="mb-3">
                                <div class="checkbox switch">
                                    <label for="traffic-package-enable">
                                        <input {if $shop->traffic_package()}checked{/if} class="access-hide" id="traffic-package-enable" type="checkbox">
                                        <span class="switch-toggle"></span>是否设置此商品为流量叠加包
                                    </label>
                                    <div class="form-text">设置为流量叠加包后除购买时获得流量外的设置无效</div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="expire">账户有效期天数</label>
                                <input class="form-control maxwidth-edit" id="expire" type="text"
                                       value="{$shop->expire()}">
                            </div>
                                                        <div class="row">
                                                            <div class="col-6 mb-3">
                                <label class="form-label" for="class">等级</label>
                                <input class="form-control maxwidth-edit" id="class" type="text"
                                       value="{$shop->user_class()}">
                            </div>
                             <div class="col-6 mb-3">
                                <label class="form-label" for="class_expire">等级有效期天数</label>
                                <input class="form-control maxwidth-edit" id="class_expire" type="text"
                                       value="{$shop->class_expire()}">
                            </div>
                                                        </div>
                                                        <div class="row">
                             <div class="col-6 mb-3">
                                <label class="form-label" for="reset_exp">多少天内</label>
                                <input class="form-control maxwidth-edit" id="reset_exp" type="number"
                                       value="{$shop->reset_exp()}">
                            </div>
                             <div class="col-6 mb-3">
                                <label class="form-label" for="reset">每多少天</label>
                                <input class="form-control maxwidth-edit" id="reset" type="number"
                                       value="{$shop->reset()}">
                            </div>
                                                        </div>
                            <div class="mb-3">
                                <label class="form-label" for="reset_value">重置流量为多少G</label>
                                <input class="form-control maxwidth-edit" id="reset_value" type="number"
                                       value="{$shop->reset_value()}">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="speedlimit">端口限速</label>
                                <input class="form-control maxwidth-edit" id="speedlimit" type="number"
                                       value="{$shop->speedlimit()}">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="connector">IP限制</label>
                                <input class="form-control maxwidth-edit" id="connector" type="number"
                                       value="{$shop->connector()}">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="content_extra">服务支持</label>
                                <input class="form-control maxwidth-edit" id="content_extra" type="text"
                                       value="{foreach $shop->content_extra() as $service}{$service[0]}-{$service[1]}{if $service@last}{else};{/if}{/foreach}">
                                <div class="form-text">例：check-全球节点分布;clear-快速客服响应，减号左边为icon代号右边为文字,以;隔开
                              icon代号参阅：<a
                                            href="https://material.io/tools/icons/?icon=clear&style=baseline">Material-icon</a>
                                </div>
                            </div>
                    </div>
                    <div class="card-footer">
                        <div class="d-grid gap-2">
                            <button id="submit" type="submit" class="btn btn-primary btn-block">保 存</button>
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
            if ($$.getElementById('auto_reset_bandwidth').checked) {
                var auto_reset_bandwidth = 1;
            } else {
                var auto_reset_bandwidth = 0;
            }
            let contentExtra = $$getValue('content_extra');
            if (contentExtra === '' || contentExtra === '-') {
                contentExtra = 'check-全球节点分布;check-快速客服响应;check-全平台客户端';
            }
            let data = {
                name: $$getValue('name'),
                auto_reset_bandwidth,
                price: $$getValue('price'),
                auto_renew: $$getValue('auto_renew'),
                bandwidth: $$getValue('bandwidth'),
                speedlimit: $$getValue('speedlimit'),
                connector: $$getValue('connector'),
                expire: $$getValue('expire'),
                class: $$getValue('class'),
                class_expire: $$getValue('class_expire'),
                reset: $$getValue('reset'),
                reset_value: $$getValue('reset_value'),
                reset_exp: $$getValue('reset_exp'),
                content_extra: contentExtra,
            }
            if ($$.getElementById('traffic-package-enable').checked) {
                data.traffic_package = {
                    class: {
                        min: $$getValue('traffic-package-min'),
                        max: $$getValue('traffic-package-max')
                    }
                }
            }
            $.ajax({
                type: "PUT",
                url: "/admin/shop/{$shop->id}",
                dataType: "json",
                data,
                success: data => {
                    if (data.ret) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        window.setTimeout("location.href='/admin/shop'", {$config['jump_delay']});
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
            if (event.keyCode === 13) {
                login();
            }
        });
        $$.getElementById('submit').addEventListener('click', submit);
    })
</script>
