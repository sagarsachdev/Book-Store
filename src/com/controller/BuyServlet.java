package com.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DBApplication;
import com.model.Login;
import com.model.User;

/**
 * Servlet implementation class BuyServlet
 */
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBApplication db = new DBApplication();
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("uname"); //uname of logged in user
		User u = new User();
		u.setUname(name);
		List<User> ls = db.getUser(u);
		if(ls.get(0).getBalance()>1000) {
			List<Login> c=(List<Login>)session.getAttribute("data"); //List containing username of logged in user
			int j = db.buyBook(c);
			if(j>0) {
				response.sendRedirect("Confirm.jsp");
			}else {
				response.sendRedirect("Welcome.jsp");
			}
		}else {
			response.sendRedirect("Welcome.jsp");
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
