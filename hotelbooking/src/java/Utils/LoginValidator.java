package Utils;

/**
 *
 * @author PhạmVinhTiến
 */
import java.util.regex.Pattern;

public class LoginValidator {

    public String validateNameCustomer(String name) {
        String nameRegex = "^[\\p{L} ]{1,50}$";
        Pattern pattern = Pattern.compile(nameRegex);
        if (name.trim().length() == 0 || name == null) {
            return "Tên không được toàn khoảng trắng";
        } else if (!pattern.matcher(name).matches()) {
            return "Tên không hợp lệ! Chỉ bao gồm chữ cái và khoảng trắng, từ 1 đến 50 ký tự.";
        }
        return null;
    }

    public String validateEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        if (email.trim().length() == 0 || email == null) {
            return "Email không được toàn khoảng trắng";
        } else if (!pattern.matcher(email).matches()) {
            return "Email không hợp lệ!";
        }
        return null;
    }

    public String validatePassword(String password) {
        if (password == null || password.trim().length() < 6 || password.trim().length() > 15) {
            return "Mật khẩu phải từ 6-15 ký tự!";
        }
        String uppercasePattern = ".*[A-Z].*";
        String digitPattern = ".*\\d.*";
        if (!password.matches(uppercasePattern)) {
            return "Mật khẩu phải có ít nhất 1 chữ hoa!";
        }

        if (!password.matches(digitPattern)) {
            return "Mật khẩu phải có ít nhất 1 ký tự số!";
        }
        return null;
    }

    public boolean validatePasswordStaff(String password) {
        if (password == null || password.trim().length() < 6 || password.trim().length() > 15) {
            return false;
        }
        String uppercasePattern = ".*[A-Z].*";
        String digitPattern = ".*\\d.*";
        if (!password.matches(uppercasePattern)) {
            return false;
        }

        if (!password.matches(digitPattern)) {
            return false;
        }
        return true;
    }

    public String validatePhoneNumber(String phoneNumber) {
        String phoneRegex = "^(03|09|08|07|05)\\d{8}$";
        Pattern pattern = Pattern.compile(phoneRegex);
        if (phoneNumber.trim().length() == 0 || phoneNumber == null) {
            return "Số điện thoại không được để trống";
        } else if (!pattern.matcher(phoneNumber).matches()) {
            return "Số điện thoại không hợp lệ!";
        }
        return null;
    }

}
