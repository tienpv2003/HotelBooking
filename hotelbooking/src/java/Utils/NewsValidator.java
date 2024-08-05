/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

/**
 *
 * @author PhạmVinhTiến
 */
public class NewsValidator {

    public static boolean isValid(String input) {
        // Check if input is not null and not just whitespace
        return input != null && input.trim().length() > 0;
    }

    public static boolean validateNewsInput(String title, String status, String description, String content) {
        return isValid(title) && isValid(status) && isValid(description) && isValid(content);
    }
}
