package Utils;

public class ReviewsValidator {

    public static boolean isValid(String input) {
        // Check if input is not null and not just whitespace
        return input != null && input.trim().length() > 0;
    }

    public static boolean validateNewsInput(String description) {
        return isValid(description);
    }
    
    public static boolean validateReviewInput(String input) {
        if (input == null || input.trim().isEmpty()) {
            return false;
        }
        return true;
    }
}
