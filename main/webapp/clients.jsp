<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Best Clients - Real Estate Agent Finder</title>

    <!-- CSS Dependencies -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <style>
        :root {
            --primary: #000c24;
            --secondary: #001a4d;
            --accent: #0055ff;
            --light: #ffffff;
            --gold: #ffd700;
            --silver: #c0c0c0;
            --bronze: #cd7f32;
        }

        body {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            color: var(--light);
        }

        .dashboard-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            background: rgba(0, 85, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 0.8rem 1.2rem;
            border-radius: 15px;
            color: white;
            text-decoration: none;
            z-index: 1000;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 0.9rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }

        .dashboard-btn:hover {
            background: rgba(0, 85, 255, 0.2);
            transform: translateX(-5px);
            color: white;
            text-decoration: none;
        }

        .client-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: transform 0.3s ease;
        }

        .client-card:hover {
            transform: translateY(-5px);
        }

        .time-display {
            position: fixed;
            top: 20px;
            right: 20px;
            background: rgba(0, 85, 255, 0.1);
            backdrop-filter: blur(8px);
            padding: 0.8rem 1.2rem;
            border-radius: 15px;
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
            font-size: 0.9rem;
            z-index: 1000;
        }

        .welcome-text {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(0, 85, 255, 0.1);
            backdrop-filter: blur(8px);
            padding: 0.8rem 1.2rem;
            border-radius: 15px;
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
            font-size: 0.9rem;
            z-index: 1000;
            white-space: nowrap;
        }

        .top-client {
            text-align: center;
            padding: 1rem;
            position: relative;
        }

        .client-rank {
            position: absolute;
            top: -10px;
            left: -10px;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 1.2rem;
        }

        .rank-1 { background: var(--gold); color: var(--primary); }
        .rank-2 { background: var(--silver); color: var(--primary); }
        .rank-3 { background: var(--bronze); color: var(--primary); }

        .client-avatar {
            width: 120px;
            height: 120px;
            border-radius: 60px;
            margin-bottom: 1rem;
            border: 4px solid rgba(255, 255, 255, 0.2);
            object-fit: cover;
        }

        .client-stats {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 0.8rem;
            margin-top: 1rem;
        }

        .progress {
            height: 8px;
            background: rgba(255, 255, 255, 0.1);
            margin-bottom: 0.5rem;
        }

        .progress-bar {
            background: var(--accent);
        }

        .achievement-badge {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 0.4rem 0.8rem;
            font-size: 0.8rem;
            margin: 0.2rem;
            display: inline-block;
        }

        .rating-stars {
            color: var(--gold);
            margin-bottom: 0.5rem;
        }

        .stat-value {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 0.2rem;
        }

        .stat-label {
            font-size: 0.8rem;
            color: rgba(255, 255, 255, 0.7);
        }
    </style>
