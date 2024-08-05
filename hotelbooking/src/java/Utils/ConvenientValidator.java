/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

/**
 *
 * @author PhạmVinhTiến
 */
public class ConvenientValidator {

    /**
     * Validate the convenient name based on the given criteria.
     * 
     * @param convenientName the name to validate
     * @return true if the name is valid, false otherwise
     */
    public static boolean validateConvenientName(String convenientName) {
        // Check if the name is null or empty or contains only whitespace
        if (convenientName == null || convenientName.trim().isEmpty()) {
            return false;
        }

        // Check the length of the name
        if (convenientName.length() < 1 || convenientName.length() > 100) {
            return false;
        }
        return true;
    }

    /**
     * Validate the status based on the given criteria.
     * 
     * @param status the status to validate
     * @return true if the status is valid, false otherwise
     */
    public static boolean validateStatus(String status) {
        // Check if the status is null or empty or contains only whitespace
        if (status == null || status.trim().isEmpty()) {
            return false;
        }

        // Check the length of the status
        if (status.length() < 1 || status.length() > 50) {
            return false;
        }
        return true;
    }
}