{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                优惠码
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4"></div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <div class="card mb-4">
                <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label" for="prefix">优惠码</label> <span class="form-text">生成随机优惠码不填</span>
                            <input class="form-control maxwidth-edit" id="prefix" type="text">

                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="credit">优惠码额度</label> <span class="form-text">百分比，九折就填
                                10</span>
                            <input class="form-control maxwidth-edit" id="credit" type="text">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="expire">优惠码有效期(h)</label>
                            <input class="form-control maxwidth-edit" id="expire" type="number" value="1">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="shop">优惠码可用商品ID</label> <span
                                class="form-text">不填即为所有商品可用，多个的话用英文半角逗号分割</span>
                            <input class="form-control maxwidth-edit" id="shop" type="text">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="shop">优惠码每个用户可用次数，-1为无限次</label>
                            <input class="form-control maxwidth-edit" id="count" type="number" value="1">
                        </div>
                        <div class="mb-3">
                                <label class="form-label" for="sort">选择生成方式</label>
                                  <select id="generate-type" class="form-control maxwidth-edit" name="sort">
                                    <option value="1">指定字符</option>
                                    <option value="2">随机字符</option>
                                    <option value="3">指定字符+随机字符</option>
                                </select>
                        </div>
                </div>
                        <div class="card-footer">
                            <div class="d-grid gap-2">
                                <button id="coupon" type="submit" class="btn btn-primary btn-block">添加节点
                                </button>
                            </div>
                        </div>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                        <p>显示表项:
                            {include file='table/checkbox.tpl'}
                        </p>
                </div>
            </div>
            <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    {include file='table/table.tpl'}
                </div>
            </div>
            </div>
            {include file='dialog.tpl'}
        </section>
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
    window.addEventListener('load', () => {
        {include file='table/js_2.tpl'}

        $$.getElementById('coupon').addEventListener('click', () => {
            let couponCode = $$getValue('prefix');

            $.ajax({
                type: "POST",
                url: "/admin/coupon",
                dataType: "json",
                data: {
                    prefix: $$getValue('prefix'),
                    credit: $$getValue('credit'),
                    shop: $$getValue('shop'),
                    onetime: $$getValue('count'),
                    expire: $$getValue('expire'),
                    generate_type: $$getValue('generate-type'),
                },
                success: data => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                    if (data.ret) {
                        window.setTimeout("location.href='/admin/coupon'", {$config['jump_delay']});
                    }
                },
                error: jqXHR => {
                    alert(`发生错误：${
                            jqXHR.status
                            }`);
                }
            })
        })
    })
</script>
