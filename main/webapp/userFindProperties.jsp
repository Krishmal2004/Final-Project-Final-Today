<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Properties - Real Estate Agent Finder</title>

    <!-- CSS Dependencies -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

    <style>
        :root {
            --primary: #000c24;
            --secondary: #001a4d;
            --accent: #0055ff;
            --light: #ffffff;
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

        .dashboard-btn i {
            transition: transform 0.3s ease;
        }

        .dashboard-btn:hover i {
            transform: translateX(-3px);
        }

        .search-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 2rem;
            margin: 2rem 0;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .property-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease;
            margin-bottom: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .property-card:hover {
            transform: translateY(-5px);
        }

        .property-image {
            height: 250px;
            object-fit: cover;
            width: 100%;
        }

        .property-details {
            padding: 1.5rem;
        }

        .price-tag {
            background: var(--accent);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            font-weight: bold;
        }

        .feature-badge {
            background: rgba(255, 255, 255, 0.1);
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            margin-right: 0.5rem;
            margin-bottom: 0.5rem;
            display: inline-block;
        }

        .search-input {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            padding: 0.8rem;
            border-radius: 10px;
        }

        .search-input:focus {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            border-color: var(--accent);
            box-shadow: none;
        }

        .search-input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .filter-select {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            padding: 0.8rem;
            border-radius: 10px;
        }

        .filter-select:focus {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            border-color: var(--accent);
            box-shadow: none;
        }

        .filter-select option {
            background: var(--primary);
            color: white;
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

        .page-link {
            background: rgba(0, 85, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.2);
            color: white;
        }

        .page-link:hover {
            background: rgba(0, 85, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.3);
            color: white;
        }

        .page-item.active .page-link {
            background: var(--accent);
            border-color: var(--accent);
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
        <span id="current-time">2025-03-16 12:33:37</span>
    </div>

    <!-- Welcome Message -->
    <div class="welcome-text animate__animated animate__fadeIn">
        <i class="fas fa-user me-2"></i>Welcome, Krishmal2004
    </div>

    <div class="container py-5">
        <!-- Search Section -->
        <div class="search-container animate__animated animate__fadeIn">
            <div class="row g-3">
                <div class="col-md-4">
                    <input type="text" class="form-control search-input" placeholder="Search by location...">
                </div>
                <div class="col-md-2">
                    <select class="form-select filter-select">
                        <option value="">Property Type</option>
                        <option>House</option>
                        <option>Apartment</option>
                        <option>Villa</option>
                        <option>Land</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select class="form-select filter-select">
                        <option value="">Price Range</option>
                        <option>Under $100k</option>
                        <option>$100k - $300k</option>
                        <option>$300k - $500k</option>
                        <option>$500k+</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select class="form-select filter-select">
                        <option value="">Bedrooms</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4+</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary w-100" style="background: var(--accent);">
                        <i class="fas fa-search me-2"></i>Search
                    </button>
                </div>
            </div>
        </div>

        <!-- Properties Grid -->
        <div class="row">
            <!-- Property 1 -->
            <div class="col-md-6 col-lg-4">
                <div class="property-card animate__animated animate__fadeIn">
                    <img src="https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGhvdXNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60" class="property-image" alt="Luxury Villa">
                    <div class="property-details">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="mb-0">Luxury Villa</h5>
                            <span class="price-tag">$850,000</span>
                        </div>
                        <p class="text-light mb-3"><i class="fas fa-map-marker-alt me-2"></i>Colombo 7, Sri Lanka</p>
                        <div class="mb-3">
                            <span class="feature-badge"><i class="fas fa-bed me-2"></i>4 Beds</span>
                            <span class="feature-badge"><i class="fas fa-bath me-2"></i>3 Baths</span>
                            <span class="feature-badge"><i class="fas fa-ruler-combined me-2"></i>3,200 sqft</span>
                        </div>
                        <button class="btn btn-primary w-100" style="background: var(--accent);">View Details</button>
                    </div>
                </div>
            </div>

            <!-- Property 2 -->
            <div class="col-md-6 col-lg-4">
                <div class="property-card animate__animated animate__fadeIn">
                    <img src="https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60" class="property-image" alt="Modern Apartment">
                    <div class="property-details">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="mb-0">Modern Apartment</h5>
                            <span class="price-tag">$320,000</span>
                        </div>
                        <p class="text-light mb-3"><i class="fas fa-map-marker-alt me-2"></i>Colombo 3, Sri Lanka</p>
                        <div class="mb-3">
                            <span class="feature-badge"><i class="fas fa-bed me-2"></i>2 Beds</span>
                            <span class="feature-badge"><i class="fas fa-bath me-2"></i>2 Baths</span>
                            <span class="feature-badge"><i class="fas fa-ruler-combined me-2"></i>1,200 sqft</span>
                        </div>
                        <button class="btn btn-primary w-100" style="background: var(--accent);">View Details</button>
                    </div>
                </div>
            </div>

            <!-- Property 3 -->
            <div class="col-md-6 col-lg-4">
                <div class="property-card animate__animated animate__fadeIn">
                    <img src="https://images.unsplash.com/photo-1582063289852-62e3ba2747f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGhvdXNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60" class="property-image" alt="Beach House">
                    <div class="property-details">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="mb-0">Beach House</h5>
                            <span class="price-tag">$650,000</span>
                        </div>
                        <p class="text-light mb-3"><i class="fas fa-map-marker-alt me-2"></i>Mount Lavinia, Sri Lanka</p>
                        <div class="mb-3">
                            <span class="feature-badge"><i class="fas fa-bed me-2"></i>3 Beds</span>
                            <span class="feature-badge"><i class="fas fa-bath me-2"></i>2 Baths</span>
                            <span class="feature-badge"><i class="fas fa-ruler-combined me-2"></i>2,400 sqft</span>
                        </div>
                        <button class="btn btn-primary w-100" style="background: var(--accent);">View Details</button>
                    </div>
                </div>
            </div>

        </div>

        <!-- Pagination -->
        <nav class="mt-4">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#"><i class="fas fa-chevron-left"></i></a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a></li>
            </ul>
        </nav>
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

        // Initialize tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]