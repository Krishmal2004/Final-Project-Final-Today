package com.RealState.servlets;

import com.google.gson.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.*;
import java.util.*;
import java.text.SimpleDateFormat;

@WebServlet("/PropertyManagementServlet/*")
public class PropertyManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Gson gson = new GsonBuilder()
            .setPrettyPrinting()
            .serializeNulls()
            .create();
    private static final String DATA_FILE = "C:\\Users\\user\\Downloads\\project\\RealState\\src\\main\\webapp\\WEB-INF\\data\\properties.json";
    private static final String CURRENT_TIMESTAMP = "2025-03-21 22:12:27";
    
    // Property model class
    private static class Property {
        String propertyId;
        String agentId;
        String title;
        String type;
        double price;
        String location;
        int bedrooms;
        int bathrooms;
        double squareFeet;
        String description;
        List<String> amenities;
        List<String> images;
        String status;
        String createdDate;
        String updatedDate;
        boolean featured;

        public Property() {
            this.propertyId = "PROP" + System.currentTimeMillis();
            this.createdDate = CURRENT_TIMESTAMP;
            this.updatedDate = CURRENT_TIMESTAMP;
            this.status = "Active";
            this.featured = false;
            this.amenities = new ArrayList<>();
            this.images = new ArrayList<>();
        }
    }

    private static class PropertyData {
        List<Property> properties;
        String lastUpdated;
        
        public PropertyData() {
            properties = new ArrayList<>();
            lastUpdated = CURRENT_TIMESTAMP;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Read and parse the JSON data from request
            String jsonData = readRequestData(request);
            Property newProperty = gson.fromJson(jsonData, Property.class);
            
            // Validate the property data
            validatePropertyData(newProperty);
            
            // Load existing data
            PropertyData data = loadPropertyData();
            
            // Add new property
            data.properties.add(newProperty);
            data.lastUpdated = CURRENT_TIMESTAMP;
            
            // Save to file
            savePropertyData(data);

            // Send success response
            sendSuccessResponse(out, newProperty.propertyId);

        } catch (Exception e) {
            sendErrorResponse(out, e.getMessage());
        }
    }

    private String readRequestData(HttpServletRequest request) throws IOException {
        StringBuilder jsonBuilder = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
            }
        }
        return jsonBuilder.toString();
    }

    private void validatePropertyData(Property property) throws Exception {
        if (property.title == null || property.title.trim().isEmpty()) {
            throw new Exception("Property title is required");
        }
        if (property.price <= 0) {
            throw new Exception("Invalid property price");
        }
        if (property.location == null || property.location.trim().isEmpty()) {
            throw new Exception("Property location is required");
        }
    }

    private PropertyData loadPropertyData() throws IOException {
        String filePath =(DATA_FILE);
        File file = new File(filePath);
        
        // Ensure directory exists
        File dir = file.getParentFile();
        if (!dir.exists()) {
            dir.mkdirs();
        }
        
        // Create new file if it doesn't exist
        if (!file.exists()) {
            PropertyData emptyData = new PropertyData();
            savePropertyData(emptyData);
            return emptyData;
        }
        
        // Read existing data
        try (Reader reader = new FileReader(file)) {
            PropertyData data = gson.fromJson(reader, PropertyData.class);
            return data != null ? data : new PropertyData();
        } catch (JsonSyntaxException e) {
            throw new IOException("Invalid JSON data in file: " + e.getMessage());
        }
    }

    private void savePropertyData(PropertyData data) throws IOException {
        String filePath = (DATA_FILE);
        System.out.println(filePath);
        
        // Create backup before saving
        File originalFile = new File(filePath);
        if (originalFile.exists()) {
            File backupFile = new File(filePath + ".backup");
            copyFile(originalFile, backupFile);
        }
        
        // Save new data
        try (Writer writer = new FileWriter(filePath)) {
            gson.toJson(data, writer);
        }
    }

    private void copyFile(File source, File dest) throws IOException {
        try (InputStream in = new FileInputStream(source);
             OutputStream out = new FileOutputStream(dest)) {
            byte[] buffer = new byte[1024];
            int length;
            while ((length = in.read(buffer)) > 0) {
                out.write(buffer, 0, length);
            }
        }
    }

    private void sendSuccessResponse(PrintWriter out, String propertyId) {
        JsonObject response = new JsonObject();
        response.addProperty("status", "success");
        response.addProperty("message", "Property added successfully");
        response.addProperty("propertyId", propertyId);
        response.addProperty("timestamp", CURRENT_TIMESTAMP);
        out.println(gson.toJson(response));
    }

    private void sendErrorResponse(PrintWriter out, String message) {
        JsonObject error = new JsonObject();
        error.addProperty("status", "error");
        error.addProperty("message", message);
        error.addProperty("timestamp", CURRENT_TIMESTAMP);
        out.println(gson.toJson(error));
    }
}