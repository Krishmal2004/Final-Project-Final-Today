<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Settings - Real Estate Agent Finder</title>

    <!-- CSS Dependencies -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        :root {
            --dark-blue-1: #000c24;
            --dark-blue-2: #001a4d;
            --blue-accent: #0055ff;
            --light-blue: #e6f0ff;
            --white: #ffffff;
            --card-bg: rgba(255, 255, 255, 0.1);
            --success-color: #28a745;
            --danger-color: #dc3545;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, var(--dark-blue-1), var(--dark-blue-2));
            font-family: 'Poppins', sans-serif;
        }

        /* Navigation Bar */
        .custom-navbar {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        /* Settings Container */
        .settings-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 2rem 1rem;
        }

        /* Settings Card */
        .settings-card {
            background: var(--card-bg);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 2rem;
            color: var(--white);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5rem;
            opacity: 0;
            transform: translateY(20px);
            animation: slideUp 0.6s ease forwards;
        }

        @keyframes slideUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* User Avatar */
        .user-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 3px solid var(--blue-accent);
            padding: 3px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .user-avatar:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(0, 85, 255, 0.4);
        }

        /* Form Controls */
        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: var(--white);
            padding: 0.75rem;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.15);
            border-color: var(--blue-accent);
            color: var(--white);
            box-shadow: 0 0 0 0.25rem rgba(0, 85, 255, 0.25);
        }

        /* Custom Buttons */
        .btn-custom {
            background: rgba(0, 85, 255, 0.15);
            border: 1px solid var(--blue-accent);
            color: var(--white);
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            background: var(--blue-accent);
            transform: translateY(-2px);
            color: var(--white);
        }

        /* Navigation Pills */
        .nav-pills .nav-link {
            color: var(--white);
            border-radius: 10px;
            padding: 1rem 1.5rem;
            margin: 0.3rem 0;
            transition: all 0.3s ease;
        }

        .nav-pills .nav-link.active {
            background: var(--blue-accent);
            color: var(--white);
        }

        .nav-pills .nav-link:not(.active):hover {
            background: rgba(0, 85, 255, 0.15);
        }

        /* Time Display */
        .time-display {
            position: fixed;
            top: 20px;
            right: 20px;
            background: rgba(0, 85, 255, 0.1);
            backdrop-filter: blur(8px);
            padding: 0.8rem 1.2rem;
            border-radius: 15px;
            color: var(--white);
            border: 1px solid rgba(255, 255, 255, 0.2);
            font-size: 0.9rem;
            z-index: 1000;
        }

        /* Home Return Button */
        .home-return-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            background: rgba(255, 255, 255, 0.1);
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

        .home-return-btn:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateX(-5px);
            color: white;
        }

        /* Notification */
        .notification {
            position: fixed;
            top: 20px;
            right: -300px;
            background: var(--success-color);
            color: white;
            padding: 1rem;
            border-radius: 10px;
            transition: all 0.3s ease;
            z-index: 1001;
        }

        .notification.show {
            right: 20px;
        }

        /* Welcome Text */
        .welcome-text {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            color: white;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 0.8rem 1.2rem;
            border-radius: 15px;
            font-size: 0.9rem;
            z-index: 1000;
            border: 1px solid rgba(255, 255, 255, 0.2);
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <!-- Top Bar -->
    <div class="top-bar">
        <a href="userDashboard.jsp" class="home-return-btn animate__animated animate__fadeIn">
            <i class="fas fa-arrow-left"></i>
            <span>Dashboard</span>
        </a>
        
        
        <div class="time-display animate__animated animate__fadeIn">
            <i class="fas fa-clock"></i>
            <span id="current-time">2025-03-20 18:58:50</span>
        </div>
    </div>

    <!-- Notification -->
    <div class="notification" id="notification">
        <i class="fas fa-bell"></i>
        <span id="notification-text">Settings saved successfully!</span>
    </div>

    <!-- Main Content -->
    <div class="container settings-container">
        <div class="settings-card animate__animated animate__fadeIn">
            <div class="row align-items-center mb-5">
                <div class="col-auto">
                    <img src="https://ui-avatars.com/api/?name=Krishmal2004&background=0055ff&color=fff&size=200" 
                         alt="Profile Picture" 
                         class="user-avatar"
                         onclick="document.getElementById('avatar-upload').click()">
                    <input type="file" id="avatar-upload" hidden accept="image/*">
                </div>
                <div class="col">
                    <h2 class="mb-2" style="font-size: 2.5rem;">Krishmal2004</h2>
                    <p class="text-light mb-0" style="font-size: 1.3rem;">Real Estate Agent</p>
                </div>
            </div>

            <div class="row">
                <!-- Navigation Pills -->
                <div class="col-md-3">
                    <div class="nav flex-column nav-pills" role="tablist">
                        <button class="nav-link active" data-bs-toggle="pill" data-bs-target="#profile">
                            <i class="fas fa-user-circle"></i>
                            <span>Profile</span>
                        </button>
                        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#security">
                            <i class="fas fa-shield-alt"></i>
                            <span>Security</span>
                        </button>
                        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#preferences">
                            <i class="fas fa-sliders-h"></i>
                            <span>Preferences</span>
                        </button>
                        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#notifications">
                            <i class="fas fa-bell"></i>
                            <span>Notifications</span>
                        </button>
                        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#listings">
                            <i class="fas fa-home"></i>
                            <span>Listings</span>
                        </button>
                    </div>
                </div>

                <!-- Tab Content -->
                <div class="col-md-9">
                    <div class="tab-content">
                        <!-- Profile Tab -->
                        <div class="tab-pane fade show active" id="profile">
                            <h3 class="mb-4">Profile Information</h3>
                            <form class="needs-validation" novalidate>
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <label class="form-label">First Name</label>
                                        <input type="text" class="form-control" value="Krishmal" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Last Name</label>
                                        <input type="text" class="form-control" value="2004" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Email</label>
                                        <input type="email" class="form-control" value="krishmal@example.com" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Phone</label>
                                        <input type="tel" class="form-control" value="+94 70 219 5755" required>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label">Bio</label>
                                        <textarea class="form-control" rows="4" style="font-size: 1.2rem;">Experienced real estate agent specializing in residential properties.</textarea>
                                    </div>
                                    <div class="col-12 mt-4">
                                        <button type="submit" class="btn btn-custom">
                                            <i class="fas fa-save"></i>
                                            <span>Save Changes</span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- Security Tab -->
                        <div class="tab-pane fade" id="security">
    <h3 class="mb-4">Security Settings</h3>
    <form id="passwordForm" onsubmit="event.preventDefault(); updatePassword();">
        <div class="row g-4">
            <div class="col-12">
                <label class="form-label">Current Password</label>
                <input type="password" class="form-control" id="currentPassword" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">New Password</label>
                <input type="password" class="form-control" id="newPassword" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Confirm New Password</label>
                <input type="password" class="form-control" id="confirmPassword" required>
            </div>
            <div class="col-12 mt-4">
                <button type="submit" class="btn btn-custom">
                    <i class="fas fa-key"></i>
                    <span>Update Password</span>
                </button>
            </div>
        </div>
    </form>
</div>

                        <!-- Preferences Tab -->
                        <div class="tab-pane fade" id="preferences">
                            <h3 class="mb-4">User Preferences</h3>
                            <form>
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <label class="form-label">Language</label>
                                        <select class="form-select">
                                            <option value="en">English</option>
                                            <option value="si">Sinhala</option>
                                            <option value="ta">Tamil</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Time Zone</label>
                                        <select class="form-select">
                                            <option value="UTC">UTC</option>
                                            <option value="Asia/Colombo" selected>Asia/Colombo</option>
                                        </select>
                                    </div>
                                    <div class="col-12 mt-4">
                                        <button type="button" class="btn btn-custom">
                                            <i class="fas fa-save"></i>
                                            <span>Save Preferences</span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- Notifications Tab -->
                        <div class="tab-pane fade" id="notifications">
                            <h3 class="mb-4">Notification Settings</h3>
                            <div class="row g-4">
                                <div class="col-12">
                                    <div class="form-check form-switch mb-4">
                                        <input class="form-check-input" type="checkbox" checked>
                                        <label class="form-check-label">Email Notifications</label>
                                    </div>
                                    <div class="form-check form-switch mb-4">
                                        <input class="form-check-input" type="checkbox" checked>
                                        <label class="form-check-label">SMS Notifications</label>
                                    </div>
                                    <div class="form-check form-switch mb-4">
                                        <input class="form-check-input" type="checkbox" checked>
                                        <label class="form-check-label">Property Updates</label>
                                    </div>
                                    <div class="form-check form-switch mb-4">
                                        <input class="form-check-input" type="checkbox">
                                        <label class="form-check-label">Marketing Emails</label>
                                    </div>
                                </div>
                                <div class="col-12 mt-4">
                                    <button type="button" class="btn btn-custom">
                                        <i class="fas fa-save"></i>
                                        <span>Save Notification Settings</span>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Listings Tab -->
                        <div class="tab-pane fade" id="listings">
                            <h3 class="mb-4">Listing Preferences</h3>
                            <form>
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <label class="form-label">Default Property Type</label>
                                        <select class="form-select">
                                            <option value="residential">Residential</option>
                                            <option value="commercial">Commercial</option>
                                            <option value="industrial">Industrial</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Display Currency</label>
                                        <select class="form-select">
                                            <option value="LKR">LKR - Sri Lankan Rupee</option>
                                            <option value="USD">USD - US Dollar</option>
                                            <option value="EUR">EUR - Euro</option>
                                        </select>
                                    </div>
                                    <div class="col-12 mt-4">
                                        <button type="button" class="btn btn-custom">
                                            <i class="fas fa-save"></i>
                                            <span>Save Listing Preferences</span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Floating Action Button -->
    <div class="float-action-btn" onclick="showNotification('Quick actions menu opened!')">
        <i class="fas fa-plus"></i>
    </div>

    <!-- JavaScript Dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
 // Profile form submission
    document.getElementById('profileForm').addEventListener('submit', function(e) {
        e.preventDefault();
        saveSettings('saveProfile', {
            firstName: document.getElementById('firstName').value,
            lastName: document.getElementById('lastName').value,
            email: document.getElementById('email').value,
            phone: document.getElementById('phone').value,
            bio: document.getElementById('bio').value
        });
    });

    // Security form submission
    document.getElementById('passwordForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (newPassword !== confirmPassword) {
            showNotification('Passwords do not match', 'error');
            return;
        }

        saveSettings('savePassword', {
            currentPassword: document.getElementById('currentPassword').value,
            newPassword: newPassword
        });
    });

    // Preferences form submission
    document.getElementById('preferencesForm').addEventListener('submit', function(e) {
        e.preventDefault();
        saveSettings('savePreferences', {
            language: document.getElementById('language').value,
            timezone: document.getElementById('timezone').value
        });
    });

    // Notifications form submission
    document.getElementById('notificationsForm').addEventListener('submit', function(e) {
        e.preventDefault();
        saveSettings('saveNotifications', {
            emailNotifications: document.getElementById('emailNotifications').checked,
            smsNotifications: document.getElementById('smsNotifications').checked,
            propertyUpdates: document.getElementById('propertyUpdates').checked,
            marketingEmails: document.getElementById('marketingEmails').checked
        });
    });

    // Listings form submission
    document.getElementById('listingsForm').addEventListener('submit', function(e) {
        e.preventDefault();
        saveSettings('saveListings', {
            defaultPropertyType: document.getElementById('defaultPropertyType').value,
            displayCurrency: document.getElementById('displayCurrency').value
        });
    });

    // Generic function to save settings
    function saveSettings(action, data) {
        const formData = new FormData();
        formData.append('action', action);
        formData.append('username', currentUser); // Make sure currentUser is defined
        
        // Append all data properties to formData
        Object.keys(data).forEach(key => {
            formData.append(key, data[key]);
        });

        fetch('UserSettingsServlet', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(result => {
            showNotification(result.message, result.success ? 'success' : 'error');
        })
        .catch(error => {
            showNotification('Error saving settings', 'error');
            console.error('Error:', error);
        });
    }

    // Show notification function
    function showNotification(message, type = 'success') {
        const notification = document.getElementById('notification');
        const notificationText = document.getElementById('notification-text');
        
        notification.style.backgroundColor = type === 'success' ? 'var(--success-color)' : 'var(--danger-color)';
        notificationText.textContent = message;
        notification.classList.add('show');
        
        setTimeout(() => {
            notification.classList.remove('show');
        }, 3000);
    }

    // Update current time
    function updateCurrentTime() {
        const timeElement = document.getElementById('current-time');
        const now = new Date();
        const formattedTime = now.toISOString().replace('T', ' ').substring(0, 19);
        timeElement.textContent = formattedTime;
    }

    // Update time every second
    setInterval(updateCurrentTime, 1000);
    updateCurrentTime(); // Initial update
    </script> 
    </body>
    </html>