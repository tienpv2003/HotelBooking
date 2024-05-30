package Models;

public class CaptchaInfo {
    private String captcha;
    private String email;
    private long expiryTime;

    public CaptchaInfo(String captcha, String email, long expiryTime) {
        this.captcha = captcha;
        this.email = email;
        this.expiryTime = expiryTime;
    }

    public String getCaptcha() {
        return captcha;
    }

    public String getEmail() {
        return email;
    }

    public long getExpiryTime() {
        return expiryTime;
    }

    public boolean isExpired() {
        return System.currentTimeMillis() > expiryTime;
    }

    @Override
    public String toString() {
        return "CaptchaInfo{" +
                "captcha='" + captcha + '\'' +
                ", email='" + email + '\'' +
                ", expiryTime=" + expiryTime +
                '}';
    }
}
