package com.guild.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guild.dao.ScholarDAO;
import com.guild.dao.HashGenerator;
import com.guild.entity.Scholar;

public class ScholarServices extends CommonUtility {
	
	private ScholarDAO scholarDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public ScholarServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.scholarDAO = new ScholarDAO();
	}
	
	public void listScholars(String message) throws ServletException, IOException {
		List<Scholar> listScholar = scholarDAO.listAll();		
		request.setAttribute("listScholar", listScholar);
		forwardToPage("scholar_list.jsp", message, request, response);
	}
	
	public void listScholars() throws ServletException, IOException {
		listScholars(null);
	}
	
	public void createScholar() throws ServletException, IOException {
		String email = request.getParameter("email");
		Scholar existScholar = scholarDAO.findByEmail(email);
		
		if (existScholar != null) {
			String message = "Could not create new scholar: the email "
					+ email + " is already registered by another scholar.";
			listScholars(message);
			
		} else {
			Scholar newScholar = new Scholar();
			updateScholarFieldsFromForm(newScholar);
			scholarDAO.create(newScholar);
			
			String message = "New scholar has been created successfully.";
			listScholars(message);
			
		}
		
	}
	
	private void updateScholarFieldsFromForm(Scholar scholar) {
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");
		
		if (email != null && !email.equals("")) {
			scholar.setEmail(email);
		}
		
		scholar.setFullname(fullname);
		
		if (password != null & !password.isEmpty()) {
			String encryptedPassword = HashGenerator.generateMD5(password);
			scholar.setPassword(encryptedPassword);				
		}		
		
		scholar.setPhone(phone);
		scholar.setAddress(address);
		scholar.setCity(city);
		scholar.setZipcode(zipcode);
		scholar.setCountry(country);		
	}

 	public void registerScholar() throws ServletException, IOException {
		String email = request.getParameter("email");
		Scholar existScholar = scholarDAO.findByEmail(email);
		String message = "";
		
		if (existScholar != null) {
			message = "Could not register. The email "
					+ email + " is already registered by another scholar.";
		} else {
			
			Scholar newScholar = new Scholar();
			updateScholarFieldsFromForm(newScholar);			
			scholarDAO.create(newScholar);
			
			message = "You have registered successfully! Thank you.<br/>"
					+ "<a href='login'>Click here</a> to login";			
		}
		
		showMessageFrontend(message, request, response);
	}	
	
	public void editScholar() throws ServletException, IOException {
		Integer scholarId = Integer.parseInt(request.getParameter("id"));
		Scholar scholar = scholarDAO.get(scholarId);
		
		if (scholar == null) {
			String message = "Could not find scholar with ID " + scholarId;
			showMessageBackend(message, request, response);
		} else {
			// set password as null to make the password is left blank by default
			// if left blank, the scholar's password won't be updated
			// this is to work with the encrypted password feature
			scholar.setPassword(null);
			request.setAttribute("scholar", scholar);		
			forwardToPage("scholar_form.jsp", request, response);			
		}		
	}

	public void updateScholar() throws ServletException, IOException {
		Integer scholarId = Integer.parseInt(request.getParameter("scholarId"));
		String email = request.getParameter("email");
		
		Scholar scholarByEmail = scholarDAO.findByEmail(email);
		String message = null;
		
		if (scholarByEmail != null && scholarByEmail.getScholarId() != scholarId) {
			message = "Could not update the scholar ID " + scholarId
					+ "because there's an existing scholar having the same email.";
			
		} else {
			
			Scholar scholarById = scholarDAO.get(scholarId);
			updateScholarFieldsFromForm(scholarById);
			
			scholarDAO.update(scholarById);
			
			message = "The scholar has been updated successfully.";
		}
		
		listScholars(message);
	}

	public void deleteScholar() throws ServletException, IOException {
		Integer scholarId = Integer.parseInt(request.getParameter("id"));
		Scholar scholar = scholarDAO.get(scholarId);
		
		if (scholar != null) {
			scholarDAO.delete(scholarId);			
			String message = "The scholar has been deleted successfully.";
			listScholars(message);
		} else {
			String message = "Could not find scholar with ID " + scholarId + ", "
					+ "or it has been deleted by another admin";
			showMessageBackend(message, request, response);
		}
		
	}

	public void showLogin() throws ServletException, IOException {
		forwardToPage("frontend/login.jsp", request, response);
	}

	public void doLogin() throws ServletException, IOException {
		System.out.println("111111111");
		String email = request.getParameter("email");
		System.out.println("22222"+email);
		String password = request.getParameter("password");
		System.out.println("333333"+password);
		
		Scholar scholar = scholarDAO.checkLogin(email, password);
		
		if (scholar == null) {
			String message = "Login failed. Please check your email and password.";
			request.setAttribute("message", message);
			showLogin();
			
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loggedScholar", scholar);
			
			Object objRedirectURL = session.getAttribute("redirectURL");
			
			if (objRedirectURL != null) {
				String redirectURL = (String) objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			} else {
				showScholarProfile();
			}
		}
	}
	
	public void showScholarProfile() throws ServletException, IOException {
		forwardToPage("frontend/scholar_profile.jsp", request, response);
	}

	public void showScholarProfileEditForm() throws ServletException, IOException {
		forwardToPage("frontend/edit_profile.jsp", request, response);
	}

	public void updateScholarProfile() throws ServletException, IOException {
		Scholar scholar = (Scholar) request.getSession().getAttribute("loggedScholar");
		updateScholarFieldsFromForm(scholar);
		scholarDAO.update(scholar);
		
		showScholarProfile();
		
	}
}
