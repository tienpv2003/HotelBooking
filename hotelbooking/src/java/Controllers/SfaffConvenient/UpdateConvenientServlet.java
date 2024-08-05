/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.SfaffConvenient;

import DAO.ConvenientDAO;
import Models.Convenient;
import Utils.ConvenientValidator;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author PhạmVinhTiến
 */
public class UpdateConvenientServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ConvenientDAO cdao = new ConvenientDAO();
        Convenient convenient = cdao.findById(id);
        request.setAttribute("convenient", convenient);
        request.getRequestDispatcher("Views/admin/edit-convenient.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String status = request.getParameter("status");

        String errorMess = null;
        String successMess = null;

        // Validate the convenient name
        if (!ConvenientValidator.validateConvenientName(name)) {
            errorMess = "Tên tiện ích không hợp lệ";
            request.setAttribute("errorMess", errorMess);
            request.getRequestDispatcher("Views/admin/edit-convenient.jsp").forward(request, response);
            return;
        }

        // Validate the status
        if (!ConvenientValidator.validateStatus(status)) {
            errorMess = "Trạng thái không hợp lệ";
            request.setAttribute("errorMess", errorMess);
            request.getRequestDispatcher("Views/admin/edit-convenient.jsp").forward(request, response);
            return;
        }

        ConvenientDAO cdao = new ConvenientDAO();
        Convenient convenient = new Convenient(name, status);
        convenient.setConvenientId(id);

        boolean updated = cdao.update(convenient);

        if (updated) {
            successMess = "Cập nhật tiện ích thành công";
            request.setAttribute("successMess", successMess);
        } else {
            errorMess = "Cập nhật tiện ích thất bại";
            request.setAttribute("errorMess", errorMess);
        }

        request.getRequestDispatcher("Views/admin/edit-convenient.jsp").forward(request, response);
    }

}
