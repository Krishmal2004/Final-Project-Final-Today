<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Client Directory | Real Estate Pro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    
    <style>
        :root {
            --primary-bg: #0f172a;
            --secondary-bg: #1e293b;
            --accent: #3b82f6;
            --text-primary: #f8fafc;
            --text-secondary: #94a3b8;
            --card-bg: rgba(30, 41, 59, 0.95);
            --hover-bg: rgba(59, 130, 246, 0.1);
        }

        body {
            background: var(--primary-bg);
            color: var(--text-primary);
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            min-height: 100vh;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        #particles-js {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 0;
            pointer-events: none;
        }

        .main-container {
            position: relative;
            z-index: 1;
        }

        .header-card {
            background: var(--secondary-bg);
            border-radius: 16px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .time-display {
            background: var(--hover-bg);
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            font-family: 'Courier New', monospace;
            color: var(--accent);
            display: inline-block;
            border: 1px solid rgba(59, 130, 246, 0.2);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(59, 130, 246, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(59, 130, 246, 0); }
            100% { box-shadow: 0 0 0 0 rgba(59, 130, 246, 0); }
        }

        .search-container {
            position: relative;
            max-width: 500px;
            margin: 0 auto 2rem;
        }

        .search-input {
            width: 100%;
            padding: 1rem 1rem 1rem 3rem;
            background: var(--secondary-bg);
            border: 1px solid rgba(59, 130, 246, 0.2);
            border-radius: 12px;
            color: var(--text-primary);
            transition: all 0.3s ease;
        }

        .search-input:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--accent);
        }

        .client-card {
            background: var(--card-bg);
            border-radius: 16px;
            overflow: hidden;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            height: 100%;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .client-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1),
                        0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .client-image {
            position: relative;
            height: 200px;
            overflow: hidden;
        }

        .client-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .client-card:hover .client-image img {
            transform: scale(1.1);
        }

        .client-status {
            position: absolute;
            top: 1rem;
            right: 1rem;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.875rem;
            background: rgba(59, 130, 246, 0.9);
            color: white;
            backdrop-filter: blur(4px);
        }

        .client-info {
            padding: 1.5rem;
        }

        .client-name {
            font-size: 1.25rem;
            margin-bottom: 1rem;
            color: var(--text-primary);
        }

        .client-details p {
            color: var(--text-secondary);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .client-details i {
            color: var(--accent);
            width: 16px;
        }

        .btn-action {
            width: 100%;
            padding: 0.875rem;
            background: var(--accent);
            color: white;
            border: none;
            border-radius: 8px;
            margin-top: 1rem;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-action:hover {
            background: #2563eb;
            transform: translateY(-2px);
        }

        .loading-screen {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--primary-bg);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            transition: opacity 0.5s ease;
        }

        .spinner {
            width: 40px;
            height: 40px;
            border: 4px solid rgba(59, 130, 246, 0.1);
            border-left-color: var(--accent);
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        .stats-pill {
            background: var(--secondary-bg);
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            margin: 0 0.5rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .stats-pill i {
            color: var(--accent);
        }
    </style>
</head>
<body>
    <!-- Loading Screen -->
    <div class="loading-screen" id="loadingScreen">
        <div class="spinner"></div>
    </div>

    <!-- Particles Background -->
    <div id="particles-js"></div>

    <!-- Main Content -->
    <div class="main-container">
        <div class="container py-4">
            <!-- Header -->
            <div class="header-card" data-aos="fade-down">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <h1 class="mb-3">Client Directory</h1>
                        <div class="time-display" id="currentDateTime">
                            2025-03-22 15:13:55
                        </div>
                    </div>
                    <div class="col-md-6 text-md-end mt-3 mt-md-0">
                        <div class="stats-pill">
                            <i class="fas fa-users"></i>
                            <span>Total Clients: 87</span>
                        </div>
                        <div class="stats-pill">
                            <i class="fas fa-user-check"></i>
                            <span>Active: 65</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Search -->
            <div class="search-container" data-aos="fade-up" data-aos-delay="100">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="search-input" placeholder="Search clients by name, email, or phone...">
            </div>

            <!-- Clients Grid -->
            <div class="row g-4">
                <!-- Example Client Card -->
                <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="client-card">
                        <div class="client-image">
                            <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="Client">
                            <span class="client-status">Premium</span>
                        </div>
                        <div class="client-info">
                            <h3 class="client-name">John Anderson</h3>
                            <div class="client-details">
                                <p><i class="fas fa-envelope"></i>john.anderson@email.com</p>
                                <p><i class="fas fa-phone"></i>(555) 123-4567</p>
                                <p><i class="fas fa-map-marker-alt"></i>New York, NY</p>
                                <p><i class="fas fa-home"></i>Buyer</p>
                            </div>
                            <button class="btn-action" onclick="window.location.href='appointmentsViewAll.jsp?clientId=1'">
                                <i class="fas fa-calendar-alt"></i>
                                View Appointments
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Add more client cards as needed -->

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
    <script>
        // Initialize AOS
        AOS.init({
            duration: 800,
            once: true,
            offset: 100
        });

        // Initialize Particles.js
        particlesJS('particles-js',
          {
            "particles": {
              "number": {
                "value": 50,
                "density": {
                  "enable": true,
                  "value_area": 800
                }
              },
              "color": {
                "value": "#3b82f6"
              },
              "shape": {
                "type": "circle"
              },
              "opacity": {
                "value": 0.5,
                "random": false
              },
              "size": {
                "value": 3,
                "random": true
              },
              "line_linked": {
                "enable": true,
                "distance": 150,
                "color": "#3b82f6",
                "opacity": 0.4,
                "width": 1
              },
              "move": {
                "enable": true,
                "speed": 2,
                "direction": "none",
                "random": false,
                "straight": false,
                "out_mode": "out",
                "bounce": false
              }
            },
            "interactivity": {
              "detect_on": "canvas",
              "events": {
                "onhover": {
                  "enable": true,
                  "mode": "grab"
                },
                "onclick": {
                  "enable": true,
                  "mode": "push"
                },
                "resize": true
              }
            },
            "retina_detect": true
          }
        );

        // Update DateTime
        function updateDateTime() {
            const now = new Date();
            const formatted = now.getUTCFullYear() + '-' + 
                            String(now.getUTCMonth() + 1).padStart(2, '0') + '-' + 
                            String(now.getUTCDate()).padStart(2, '0') + ' ' + 
                            String(now.getUTCHours()).padStart(2, '0') + ':' + 
                            String(now.getUTCMinutes()).padStart(2, '0') + ':' + 
                            String(now.getUTCSeconds()).padStart(2, '0');
            document.getElementById('currentDateTime').textContent = formatted;
        }

        setInterval(updateDateTime, 1000);
        updateDateTime();

        // Search functionality
        document.querySelector('.search-input').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            document.querySelectorAll('.client-card').forEach(card => {
                const cardContent = card.textContent.toLowerCase();
                const cardContainer = card.closest('.col-md-6');
                
                if (cardContent.includes(searchTerm)) {
                    cardContainer.style.display = '';
                } else {
                    cardContainer.style.display = 'none';
                }
            });
        });

        // Loading screen
        window.addEventListener('load', function() {
            setTimeout(function() {
                const loadingScreen = document.getElementById('loadingScreen');
                loadingScreen.style.opacity = '0';
                setTimeout(() => {
                    loadingScreen.style.display = 'none';
                }, 500);
            }, 1000);
        });
    </script>
</body>
</html>