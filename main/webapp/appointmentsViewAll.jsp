<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Appointments</title>
    <link rel="stylesheet" href="appointmnetsViewAllstyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <header>
            <h1>Appointments Dashboard</h1>
        </header>
        
        <main>
            <div class="dashboard-header">
                <h2>Customer Appointments</h2>
            </div>
            
            <div class="appointments-grid">
                <!-- Appointment Card 1 -->
                <div class="appointment-card" id="appointment-1">
                    <div class="card-header">
                        <div class="appointment-date">2025-03-25</div>
                        <div class="appointment-time">9:30 AM</div>
                    </div>
                    <div class="card-body">
                        <div class="property-info">
                            <h3 class="property-name">Seaside Villa</h3>
                            <div class="customer-name"><span>Customer:</span> John Smith</div>
                        </div>
                        <div class="appointment-details">
                            <div class="appointment-duration"><span>Duration:</span> 60 mins</div>
                        </div>
                    </div>
                    <div class="card-actions">
                        <button class="btn-edit" onclick="openEditModal(1)">Edit</button>
                        <button class="btn-delete" onclick="confirmDelete(1)">Delete</button>
                    </div>
                </div>

                <!-- Appointment Card 2 -->
                <div class="appointment-card" id="appointment-2">
                    <div class="card-header">
                        <div class="appointment-date">2025-03-26</div>
                        <div class="appointment-time">11:00 AM</div>
                    </div>
                    <div class="card-body">
                        <div class="property-info">
                            <h3 class="property-name">Mountain View Apartment</h3>
                            <div class="customer-name"><span>Customer:</span> Sarah Johnson</div>
                        </div>
                        <div class="appointment-details">
                            <div class="appointment-duration"><span>Duration:</span> 45 mins</div>
                        </div>
                    </div>
                    <div class="card-actions">
                        <button class="btn-edit" onclick="openEditModal(2)">Edit</button>
                        <button class="btn-delete" onclick="confirmDelete(2)">Delete</button>
                    </div>
                </div>

                <!-- Appointment Card 3 -->
                <div class="appointment-card" id="appointment-3">
                    <div class="card-header">
                        <div class="appointment-date">2025-03-28</div>
                        <div class="appointment-time">2:15 PM</div>
                    </div>
                    <div class="card-body">
                        <div class="property-info">
                            <h3 class="property-name">City Center Office</h3>
                            <div class="customer-name"><span>Customer:</span> Michael Brown</div>
                        </div>
                        <div class="appointment-details">
                            <div class="appointment-duration"><span>Duration:</span> 90 mins</div>
                        </div>
                    </div>
                    <div class="card-actions">
                        <button class="btn-edit" onclick="openEditModal(3)">Edit</button>
                        <button class="btn-delete" onclick="confirmDelete(3)">Delete</button>
                    </div>
                </div>

                <!-- Appointment Card 4 -->
                <div class="appointment-card" id="appointment-4">
                    <div class="card-header">
                        <div class="appointment-date">2025-04-01</div>
                        <div class="appointment-time">10:00 AM</div>
                    </div>
                    <div class="card-body">
                        <div class="property-info">
                            <h3 class="property-name">Lakeside Cottage</h3>
                            <div class="customer-name"><span>Customer:</span> Emma Wilson</div>
                        </div>
                        <div class="appointment-details">
                            <div class="appointment-duration"><span>Duration:</span> 60 mins</div>
                        </div>
                    </div>
                    <div class="card-actions">
                        <button class="btn-edit" onclick="openEditModal(4)">Edit</button>
                        <button class="btn-delete" onclick="confirmDelete(4)">Delete</button>
                    </div>
                </div>

                <!-- Appointment Card 5 -->
                <div class="appointment-card" id="appointment-5">
                    <div class="card-header">
                        <div class="appointment-date">2025-04-02</div>
                        <div class="appointment-time">3:30 PM</div>
                    </div>
                    <div class="card-body">
                        <div class="property-info">
                            <h3 class="property-name">Downtown Penthouse</h3>
                            <div class="customer-name"><span>Customer:</span> Robert Davis</div>
                        </div>
                        <div class="appointment-details">
                            <div class="appointment-duration"><span>Duration:</span> 30 mins</div>
                        </div>
                    </div>
                    <div class="card-actions">
                        <button class="btn-edit" onclick="openEditModal(5)">Edit</button>
                        <button class="btn-delete" onclick="confirmDelete(5)">Delete</button>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h2>Edit Appointment</h2>
            <form action="edit" id="editForm">
                <input type="hidden" id="appointmentId">
                <div class="form-group">
                    <label for="appointmentDate">Date:</label>
                    <input type="date" id="appointmentDate" required>
                </div>
                <div class="form-group">
                    <label for="appointmentTime">Time:</label>
                    <input type="time" id="appointmentTime" required>
                </div>
                <div class="form-group">
                    <label for="appointmentDuration">Duration (minutes):</label>
                    <input type="number" id="appointmentDuration" min="15" step="15" required>
                </div>
                <div class="form-group">
                    <label for="propertyName">Property Name:</label>
                    <input type="text" id="propertyName" required>
                </div>
                <div class="form-group">
                    <label for="customerName">Customer:</label>
                    <input type="text" id="customerName" required>
                </div>
                <div class="form-actions">
                    <button type="button" onclick="closeModal()">Cancel</button>
                    <button type="submit">Save Changes</button>
                </div>
            </form>
        </div>
    </div>

    <script src="appointmentsViewAllscript.js"></script>
</body>
</html>