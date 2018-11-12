package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DBApplication;
import com.model.Login;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Login l = new Login();
		l.setUname(request.getParameter("uname"));
		l.setPass(request.getParameter("pass"));
		List<Login> lst = new ArrayList<Login>();
		lst.add(l);
		DBApplication db = new DBApplication();
		boolean b = db.validateData(lst);
		if(b)
		{
			//response.sendRedirect("Welcome.jsp");
			HttpSession session = request.getSession(true);
			session.setAttribute("data",lst);
			response.sendRedirect("LoggedUserServlet");
			//response.sendRedirect("BuyServlet");
		}
		else
		{
			response.sendRedirect("Login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
