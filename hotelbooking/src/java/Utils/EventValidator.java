/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

/**
 *
 * @author PhạmVinhTiến
 */
public class EventValidator {
    public static boolean validateEventName(String eventName) {
        // Check if the name is null or empty or contains only whitespace
        if (eventName == null || eventName.trim().isEmpty()) {
            return false;
        }

        // Check the length of the name
        if (eventName.length() < 1 || eventName.length() > 100) {
            return false;
        }
        return true;
    }

    public static boolean validateEventDescription(String eventName) {
        // Check if the name is null or empty or contains only whitespace
        if (eventName == null || eventName.trim().isEmpty()) {
            return false;
        }

        // Check the length of the name
        if (eventName.length() < 1 || eventName.length() > 1000) {
            return false;
        }
        return true;
    }

    public static boolean validateEventTitle(String eventName) {
        // Check if the name is null or empty or contains only whitespace
        if (eventName == null || eventName.trim().isEmpty()) {
            return false;
        }

        // Check the length of the name
        if (eventName.length() < 1 || eventName.length() > 500) {
            return false;
        }
        return true;
    }
}
