package com.guild.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guild.dao.ScholarDAO;
import com.guild.dao.UserDAO;


@WebServlet("/admin/")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminHomeServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ScholarDAO scholarDAO = new ScholarDAO();
    	UserDAO userDAO = new UserDAO();
    	
    	long totalScholars = scholarDAO.count();
    	long totalAdmins = userDAO.count();
    	
    	String homepage = "index.jsp";
		
		request.setAttribute("totalScholars", totalScholars);
		request.setAttribute("totalAdmins", totalAdmins);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);

	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
