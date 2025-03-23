package com.RealState.servlets;

import com.google.gson.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.*;
import java.time.*;
import java.time.format.DateTimeFormatter;

@WebServlet("/UserSettingsServlet")
public class UserSettingsServlet extends HttpServlet {
    private String SETTINGS_FILE;
    private final Gson gson = new GsonBuilder().setPrettyPrinting().create();
    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    @Override
    public void init() throws ServletException {
        super.init();
        SETTINGS_FILE = getServletContext().getRealPath("/WEB-INF/data/userSettings.json");
        System.out.println("Settings file path: " + SETTINGS_FILE);
        createDataDirectoryAndFile();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        JsonObject userSettings = getUserSettings(username);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(userSettings));
    }

    private JsonObject getUserSettings(String username) throws IOException {
        JsonObject settings = loadSettings();
        JsonObject users = settings.getAsJsonObject("users");
        
        if (users.has(username)) {
            return users.getAsJsonObject(username);
        }
        
        // Return default settings if user not found
        return createDefaultSettings();
    }

    private JsonObject createDefaultSettings() {
        JsonObject defaultSettings = new JsonObject();
        
        // Default profile
        JsonObject profile = new JsonObject();
        profile.addProperty("firstName", "");
        profile.addProperty("lastName", "");
        profile.addProperty("email", "");
        profile.addProperty("phone", "");
        profile.addProperty("bio", "");
        profile.addProperty("lastUpdated", getCurrentDateTime());
        defaultSettings.add("profile", profile);

        // Default preferences
        JsonObject preferences = new JsonObject();
        preferences.addProperty("language", "en");
        preferences.addProperty("timezone", "UTC");
        preferences.addProperty("lastUpdated", getCurrentDateTime());
        defaultSettings.add("preferences", preferences);

        // Default notifications
        JsonObject notifications = new JsonObject();
        notifications.addProperty("emailNotifications", true);
        notifications.addProperty("smsNotifications", true);
        notifications.addProperty("propertyUpdates", true);
        notifications.addProperty("marketingEmails", false);
        notifications.addProperty("lastUpdated", getCurrentDateTime());
        defaultSettings.add("notifications", notifications);

        return defaultSettings;
    }

    private void createDataDirectoryAndFile() {
        try {
            File dataDir = new File(SETTINGS_FILE).getParentFile();
            if (!dataDir.exists()) {
                dataDir.mkdirs();
            }

            File settingsFile = new File(SETTINGS_FILE);
            if (!settingsFile.exists()) {
                JsonObject initial = new JsonObject();
                initial.add("users", new JsonObject());
                writeSettings(initial);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private synchronized void writeSettings(JsonObject settings) throws IOException {
        File file = new File(SETTINGS_FILE);
        File backup = new File(SETTINGS_FILE + ".backup");

        // Create backup
        if (file.exists()) {
            Files.copy(file.toPath(), backup.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            gson.toJson(settings, writer);
            writer.flush();
        } catch (IOException e) {
            // Restore from backup if write fails
            if (backup.exists()) {
                Files.copy(backup.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
            throw e;
        }
    }

    private JsonObject loadSettings() throws IOException {
        File file = new File(SETTINGS_FILE);
        if (!file.exists()) {
            JsonObject initial = new JsonObject();
            initial.add("users", new JsonObject());
            writeSettings(initial);
            return initial;
        }

        try (Reader reader = new BufferedReader(new FileReader(file))) {
            return JsonParser.parseReader(reader).getAsJsonObject();
        } catch (JsonSyntaxException e) {
            JsonObject initial = new JsonObject();
            initial.add("users", new JsonObject());
            writeSettings(initial);
            return initial;
        }
    }

    private String getCurrentDateTime() {
        return ZonedDateTime.now(ZoneOffset.UTC).format(formatter);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JsonObject result = new JsonObject();

        try {
            String action = request.getParameter("action");
            String username = request.getParameter("username");

            if (action == null || username == null) {
                result.addProperty("success", false);
                result.addProperty("message", "Missing required parameters");
                out.write(gson.toJson(result));
                return;
            }

            JsonObject settings = loadSettings();
            boolean success = false;

            switch (action) {
                case "saveProfile":
                    success = saveProfileSettings(settings, request);
                    break;
                case "savePassword":
                    success = saveSecuritySettings(settings, request);
                    break;
                case "savePreferences":
                    success = savePreferenceSettings(settings, request);
                    break;
                case "saveNotifications":
                    success = saveNotificationSettings(settings, request);
                    break;
                case "saveListings":
                    success = saveListingSettings(settings, request);
                    break;
            }

            if (success) {
                writeSettings(settings);
                result.addProperty("success", true);
                result.addProperty("message", "Settings saved successfully!");
            } else {
                result.addProperty("success", false);
                result.addProperty("message", "Failed to save settings");
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.addProperty("success", false);
            result.addProperty("message", "Error: " + e.getMessage());
        }

        out.write(gson.toJson(result));
    }

    // Your existing save methods remain the same...
}