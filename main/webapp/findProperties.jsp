<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Agents - Estate Agent Finder</title>

    <!-- CSS Dependencies -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet">

    <style>
        :root {
            --dark-blue: #0a1f44;
            --darker-blue: #091632;
            --deepest-blue: #060d1f;
            --accent-blue: #4a90e2;
            --light-blue: #84ceeb;
            --text-light: #ffffff;
            --text-muted: #a0aec0;
            --glass-bg: rgba(10, 31, 68, 0.95);
            --glass-border: rgba(255, 255, 255, 0.1);
            --card-bg: rgba(9, 22, 50, 0.9);
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, var(--deepest-blue) 0%, var(--dark-blue) 100%);
            color: var(--text-light);
            min-height: 100vh;
        }

        #particles-js {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 0;
        }

        .content-wrapper {
            position: relative;
            z-index: 1;
            padding: 2rem 0;
        }

        .current-time {
            position: fixed;
            top: 20px;
            right: 20px;
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            padding: 8px 15px;
            border-radius: 20px;
            border: 1px solid var(--glass-border);
            color: var(--accent-blue);
            z-index: 1000;
        }

        .search-container {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 2rem;
            border: 1px solid var(--glass-border);
            margin-bottom: 2rem;
        }

        .agent-card {
            background: var(--card-bg);
            border-radius: 15px;
            border: 1px solid var(--glass-border);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            transition: all 0.3s ease;
        }

        .agent-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .agent-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 3px solid var(--accent-blue);
            padding: 3px;
        }

        .availability-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            display: inline-block;
        }

        .available {
            background: rgba(40, 167, 69, 0.2);
            color: #51cf66;
            border: 1px solid rgba(40, 167, 69, 0.3);
        }

        .busy {
            background: rgba(220, 53, 69, 0.2);
            color: #ff6b6b;
            border: 1px solid rgba(220, 53, 69, 0.3);
        }

        .btn-custom {
            background: var(--accent-blue);
            color: var(--text-light);
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            background: #357abd;
            color: var(--text-light);
            transform: translateY(-2px);
        }

        .btn-home {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: var(--accent-blue);
            color: var(--text-light);
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(74, 144, 226, 0.3);
            border: 1px solid var(--glass-border);
            z-index: 1000;
        }

        .btn-home:hover {
            background: #357abd;
            color: var(--text-light);
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(74, 144, 226, 0.5);
        }

        .rating {
            color: #ffd700;
        }
    </style>
