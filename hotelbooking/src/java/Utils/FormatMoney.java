package Utils;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

/**
 *
 * @author PhạmVinhTiến
 */
public class FormatMoney {

    public String formatMoney(double money) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(new Locale("vi", "VN"));
        symbols.setGroupingSeparator('.');
        DecimalFormat decimalFormat = new DecimalFormat("#,##0", symbols);
        String formattedAmount = decimalFormat.format(money) + " VND";
        return formattedAmount;
    }
}