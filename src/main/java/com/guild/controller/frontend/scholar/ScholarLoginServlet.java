package com.guild.controller.frontend.scholar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guild.service.ScholarServices;

@WebServlet("/login")
public class ScholarLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ScholarLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ScholarServices scholarServices = new ScholarServices(request, response);
		scholarServices.showLogin();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ScholarServices scholarServices = new ScholarServices(request, response);
		scholarServices.doLogin();
	}

}