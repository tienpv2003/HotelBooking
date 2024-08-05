/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.BookingFlex;

import DAO.BookingDAO;
import Models.Booking;
import Models.Customer;
import Models.Item;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author PhạmVinhTiến
 */
public class ResultPaymentFlexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        if ("00".equals(vnp_ResponseCode)) {
            HttpSession session = request.getSession(false);
            Customer customer = (Customer) session.getAttribute("cusObj");
            if (session != null && session.getAttribute("listBookingFlex") != null) {
                BookingDAO bookingDAO = new BookingDAO();
                List<Booking> listBookingFlex = (List<Booking>) session.getAttribute("listBookingFlex");
                float discountPerent = customer.getTypeCustomer().getDiscount();
                float totalPriceF = 0;
                int reserId = bookingDAO.addNewBooking(listBookingFlex.get(0));
                if (listBookingFlex.size() > 1) {
                    for (int i = 1; i < listBookingFlex.size(); i++) {
                        float totalI = listBookingFlex.get(i).calculateTotalPriceNotEvent1();
                        System.out.println(totalI + " " + discountPerent);
                        if (listBookingFlex.get(i).getEvent().size() != 0) {
                            totalPriceF = (float) (totalI - (totalI * ((discountPerent + listBookingFlex.get(i).getEvent().get(0).getDiscountPercent()) / 100)));
                            totalPriceF +=  totalPriceF * 0.1;
                        } else {
                            totalPriceF = (float) (totalI - (totalI * ((discountPerent + listBookingFlex.get(i).getEvent().get(0).getDiscountPercent()) / 100)));
                            totalPriceF +=  totalPriceF * 0.1;
                        }
                        Booking listBooking = listBookingFlex.get(i);
                        listBooking.setTotalPrice(totalPriceF);
                        bookingDAO.addNewBookingFlex(listBooking, reserId, discountPerent);
                        totalPriceF = 0;
                    }
                }
                String from = "DuongHNHHE172270@fpt.edu.vn";
                String password = "jyor qphe gomb kvgt";

                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");

                Authenticator auth = new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, password);
                    }
                };

                Session session1 = Session.getInstance(props, auth);

                try {
                    MimeMessage msg = new MimeMessage(session1);
                    msg.setFrom(new InternetAddress(from));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(customer.getEmail()));
                    msg.setSubject("=?UTF-8?B?" + Base64.getEncoder().encodeToString("Hóa đơn thanh toán".getBytes("UTF-8")) + "?=");
                    NumberFormat currencyFormatter = NumberFormat.getInstance();
                    currencyFormatter.setGroupingUsed(true);

                    SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
                    String paymentDate = dateFormatter.format(new java.util.Date());

                    String startDate = dateFormatter.format(listBookingFlex.get(0).getStartDate());
                    String endDate = dateFormatter.format(listBookingFlex.get(0).getEndDate());

                    StringBuilder emailContent = new StringBuilder();
                    emailContent.append("<!DOCTYPE html>")
                            .append("<html lang=\"en\">")
                            .append("<head>")
                            .append("<meta charset=\"UTF-8\">")
                            .append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">")
                            .append("<title>Hóa đơn thanh toán</title>")
                            .append("<style>")
                            .append("body { font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; margin: 0; padding: 20px; }")
                            .append(".container { max-width: 600px; margin: 0 auto; background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }")
                            .append("h1 { color: #007BFF; }")
                            .append("p { font-size: 16px; line-height: 1.5; }")
                            .append(".details { margin-bottom: 20px; }")
                            .append(".details p { margin: 5px 0; }")
                            .append(".total-price { font-size: 24px; color: #FF5733; font-weight: bold; }")
                            .append("</style>")
                            .append("</head>")
                            .append("<body>")
                            .append("<div class=\"container\">")
                            .append("<h1>Hóa đơn thanh toán</h1>")
                            .append("<p>Chào ").append(customer.getFirstName()).append(" ").append(customer.getLastName()).append(",</p>")
                            .append("<p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi. Dưới đây là chi tiết hóa đơn của bạn:</p>")
                            .append("<div class=\"details\">")
                            .append("<p><strong>Email:</strong> ").append(customer.getEmail()).append("</p>")
                            .append("<p><strong>Phòng đã đặt:</strong></p>");
                    float total = 0, event = 0, endTotal = 0;
                    for (Booking _booking : listBookingFlex) {
                        total += _booking.calculateTotalPriceNotEvent();
                        if (_booking.getEvent().size() != 0) {
                            event = _booking.getEvent().get(0).getDiscountPercent();
                        }
                        for (Item item : _booking.getListItem()) {
                            emailContent.append("<p>").append(item.getRoom().getRoomName())
                                    .append(" - Giá: ").append(currencyFormatter.format(item.getPrice())).append("</p>");
                        }
                    }
                    endTotal = total - (total) * (event + discountPerent) / 100;
                    endTotal = (float) (endTotal + endTotal * 0.1);

                    emailContent.append("<p><strong>Ngày nhận phòng:</strong> ").append(startDate).append("</p>")
                            .append("<p><strong>Ngày trả phòng:</strong> ").append(endDate).append("</p>")
                            .append("<p><strong>Ngày thanh toán:</strong> ").append(paymentDate).append("</p>")
                            .append("</div>")
                            .append("<p class=\"total-price\">Tổng tiền: ").append(currencyFormatter.format(endTotal)).append("</p>")
                            .append("<p>Cảm ơn quý khách đã sử dụng dịch vụ của chúng tôi!</p>")
                            .append("</div>")
                            .append("</body>")
                            .append("</html>");

                    msg.setContent(emailContent.toString(), "text/html; charset=UTF-8");

                    Transport.send(msg);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("message", "Failed to send email.");
                }
            }

            request.setAttribute("msgPayment", vnp_TxnRef);
            session.removeAttribute("listBookingFlex");
            request.getRequestDispatcher("Views/client/result-payment.jsp").forward(request, response);

        } else {
            request.setAttribute("msgPayment", vnp_ResponseCode);
            request.getRequestDispatcher("Views/client/result-payment.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
