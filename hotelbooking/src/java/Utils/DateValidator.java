/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;



/**
 *
 * @author admin
 */
public class DateValidator {

    public static boolean isValidDate(int day, int month, int year) {
        // Validate day of month
        if (day < 1 || day > 31) {
            return false;
        }

        // Validate month
        if (month < 1 || month > 12) {
            return false;
        }

        // Validate year
        if (!isValidYear(year)) {
            return false;
        }

        // Validate specific days for months
        if (!isValidDay(day, month, year)) {
            return false;
        }

        return true;
    }

    public static boolean isValidYear(int year) {
        return year >= 1900 && year <= 2100;
    }

    public static boolean isValidMonth(int month) {
        return month >= 1 && month <= 12;
    }

    public static boolean isValidDay(int day, int month, int year) {
        switch (month) {
            case 4: // April
            case 6: // June
            case 9: // September
            case 11: // November
                return day <= 30;
            case 2: // February
                if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
                    // Leap year
                    return day <= 29;
                } else {
                    // Non-leap year
                    return day <= 28;
                }
            default:
                return day <= 31;
        }
    }
}
