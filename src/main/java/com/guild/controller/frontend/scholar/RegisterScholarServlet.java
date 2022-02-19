package com.guild.controller.frontend.scholar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guild.service.ScholarServices;

@MultipartConfig
@WebServlet("/register_scholar")
public class RegisterScholarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterScholarServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ScholarServices scholarServices = new ScholarServices(request, response);
		scholarServices.registerScholar();
	}

}