</head>
<body>
    <!-- Back to Dashboard Button -->
    <a href="userDashboard.jsp" class="dashboard-btn animate__animated animate__fadeIn">
        <i class="fas fa-tachometer-alt me-2"></i>
        <span>Back to Dashboard</span>
    </a>

    <!-- Time Display -->
    <div class="time-display animate__animated animate__fadeIn">
        <i class="fas fa-clock me-2"></i>
        <span id="current-time">2025-03-16 13:05:09</span>
    </div>

    

    <div class="container py-5">
        <!-- Top Clients Section -->
        <div class="client-card animate__animated animate__fadeIn">
            <h4 class="mb-4">Top Performing Clients</h4>
            <div class="row">
                <!-- Top 3 Clients -->
                <div class="col-md-4">
                    <div class="top-client">
                        <div class="client-rank rank-1">1</div>
                        <img src="https://placehold.co/200x200" alt="Top Client 1" class="client-avatar">
                        <h5>Sarah Johnson</h5>
                        <div class="rating-stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="client-stats">
                            <div class="stat-value">$2.5M</div>
                            <div class="stat-label">Total Investment</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="top-client">
                        <div class="client-rank rank-2">2</div>
                        <img src="https://placehold.co/200x200" alt="Top Client 2" class="client-avatar">
                        <h5>Michael Chen</h5>
                        <div class="rating-stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                        <div class="client-stats">
                            <div class="stat-value">$2.1M</div>
                            <div class="stat-label">Total Investment</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="top-client">
                        <div class="client-rank rank-3">3</div>
                        <img src="https://placehold.co/200x200" alt="Top Client 3" class="client-avatar">
                        <h5>Emily Brown</h5>
                        <div class="rating-stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                        </div>
                        <div class="client-stats">
                            <div class="stat-value">$1.8M</div>
                            <div class="stat-label">Total Investment</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Client Performance Metrics -->
        <div class="client-card">
            <h4 class="mb-4">Performance Metrics</h4>
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="client-stats p-3">
                        <h5 class="mb-3">Investment Distribution</h5>
                        <div class="mb-3">
                            <div class="d-flex justify-content-between mb-1">
                                <span>Residential Properties</span>
                                <span>65%</span>
                            </div>
                            <div class="progress">
                                <div class="progress-bar" style="width: 65%"></div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="d-flex justify-content-between mb-1">
                                <span>Commercial Properties</span>
                                <span>25%</span>
                            </div>
                            <div class="progress">
                                <div class="progress-bar" style="width: 25%"></div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="d-flex justify-content-between mb-1">
                                <span>Land Development</span>
                                <span>10%</span>
                            </div>
                            <div class="progress">
                                <div class="progress-bar" style="width: 10%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="client-stats p-3">
                        <h5 class="mb-3">Client Achievements</h5>
                        <div class="achievement-badge">
                            <i class="fas fa-trophy me-2"></i>Top Investor 2025
                        </div>
                        <div class="achievement-badge">
                            <i class="fas fa-award me-2"></i>Premium Member
                        </div>
                        <div class="achievement-badge">
                            <i class="fas fa-star me-2"></i>5-Star Rating
                        </div>
                        <div class="achievement-badge">
                            <i class="fas fa-gem me-2"></i>VIP Client
                        </div>
                        <div class="achievement-badge">
                            <i class="fas fa-medal me-2"></i>Early Adopter
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Transactions -->
        <div class="client-card">
            <h4 class="mb-4">Recent Transactions</h4>
            <div class="table-responsive">
                <table class="table text-white">
                    <thead>
                        <tr>
                            <th>Property</th>
                            <th>Type</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Luxury Villa - Colombo 7</td>
                            <td>Residential</td>
                            <td>2025-03-15</td>
                            <td>$850,000</td>
                            <td><span class="badge bg-success">Completed</span></td>
                        </tr>
                        <tr>
                            <td>Commercial Space - Colombo 3</td>
                            <td>Commercial</td>
                            <td>2025-03-10</td>
                            <td>$1,200,000</td>
                            <td><span class="badge bg-warning">Pending</span></td>
                        </tr>
                        <tr>
                            <td>Beach Property - Mount Lavinia</td>
                            <td>Land</td>
                            <td>2025-03-05</td>
                            <td>$450,000</td>
                            <td><span class="badge bg-success">Completed</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Update time
        function updateTime() {
            const timeElement = document.getElementById('current-time');
            const now = new Date();
            const formattedTime = now.getUTCFullYear() + '-' + 
                                String(now.getUTCMonth() + 1).padStart(2, '0') + '-' + 
                                String(now.getUTCDate()).padStart(2, '0') + ' ' + 
                                String(now.getUTCHours()).padStart(2, '0') + ':' + 
                                String(now.getUTCMinutes()).padStart(2, '0') + ':' + 
                                String(now.getUTCSeconds()).padStart(2, '0');
            timeElement.textContent = formattedTime;
        }
        setInterval(updateTime, 1000);
    </script>
</body>
</html>