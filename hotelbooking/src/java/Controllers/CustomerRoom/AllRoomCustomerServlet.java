/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.CustomerRoom;

import DAO.RoomDAO;
import DAO.TypeRoomDAO;
import Models.Room;
import Models.RoomType;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PhạmVinhTiến
 */
public class AllRoomCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TypeRoomDAO dao = new TypeRoomDAO();
        List<RoomType> list = dao.getRoomTypeByQuantity();
        int last = list.size();
        request.setAttribute("type1", list.get(0));
        request.setAttribute("type2", list.get(1));
        request.setAttribute("type3", list.get(2));
        request.setAttribute("listother", list.subList(3, last));
        request.getRequestDispatcher("Views/client/room.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
