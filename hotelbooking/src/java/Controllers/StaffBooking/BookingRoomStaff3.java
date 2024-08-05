/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.StaffBooking;

import DAO.BookingDAO;
import Models.Booking;
import Models.Customer;
import Models.Staff;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author PhạmVinhTiến
 */
public class BookingRoomStaff3 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        float total = 0, event = 0, endTotal = 0;
        if (session != null && session.getAttribute("listBookingFlex") != null && session.getAttribute("cusBooking") != null) {
            Customer cus = (Customer) session.getAttribute("cusBooking");
            List<Booking> listBookingFlex = (List<Booking>) session.getAttribute("listBookingFlex");
            for (Booking listBooking : listBookingFlex) {
                total += listBooking.calculateTotalPriceNotEvent();
                if (listBooking.getEvent().size() != 0) {
                    event = listBooking.getEvent().get(0).getDiscountPercent();
                }
            }
            endTotal = total - (total) * (event + cus.getTypeCustomer().getDiscount()) / 100;
            endTotal = (float) (endTotal + endTotal * 0.1);
            request.setAttribute("total", total);
            request.setAttribute("event", event);
            request.setAttribute("endTotal", endTotal);
        }
        request.getRequestDispatcher("Views/admin/booking-infor3.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("listBookingFlex") != null
                && session.getAttribute("emailStaff") != null && session.getAttribute("cusBooking") != null) {
            BookingDAO bookingDAO = new BookingDAO();
            List<Booking> listBookingFlex = (List<Booking>) session.getAttribute("listBookingFlex");
            Staff staff = (Staff) session.getAttribute("emailStaff");
            Customer cus = (Customer) session.getAttribute("cusBooking");
            float discountPerent = cus.getTypeCustomer().getDiscount();
            float totalPriceF = 0;
            int reserId = bookingDAO.addNewBookingByStaffSingle(listBookingFlex.get(0), staff);
            
            if (listBookingFlex.size() > 1) {
                for (int i = 1; i < listBookingFlex.size(); i++) {
                    float totalI = listBookingFlex.get(i).calculateTotalPriceNotEvent1();
                    System.out.println(totalI + " " + discountPerent);
                    if (listBookingFlex.get(i).getEvent().size() != 0) {
                        totalPriceF = (float) (totalI - (totalI * ((discountPerent + listBookingFlex.get(i).getEvent().get(0).getDiscountPercent()) / 100)));
                        totalPriceF += totalPriceF * 0.1;
                    } else {
                        totalPriceF = (float) (totalI - (totalI * ((discountPerent + listBookingFlex.get(i).getEvent().get(0).getDiscountPercent()) / 100)));
                        totalPriceF += totalPriceF * 0.1;
                    }
                    Booking listBooking = listBookingFlex.get(i);
                    listBooking.setTotalPrice(totalPriceF);
                    bookingDAO.addNewBookingByStaff(listBooking, staff, reserId, discountPerent);
                    totalPriceF = 0;
                }
            }
            request.setAttribute("mess", "Đặt phòng thành công");
            request.getRequestDispatcher("Views/admin/booking-infor3.jsp").forward(request, response);
        }
    }
}
