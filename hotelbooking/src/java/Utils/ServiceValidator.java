/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

/**
 *
 * @author PhạmVinhTiến
 */
public class ServiceValidator {

    public static boolean validateServiceName(String serviceName) {
        // Check if the name is null or empty or contains only whitespace
        if (serviceName == null || serviceName.trim().isEmpty()) {
            return false;
        }

        // Check the length of the name
        if (serviceName.length() < 1 || serviceName.length() > 100) {
            return false;
        }
        return true;
    }

    public static boolean validateServiceDescription(String serviceName) {
        // Check if the name is null or empty or contains only whitespace
        if (serviceName == null || serviceName.trim().isEmpty()) {
            return false;
        }

        // Check the length of the name
        if (serviceName.length() < 1 || serviceName.length() > 100) {
            return false;
        }
        return true;
    }

    public static boolean validateServiceTitle(String serviceName) {
        // Check if the name is null or empty or contains only whitespace
        if (serviceName == null || serviceName.trim().isEmpty()) {
            return false;
        }

        // Check the length of the name
        if (serviceName.length() < 1 || serviceName.length() > 100) {
            return false;
        }
        return true;
    }

    public static boolean validateServiceStatus(String status) {
        // Check if the status is null or empty or contains only whitespace
        if (status == null || status.trim().isEmpty()) {
            return false;
        }

        // Check the length of the status
        if (status.length() < 1 || status.length() > 20) {
            return false;
        }
        return true;
    }
}
