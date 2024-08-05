/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.HomePage;

import DAO.EventDAO;
import DAO.NewsDAO;
import DAO.ReviewDAO;
import DAO.ServiceDAO;
import DAO.TypeRoomDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class HomeServlet extends HttpServlet {
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        NewsDAO ndao = new NewsDAO();
        ReviewDAO rdao = new ReviewDAO();
        TypeRoomDAO typeDao = new TypeRoomDAO();
        ServiceDAO sdao= new ServiceDAO();
        EventDAO edao= new EventDAO();
        
        //lay list type room 
        request.setAttribute("listTypeRoom", typeDao.topFourTypeRoom());   
        request.setAttribute("list3news", ndao.getTop3News());    
        request.setAttribute("list5services", sdao.getTop5ActiveServices());
        request.setAttribute("listeventtitle", edao.getAllActive());
        
        request.setAttribute("newReview", rdao.getReviewsActive().get(0));    
        request.setAttribute("oldReview", rdao.getReviewsActive()
                .subList(1, rdao.getReviewsActive().size()));
        request.getRequestDispatcher("Views/client/index.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
