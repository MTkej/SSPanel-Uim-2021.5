<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <script id="ga-gtag" type="text/javascript" async=""
        src="https://www.googletagmanager.com/gtag/js?id=UA-38417733-31"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>{$config['appName']}</title>
    <link href='https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css' rel="stylesheet" />
    <!-- Custom styles for this template-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="/theme/material/admin/css/admin.min.css">
    <link rel="stylesheet" href="/theme/material/admin/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
    <!-- js -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.3.0/dist/chart.min.js"></script>
</head>

<body class="nav-fixed">
    <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white"
        id="sidenavAccordion">
        <!-- Sidenav Toggle Button-->
        <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i
                class="bx bx-menu pl-3 bx-md" id="header-toggle"></i></button>
        <!-- Navbar Brand-->
        <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="#">SSpanel <sup>V3</sup></a>
        <!-- Navbar Items-->
        <ul class="navbar-nav align-items-center ms-auto">
            <!-- User Dropdown-->
            {if $user->isLogin}
                <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage"
                        href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false"><img class="img-fluid" src="{$user->gravatar}"></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up"
                        aria-labelledby="navbarDropdownUserImage">
                        <h6 class="dropdown-header d-flex align-items-center">
                            <img class="dropdown-user-img" src="{$user->gravatar}">
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name">{$user->user_name}</div>
                                <div class="dropdown-user-details-email">{$user->email}</div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/user/">
                            <div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                            用户中心
                        </a>
                        <a class="dropdown-item" href="/user/logout">
                            <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                            登出
                        </a>
                    </div>
                </li>
            {else}
                <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage"
                        href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false"><img class="img-fluid" src="/theme/material/images/users/avatar-001.jpg"></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up"
                        aria-labelledby="navbarDropdownUserImage">
                        <h6 class="dropdown-header d-flex align-items-center">
                            <img class="dropdown-user-img" src="/theme/material/images/users/avatar-001.jpg">
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name">未登陆</div>
                                <div class="dropdown-user-details-email"></div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/auth/login">
                            <div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                            登录
                        </a>
                        <a class="dropdown-item" href="/auth/register">
                            <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                            注册
                        </a>
                    </div>
                </li>
            {/if}
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sidenav shadow-right sidenav-light">
                <div class="sidenav-menu mt-4">
                    <div class="nav accordion" id="accordionSidenav">
                        <a class="nav-link" href="/admin">
                            <div class="nav-link-icon"><i class='bx bx-grid-alt'></i></div>
                            系统概览
                        </a>
                        <a class="nav-link" href="/admin/announcement">
                            <div class="nav-link-icon"><i class='bx bx-volume-full'></i></div>
                            公告管理
                        </a>
                        <a class="nav-link" href="/admin/ticket">
                            <div class="nav-link-icon"><i class='bx bx-message-square-detail'></i></div>
                            工单管理
                        </a>
                        <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse"
                            data-bs-target="#collapsenodes" aria-expanded="false" aria-controls="collapsenodes">
                            <div class="nav-link-icon"><i class='bx bxs-vector'></i></div>
                            节点信息
                            <div class="sidenav-collapse-arrow"><i class='bx bxs-chevron-down'></i>
                            </div>
                        </a>
                        <div class="collapse" id="collapsenodes" data-bs-parent="#accordionSidenav">
                            <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                                <a class="nav-link" href="/admin/node">节点列表</a>
                                <a class="nav-link" href="/admin/alive">在线IP</a>
                                <a class="nav-link" href="/admin/block">已封禁IP</a>
                                <a class="nav-link" href="/admin/unblock">已解封IP</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse"
                            data-bs-target="#collapseDashboards" aria-expanded="false"
                            aria-controls="collapseDashboards">
                            <div class="nav-link-icon"> <i class='bx bx-user'></i></div>
                            用户信息
                            <div class="sidenav-collapse-arrow"><i class='bx bxs-chevron-down'></i>
                            </div>
                        </a>
                        <div class="collapse" id="collapseDashboards" data-bs-parent="#accordionSidenav">
                            <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                                <a class="nav-link" href="/admin/user">用户列表<span
                                        class="badge bg-primary-soft text-primary ms-auto">Updated</span></a>
                                <a class="nav-link" href="/admin/invite">邀请与返利</a>
                                <a class="nav-link" href="/admin/subscribe">订阅列表</a>
                                <a class="nav-link" href="/admin/login">登陆记录</a>

                                <a class="nav-link" href="/admin/config/register">用户注册</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="/admin/code">
                            <div class="nav-link-icon"><i class='bx bx-donate-heart'></i></div>充值与捐赠记录</span>
                        </a>
                        <a class="nav-link" href="/admin/shop">
                            <div class="nav-link-icon"><i class='bx bx-shopping-bag'></i></div>商品信息
                        </a>
                        <a class="nav-link" href="/admin/coupon">
                            <div class="nav-link-icon"><i class='bx bxs-bookmark'></i></div>优惠码
                        </a>
                        <a class="nav-link" href="/admin/bought">
                            <div class="nav-link-icon"><i class='bx bx-bar-chart-alt-2'></i></div>购买记录
                        </a>
                        {if $config['payment_system']=='chenAlipay'}
                            <a class="nav-link" href="/admin/editConfig">
                                <i class="fas fa-credit-card"></i> 支付设置
                            </a>
                        {/if}
                        <a class="nav-link" href="/admin/config/telegram">
                            <div class="nav-link-icon"><i class='bx bx-paper-plane'></i></div>Telegram
                        </a>
                        <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse"
                            data-bs-target="#collapsesjs" aria-expanded="false" aria-controls="collapsesjs">
                            <div class="nav-link-icon"><i class='bx bx-bar-chart-alt-2'></i></div>
                            审计信息
                            <div class="sidenav-collapse-arrow"><i class='bx bxs-chevron-down'></i>
                            </div>
                        </a>
                        <div class="collapse" id="collapsesjs" data-bs-parent="#accordionSidenav">
                            <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                                <a class="nav-link" href="/admin/detect">审讯规则</a>
                                <a class="nav-link" href="/admin/detect/log">审讯记录</a>
                                <a class="nav-link" href="/admin/detect/ban">审讯封禁</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="/user">
                            <div class="nav-link-icon"><i class='bx bx-undo'></i></div>用户中心
                        </a>
                    </div>
                </div>
            </nav>
        </div>
