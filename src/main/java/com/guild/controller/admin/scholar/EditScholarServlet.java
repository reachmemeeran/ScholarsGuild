package com.guild.controller.admin.scholar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guild.service.ScholarServices;

@WebServlet("/admin/edit_scholar")
public class EditScholarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditScholarServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ScholarServices scholarServices = new ScholarServices(request, response);
		scholarServices.editScholar();
	}

}
