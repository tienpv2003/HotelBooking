/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import Models.CaptchaInfo;
import java.util.concurrent.ConcurrentHashMap;

public class CaptchaStore {

    private static final ConcurrentHashMap<String, CaptchaInfo> instance = new ConcurrentHashMap<>();

    private CaptchaStore() {
    }

    public static ConcurrentHashMap<String, CaptchaInfo> getInstance() {
        return instance;
    }
}
