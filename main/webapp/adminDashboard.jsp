<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Real Estate Agent Finder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
    <style>
        :root {
            --dark-blue: #1a1f3c;
            --darker-blue: #151933;
            --accent-blue: #4A90E2;
            --light-blue: #84CEEB;
            --text-light: #E1E8ED;
            --text-bright: #FFFFFF;
            --success-color: #2ECC71;
            --danger-color: #E74C3C;
            --card-bg: rgba(26, 31, 60, 0.7);
            --border-color: rgba(74, 144, 226, 0.3);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: var(--dark-blue);
            color: var(--text-light);
            line-height: 1.6;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }

        #particles-js {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            background: linear-gradient(135deg, var(--darker-blue) 0%, var(--dark-blue) 100%);
        }

        .wrapper {
            position: relative;
            z-index: 1;
        }

        .content-wrapper {
            background: transparent !important;
            color: var(--text-light);
        }

        .sidebar-dark {
            background: rgba(26, 31, 60, 0.95) !important;
            backdrop-filter: blur(10px);
        }

        .main-header {
            background: rgba(255, 255, 255, 0.1) !important;
            backdrop-filter: blur(10px);
            border: none !important;
        }

        .navbar-light .navbar-nav .nav-link {
            color: var(--text-light) !important;
        }

        .card {
            background: rgba(26, 31, 60, 0.8) !important;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(74, 144, 226, 0.3) !important;
            margin-bottom: 20px;
        }

        .card-header {
            background: rgba(74, 144, 226, 0.1) !important;
            border-bottom: 1px solid rgba(74, 144, 226, 0.2) !important;
            color: var(--text-light) !important;
        }

        .table {
            color: var(--text-light) !important;
        }

        .table td, .table th {
            border-color: rgba(74, 144, 226, 0.2) !important;
        }

        .small-box {
            background: rgba(26, 31, 60, 0.8) !important;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(74, 144, 226, 0.3) !important;
        }

        .main-footer {
            background: rgba(26, 31, 60, 0.95) !important;
            backdrop-filter: blur(10px);
            border-top: 1px solid rgba(74, 144, 226, 0.3) !important;
            color: var(--text-light) !important;
            position: relative;
            z-index: 1;
        }

        .btn-custom {
            background: rgba(74, 144, 226, 0.2);
            border: 1px solid rgba(74, 144, 226, 0.3);
            color: var(--text-light);
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            background: rgba(74, 144, 226, 0.3);
            transform: translateY(-2px);
            color: var(--text-bright);
        }

        .user-panel {
            border-bottom: 1px solid rgba(74, 144, 226, 0.2) !important;
        }

        .user-panel .info a {
            color: var(--text-light) !important;
        }

        .time-display {
            color: var(--accent-blue);
            font-size: 0.9em;
            background: rgba(74, 144, 226, 0.1);
            padding: 5px 10px;
            border-radius: 4px;
            margin-right: 15px;
        }

        .nav-sidebar .nav-item .nav-link {
            color: var(--text-light) !important;
        }

        .nav-sidebar .nav-item .nav-link:hover {
            background: rgba(74, 144, 226, 0.2) !important;
        }

        .nav-sidebar .nav-item .nav-link.active {
            background: var(--accent-blue) !important;
        }

        .small-box .icon {
            color: rgba(255, 255, 255, 0.2);
        }

        .badge {
            font-size: 0.8em;
            padding: 5px 10px;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div id="particles-js"></div>
    
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item">
                    <span class="time-display">
                        <i class="far fa-clock"></i>
                        2025-03-14 15:20:22 UTC
                    </span>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <span class="time-display">
                        <i class="fas fa-user"></i>
                        Krishmal2004
                    </span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">
                        <i class="fas fa-sign-out-alt"></i>
                    </a>
                </li>
            </ul>
        </nav>
                <!-- Main Sidebar -->
        <aside class="main-sidebar sidebar-dark elevation-4">
            <a href="adminDashboard" class="brand-link text-center">
                <span class="brand-text font-weight-light">
                    <i class="fas fa-home"></i>
                    Real Estate Admin
                </span>
            </a>

            <div class="sidebar">
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column">
                        <li class="nav-item">
                            <a href="dashboard" class="nav-link active">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="agents" class="nav-link">
                                <i class="nav-icon fas fa-user-tie"></i>
                                <p>Agent Management</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="properties" class="nav-link">
                                <i class="nav-icon fas fa-building"></i>
                                <p>Properties</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="appointments" class="nav-link">
                                <i class="nav-icon fas fa-calendar-check"></i>
                                <p>Appointments</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="clients" class="nav-link">
                                <i class="nav-icon fas fa-users"></i>
                                <p>Client Management</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="analytics" class="nav-link">
                                <i class="nav-icon fas fa-chart-line"></i>
                                <p>Analytics</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="adminSettingPage.jsp" class="nav-link">
                                <i class="nav-icon fas fa-cog"></i>
                                <p>Settings</p>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>

        <!-- Content -->
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Dashboard Overview</h1>
                        </div>
                    </div>
                </div>
            </div>

            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-info">
                                <div class="inner">
                                    <h3>150</h3>
                                    <p>Active Agents</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-user-tie"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-success">
                                <div class="inner">
                                    <h3>45</h3>
                                    <p>Today's Appointments</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-calendar-check"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-warning">
                                <div class="inner">
                                    <h3>580</h3>
                                    <p>Listed Properties</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-building"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-danger">
                                <div class="inner">
                                    <h3>250</h3>
                                    <p>Active Clients</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-users"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Recent Appointments</h3>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Client</th>
                                                    <th>Agent</th>
                                                    <th>Property</th>
                                                    <th>Date</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>John Doe</td>
                                                    <td>Sarah Wilson</td>
                                                    <td>Luxury Villa #123</td>
                                                    <td>2025-03-14</td>
                                                    <td><span class="badge bg-success">Confirmed</span></td>
                                                </tr>
                                                <!-- Add more rows as needed -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Quick Actions</h3>
                                </div>
                                <div class="card-body">
                                    <div class="d-grid gap-2">
                                        <button class="btn btn-custom mb-2">
                                            <i class="fas fa-plus-circle me-2"></i> Add New Property
                                        </button>
                                        <button class="btn btn-custom mb-2">
                                            <i class="fas fa-user-plus me-2"></i> Register Agent
                                        </button>
                                        <button class="btn btn-custom">
                                            <i class="fas fa-calendar-plus me-2"></i> Schedule Appointment
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <footer class="main-footer">
            <strong>Copyright &copy; 2025 Real Estate Agent Finder.</strong>
            All rights reserved.
        </footer>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script>
        particlesJS("particles-js", {
            particles: {
                number: { value: 80, density: { enable: true, value_area: 800 } },
                color: { value: "#4A90E2" },
                shape: { type: "circle" },
                opacity: {
                    value: 0.5,
                    random: true,
                    animation: { enable: true, speed: 1, opacity_min: 0.1, sync: false }
                },
                size: {
                    value: 3,
                    random: true,
                    animation: { enable