</head>
<body>
    <!-- Particle Effect Container -->
    <div id="particles-js"></div>

    <!-- Current Time Display -->
    <div class="current-time animate__animated animate__fadeIn">
        <i class="fas fa-clock me-2"></i>
        <span id="current-time">2025-03-14 21:52:24</span>
    </div>

    <div class="content-wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark mb-4">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">
                    <i class="fas fa-building me-2"></i>Estate Agent Finder
                </a>
                <div class="ms-auto d-flex align-items-center">
                    <div class="user-info me-3">
                        <span class="text-light">
                            <i class="fas fa-user me-2"></i>
                            <%= session.getAttribute("user") != null ? session.getAttribute("user") : "Krishmal2004" %>
                        </span>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container">
            <!-- Search Section -->
            <div class="search-container animate__animated animate__fadeInDown">
                <h2 class="mb-4"><i class="fas fa-search me-2"></i>Find Your Perfect Agent</h2>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label class="form-label">Location</label>
                        <select class="form-select">
                            <option value="">All Locations</option>
                            <option value="colombo">Colombo</option>
                            <option value="gampaha">Gampaha</option>
                            <option value="kandy">Kandy</option>
                            <option value="galle">Galle</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Specialization</label>
                        <select class="form-select">
                            <option value="">All Types</option>
                            <option value="residential">Residential</option>
                            <option value="commercial">Commercial</option>
                            <option value="luxury">Luxury</option>
                            <option value="investment">Investment</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Rating</label>
                        <select class="form-select">
                            <option value="">Any Rating</option>
                            <option value="5">5 Stars</option>
                            <option value="4">4+ Stars</option>
                            <option value="3">3+ Stars</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Agents List -->
            <div class="row">
                <!-- Agent Card 1 -->
                <div class="col-md-6 col-lg-4">
                    <div class="agent-card animate__animated animate__fadeIn">
                        <div class="text-center mb-3">
                            <img src="https://ui-avatars.com/api/?name=John+Smith&background=random" 
                                 class="agent-image mb-3" alt="John Smith">
                            <h4>John Smith</h4>
                            <div class="rating mb-2">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span class="ms-2 text-muted">(4.5)</span>
                            </div>
                            <span class="availability-badge available">
                                <i class="fas fa-check-circle me-1"></i>Available
                            </span>
                        </div>
                        <div class="agent-info">
                            <p><i class="fas fa-map-marker-alt me-2"></i>Colombo</p>
                            <p><i class="fas fa-briefcase me-2"></i>Luxury Properties</p>
                            <p><i class="fas fa-home me-2"></i>15 Active Listings</p>
                        </div>
                        <div class="text-center mt-3">
                            <button class="btn btn-custom">
                                <i class="fas fa-calendar-alt me-2"></i>Schedule Meeting
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Agent Card 2 -->
                <div class="col-md-6 col-lg-4">
                    <div class="agent-card animate__animated animate__fadeIn">
                        <div class="text-center mb-3">
                            <img src="https://ui-avatars.com/api/?name=Sarah+Johnson&background=random" 
                                 class="agent-image mb-3" alt="Sarah Johnson">
                            <h4>Sarah Johnson</h4>
                            <div class="rating mb-2">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <span class="ms-2 text-muted">(5.0)</span>
                            </div>
                            <span class="availability-badge busy">
                                <i class="fas fa-times-circle me-1"></i>Busy
                            </span>
                        </div>
                        <div class="agent-info">
                            <p><i class="fas fa-map-marker-alt me-2"></i>Kandy</p>
                            <p><i class="fas fa-briefcase me-2"></i>Commercial Properties</p>
                            <p><i class="fas fa-home me-2"></i>12 Active Listings</p>
                        </div>
                        <div class="text-center mt-3">
                            <button class="btn btn-custom">
                                <i class="fas fa-calendar-alt me-2"></i>Schedule Meeting
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Add more agent cards as needed -->
            </div>
        </div>

        <!-- Home Button -->
        <a href="index.jsp" class="btn-home animate__animated animate__pulse animate__infinite animate__slower" title="Go to Homepage">
            <i class="fas fa-home"></i>
        </a>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>

    <script>
        // Initialize Particles.js
        particlesJS("particles-js", {
            particles: {
                number: { value: 80, density: { enable: true, value_area: 800 } },
                color: { value: "#4a90e2" },
                shape: { type: "circle" },
                opacity: {
                    value: 0.5,
                    random: true,
                    animation: { enable: true, speed: 1, opacity_min: 0.1, sync: false }
                },
                size: {
                    value: 3,
                    random: true,
                    animation: { enable: true, speed: 2, size_min: 0.1, sync: false }
                },
                line_linked: {
                    enable: true,
                    distance: 150,
                    color: "#4a90e2",
                    opacity: 0.4,
                    width: 1
                },
                move: {
                    enable: true,
                    speed: 2,
                    direction: "none",
                    random: true,
                    straight: false,
                    out_mode: "out",
                    bounce: false,
                    attract: { enable: true, rotateX: 600, rotateY: 1200 }
                }
            },
            interactivity: {
                detect_on: "canvas",
                events: {
                    onhover: { enable: true, mode: "repulse" },
                    onclick: { enable: true, mode: "push" },
                    resize: true
                },
                modes: {
                    repulse: { distance: 100, duration: 0.4 },
                    push: { particles_nb: 4 }
                }
            },
            retina_detect: true
        });

        // Initialize Select2
        $(document).ready(function() {
            $('select').select2();

            // Update current time
            function updateTime() {
                const timeElement = document.getElementById('current-time');
                const now = new Date();
                const formattedTime = now.toISOString().slice(0, 19).replace('T', ' ');
                timeElement.textContent = formattedTime;
            }
            setInterval(updateTime, 1000);
        });
    </script>
</body>
</html>