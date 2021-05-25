{include file='admin/main.tpl'}
<div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                汇总
                            </h1>
                        </div>
                        <div class="col-12 col-xl-auto mt-4">下面是系统运行情况简报。</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-n10">
            <div class="row">
                <div class="col-xl-3 col-md-6 mb-4">
                    <!-- Dashboard info widget 1-->
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-grow-1">
                                    <div class="small fw-bold text-primary mb-1">今日流水</div>
                                    <div class="h5">￥{$user->calIncome("today")}</div>
                                    <div class="text-xs fw-bold text-success d-inline-flex align-items-center">
                                    {if {$user->calIncome("today")} > $user->calIncome("yesterday")}
                                            <i class="me-1" data-feather="trending-up"></i>
                                        {elseif $user->calIncome("today") < $user->calIncome("yesterday")}
                                            <i class="me-1" data-feather="trending-down"></i>
                                        {elseif $user->calIncome("today") == $user->calIncome("yesterday")}
                                            <i class="me-1" data-feather="minus"></i>
                                          {/if}
                                        昨日流水:￥{$user->calIncome("yesterday")}

                                    </div>
                                </div>
                                <div class="ms-2"><i data-feather="dollar-sign" class="fa-2x text-gray-200"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <!-- Dashboard info widget 2-->
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-grow-1">
                                    <div class="small fw-bold text-secondary mb-1">本月流水</div>
                                    <div class="h5">￥{$user->calIncome("this month")}</div>
                                    <div class="text-xs fw-bold text-danger d-inline-flex align-items-center">
                                          {if {$user->calIncome("this month")} > $user->calIncome("last month")}
                                              <i class="me-1" data-feather="trending-up"></i>
                                          {elseif $user->calIncome("this month") < $user->calIncome("last month")}
                                              <i class="me-1" data-feather="trending-down"></i>
                                          {elseif $user->calIncome("this month") == $user->calIncome("last month")}
                                              <i class="me-1" data-feather="minus"></i>
                                          {/if}
                                        上月流水:￥{$user->calIncome("last month")}
                                    </div>
                                </div>
                                <div class="ms-2"><i data-feather="dollar-sign" class="fa-2x text-gray-200"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <!-- Dashboard info widget 3-->
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-grow-1">
                                    <div class="small fw-bold text-success mb-1">付费用户：</div>
                                    <div class="h5">{$user->paidUserCount()}</div>
                                    <div class="text-xs fw-bold text-success d-inline-flex align-items-center">
                                        <i class="me-1" data-feather="minus"></i>
                                        总用户:{$user->count()}
                                    </div>
                                </div>
                                <div class="ms-2"><i data-feather="users" class="fa-2x text-gray-200"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <!-- Dashboard info widget 4-->
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-grow-1">
                                    <div class="small fw-bold text-info mb-1">总转换率：</div>
                                    <div class="h5">1.23%</div>
                                    <div class="text-xs fw-bold text-danger d-inline-flex align-items-center">
                                        <i class="me-1" data-feather="minus"></i>
                                            {round($user->paidUserCount()/$user->count()*100,2)}%
                                    </div>
                                </div>
                                <div class="ms-2"><i data-feather="percent" class="fa-2x text-gray-200"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4 mb-4">
                    <!-- Progress card example-->
                    <div class="card bg-primary border-0">
                        <div class="card-body">
                            <h5 class="text-white-50">总流水</h5>
                            <div class="mb-4">
                                <span class="display-4 text-white">￥{$user->calIncome("total")}</span>
                            </div>
                            <div class="progress bg-white-25 rounded-pill" style="height: 0.5rem">
                                <div class="progress-bar bg-white w-75 rounded-pill" role="progressbar"
                                    aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                    <!-- Report summary card example-->
                    <div class="card mt-4">
                        <div class="card-header">用户签到情况(总用户{$sts->getTotalUser()}人)</div>
                        <div class="list-group list-group-flush small">
                            <span class="list-group-item list-group-item-action">没有签到过的用户
                                {number_format((1-($sts->getCheckinUser()/$sts->getTotalUser()))*100,2)}%
                                {$sts->getTotalUser()-$sts->getCheckinUser()}人
                            </span>
                            <span class="list-group-item list-group-item-action">曾经签到过的用户
                                {number_format((($sts->getCheckinUser()-$sts->getTodayCheckinUser())/$sts->getTotalUser())*100,2)}%
                                {$sts->getCheckinUser()-$sts->getTodayCheckinUser()}人
                            </span>
                            <span class="list-group-item list-group-item-action">
                                今日签到用户 {number_format($sts->getTodayCheckinUser()/$sts->getTotalUser()*100,2)}%
                                {$sts->getTodayCheckinUser()}人
                            </span>
                        </div>
                        <div class="card-footer position-relative border-top-0">
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 mb-4">
                    <!-- Area chart example-->
                    <div class="card mb-4">
                        <div class="card-header">用户在线情况(总用户 {$sts->getTotalUser()}人)</div>
                        <div class="card-body">
                            <div>
                                <canvas id="myChart" width="400" height="400"></canvas>
                                <script>
                                    var ctx = document.getElementById('myChart').getContext('2d');
                                    var myChart = new Chart(ctx, {
                                        type: 'bar',
                                        data: {
                                            labels: ['从未在线的用户', '一天以前在线的用户', '一天内在线的用户', '2天以前在线的用户',
                                                '3天以前在线的用户', '4天以前在线的用户',
                                                '5天以前在线的用户'
                                            ],
                                            datasets: [{
                                                data: [
                                                    {(($sts->getUnusedUser()))},
                                                    {($sts->getTotalUser()-$sts->getOnlineUser(86400)-$sts->getUnusedUser())},
                                                    {($sts->getOnlineUser(86400)-$sts->getOnlineUser(3600))},
                                                    {($sts->getTotalUser()-$sts->getOnlineUser(172800)-$sts->getUnusedUser())},
                                                    {($sts->getTotalUser()-$sts->getOnlineUser(259200)-$sts->getUnusedUser())},
                                                    {($sts->getTotalUser()-$sts->getOnlineUser(345600)-$sts->getUnusedUser())},
                                                    {($sts->getTotalUser()-$sts->getOnlineUser(432000)-$sts->getUnusedUser())}
                                                ],
                                                backgroundColor: [
                                                    '#5e55fb',
                                                    '#6900c7',
                                                    '#00ac69',
                                                    '#00cfd5',
                                                    '#f4a100',
                                                    '#e81500'
                                                ],
                                                borderWidth: 0,
                                                borderRadius: 10
                                            }]
                                        },
                                        options: {
                                            maintainAspectRatio: false,
                                            plugins: {
                                                legend: false,
                                            },
                                            responsive: true,
                                            scales: {
                                                y: {
                                                    display: false,
                                                    grid: {
                                                        display: false,
                                                    },
                                                }
                                            }
                                        }
                                    });
                                </script>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <!-- Bar chart example-->
                            <div class="card h-100">
                                <div class="card-header">流量使用情况 (总分配流量 {$sts->getTotalTraffic()})</div>
                                <div class="card-body d-flex justify-content-center">
                                    <div class="chart-bar">
                                        <canvas id="onlinetraffic" width="400" height="100"></canvas>
                                        <script>
                                            var ctx = document.getElementById('onlinetraffic').getContext('2d');
                                            var myChart = new Chart(ctx, {
                                                type: 'doughnut',
                                                data: {
                                                    labels: ['剩于可用{(($sts->getUnusedTrafficUsage()))}',
                                                    '过去已用{(($sts->getLastTrafficUsage()))}', '今日已用{(($sts->getTodayTrafficUsage()))}'],
                                                    datasets: [{
                                                        data: [
                                                            {if $sts->getRawTotalTraffic()!=0}
                                                                {number_format((($sts->getRawUnusedTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)},{number_format((($sts->getRawLastTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)},{number_format((($sts->getRawTodayTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}
                                                            {/if}
                                                        ],
                                                        backgroundColor: [
                                                            'rgba(94,85,251, 1)',
                                                            'rgba(105,0,199, 1)',
                                                            'rgba(0,172,105, 1)'
                                                        ],
                                                        borderColor: [
                                                            'rgba(94,85,251, 1)',
                                                            'rgba(105,0,199, 1)',
                                                            'rgba(0,172,105, 1)'
                                                        ],
                                                        hoverOffset: 1,
                                                        borderWidth: 1
                                                    }]
                                                },
                                                options: {
                                                    maintainAspectRatio: false,
                                                    scales: {
                                                        x: {
                                                            display: false,
                                                            grid: {
                                                                display: false,
                                                            }
                                                        },
                                                        y: {
                                                            display: false,
                                                            grid: {
                                                                display: false
                                                            }
                                                        }
                                                    }
                                                }
                                            });
                                        </script>
                                    </div>
                                </div>
                                <div class="card-footer position-relative">
                                    <a class="stretched-link" href="#!">
                                        <div class="text-xs d-flex align-items-center justify-content-between">
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <!-- Pie chart example-->
                            <div class="card h-100">
                                <div class="card-header">节点在线情况 (节点数 {$sts->getTotalNodes()}个)</div>
                                <div class="card-body d-flex justify-content-center">
                                    <div class="chart-bar">
                                        <canvas id="onlinenodes" width="400" height="100"></canvas>
                                        <script>
                                            var ctx = document.getElementById('onlinenodes').getContext('2d');
                                            var myChart = new Chart(ctx, {
                                                type: 'doughnut',
                                                data: {
                                                    labels: [
                                                        {if $sts->getTotalNodes()!=0}
                                                            在线节点 {$sts->getAliveNodes()} 个,
                                                            离线节点 {$sts->getTotalNodes()-$sts->getAliveNodes()} 个
                                                        {else}
                                                            '在线节点', '离线节点'
                                                        {/if}
                                                    ],
                                                    datasets: [{
                                                        data: [
                                                            {if $sts->getTotalNodes()!=0}
                                                                {$sts->getAliveNodes()},{$sts->getTotalNodes()-$sts->getAliveNodes()}
                                                            {else}
                                                                1, 0
                                                            {/if}
                                                        ],
                                                        backgroundColor: [
                                                            'rgba(105,0,199, 1)',
                                                            'rgba(94,85,251, 1)'
                                                        ],
                                                        borderColor: [
                                                            'rgba(105,0,199, 1)',
                                                            'rgba(94,85,251, 1)'
                                                        ],
                                                        hoverOffset: 1,
                                                        borderWidth: 1
                                                    }]
                                                },
                                                options: {
                                                    maintainAspectRatio: false,
                                                    scales: {
                                                        x: {
                                                            display: false,
                                                            grid: {
                                                                display: false,
                                                            }
                                                        },
                                                        y: {
                                                            display: false,
                                                            grid: {
                                                                display: false
                                                            }
                                                        }
                                                    }
                                                }
                                            });
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
