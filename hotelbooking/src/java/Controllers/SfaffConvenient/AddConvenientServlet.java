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
public class AddConvenientServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/admin/add-convenient.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String status = request.getParameter("status");;
        String errorMess = "";
        String successMess = "";

        // Validate the convenient name
        if (!ConvenientValidator.validateConvenientName(name)) {
            errorMess = "Tên tiện ích không hợp lệ";
            request.setAttribute("errorMess", errorMess);
            request.getRequestDispatcher("Views/admin/add-convenient.jsp").forward(request, response);
            return;
        }

        // Validate the status
        if (!ConvenientValidator.validateStatus(status)) {
            errorMess = "Trạng thái không hợp lệ";
            request.setAttribute("errorMess", errorMess);
            request.getRequestDispatcher("Views/admin/add-convenient.jsp").forward(request, response);
            return;
        }

        ConvenientDAO cdao = new ConvenientDAO();
        Convenient convenient = new Convenient(name, status);
        boolean addedConvenient;
        addedConvenient = cdao.insert(convenient);
        if (addedConvenient == true) {
            successMess = "Thêm tiện ích thành công";
            request.setAttribute("successMess", successMess);
        } else {
            errorMess = "Thêm tiện ích thất bại";
            request.setAttribute("errorMess", errorMess);
        }
        request.getRequestDispatcher("Views/admin/add-convenient.jsp").forward(request, response);

    }

}
