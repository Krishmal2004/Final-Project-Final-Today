<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Property | Real Estate Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary-bg: #0f172a;
            --secondary-bg: #1e293b;
            --accent-color: #3b82f6;
            --text-light: #e2e8f0;
            --text-dark: #1e293b;
        }

        body {
            background: linear-gradient(135deg, var(--primary-bg), var(--secondary-bg));
            min-height: 100vh;
            color: var(--text-light);
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        .main-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .form-wrapper {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .time-display {
            background: rgba(0, 0, 0, 0.2);
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-size: 0.9rem;
        }

        .form-control, .form-select {
            background: rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--text-light);
            border-radius: 8px;
            padding: 0.75rem;
        }

        .form-control:focus, .form-select:focus {
            background: rgba(0, 0, 0, 0.3);
            border-color: var(--accent-color);
            color: var(--text-light);
            box-shadow: 0 0 0 0.25rem rgba(59, 130, 246, 0.25);
        }

        .form-label {
            color: var(--text-light);
            margin-bottom: 0.5rem;
        }

        .btn-primary {
            background: var(--accent-color);
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.25);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
        }

        .amenities-container {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-top: 1rem;
        }

        .amenity-tag {
            background: rgba(59, 130, 246, 0.1);
            border: 1px solid rgba(59, 130, 246, 0.2);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .remove-amenity {
            cursor: pointer;
            color: #ef4444;
        }

        .image-preview-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }

        .image-preview {
            width: 100%;
            aspect-ratio: 1;
            object-fit: cover;
            border-radius: 8px;
            border: 2px solid rgba(255, 255, 255, 0.1);
        }

        .form-section {
            background: rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .section-title {
            color: var(--accent-color);
            margin-bottom: 1.5rem;
            font-size: 1.2rem;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="form-wrapper">
            <div class="header">
                <h2>Add New Property</h2>
                <div class="time-display">
                    <i class="far fa-clock me-2"></i>
                    <span id="currentTime">2025-03-21 21:41:52</span>
                </div>
            </div>

            <form action="adding" id="propertyForm" onsubmit="saveProperty(event)">
                <div class="form-section">
                    <h3 class="section-title">Basic Information</h3>
                    <div class="row g-4">
                        <div class="col-md-6">
                            <label class="form-label">Property Title</label>
                            <input type="text" class="form-control" name="title" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Property Type</label>
                            <select class="form-select" name="type" required>
                                <option value="">Select Type</option>
                                <option value="House">House</option>
                                <option value="Apartment">Apartment</option>
                                <option value="Villa">Villa</option>
                                <option value="Commercial">Commercial</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-title">Property Details</h3>
                    <div class="row g-4">
                        <div class="col-md-6">
                            <label class="form-label">Price</label>
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <input type="number" class="form-control" name="price" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control" name="location" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Bedrooms</label>
                            <input type="number" class="form-control" name="bedrooms" min="0" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Bathrooms</label>
                            <input type="number" class="form-control" name="bathrooms" min="0" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Square Feet</label>
                            <input type="number" class="form-control" name="squareFeet" min="0" required>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-title">Additional Information</h3>
                    <div class="row g-4">
                        <div class="col-12">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" name="description" rows="4" required></textarea>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Amenities</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="amenityInput" placeholder="Add amenity">
                                <button class="btn btn-primary" type="button" onclick="addAmenity()">Add</button>
                            </div>
                            <div id="amenitiesContainer" class="amenities-container"></div>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Images</label>
                            <input type="file" class="form-control" id="imageUpload" multiple accept="image/*">
                            <div id="imagePreviewContainer" class="image-preview-container"></div>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <button type="button" class="btn btn-secondary" onclick="window.location.href='agentDashBoard.jsp'">
                        <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i>Save Property
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        let amenities = [];
        let images = [];

        function updateTime() {
            document.getElementById('currentTime').textContent = '2025-03-21 21:41:52';
        }
        setInterval(updateTime, 1000);

        function addAmenity() {
            const input = document.getElementById('amenityInput');
            const value = input.value.trim();
            
            if (value && !amenities.includes(value)) {
                amenities.push(value);
                updateAmenitiesDisplay();
            }
            input.value = '';
        }

        function removeAmenity(index) {
            amenities.splice(index, 1);
            updateAmenitiesDisplay();
        }

        function updateAmenitiesDisplay() {
            const container = document.getElementById('amenitiesContainer');
            container.innerHTML = amenities.map((amenity, index) => `
                <div class="amenity-tag">
                    ${amenity}
                    <span class="remove-amenity" onclick="removeAmenity(${index})">×</span>
                </div>
            `).join('');
        }

        document.getElementById('imageUpload').addEventListener('change', function(e) {
            const container = document.getElementById('imagePreviewContainer');
            container.innerHTML = '';
            images = [];

            Array.from(e.target.files).forEach(file => {
                const reader = new FileReader();
                reader.onload = function(e) {
                    container.innerHTML += `
                        <img src="${e.target.result}" class="image-preview" alt="Property Image">
                    `;
                    images.push(file.name);
                }
                reader.readAsDataURL(file);
            });
        });

        function saveProperty(event) {
            event.preventDefault();
            const form = event.target;
            const formData = new FormData(form);

            const propertyData = {
                agentId: 'Krishmal2004',
                title: formData.get('title'),
                type: formData.get('type'),
                price: parseFloat(formData.get('price')),
                location: formData.get('location'),
                bedrooms: parseInt(formData.get('bedrooms')),
                bathrooms: parseInt(formData.get('bathrooms')),
                squareFeet: parseFloat(formData.get('squareFeet')),
                description: formData.get('description'),
                amenities: amenities,
                images: images,
                status: 'Active',
                featured: false
            };

            fetch('PropertyManagementServlet/add', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(propertyData)
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    alert('Property added successfully!');
                    window.location.href = 'agentDashBoard.jsp';
                } else {
                    alert('Error: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to add property. Please try again.');
            });
        }
    </script>
</body>
</html>