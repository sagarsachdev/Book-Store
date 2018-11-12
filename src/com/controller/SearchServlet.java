package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.User;

import com.dao.DBApplication;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			DBApplication db = new DBApplication();
			User u = new User();
			u.setUname(request.getParameter("uname"));
			List<User> ls = db.getUser(u);
			Iterator<User> itr = ls.iterator();
			u = itr.next();
			session.setAttribute("LoggedUser", u);
			PrintWriter pw = response.getWriter();
			response.setContentType("text/html");
			pw.println("<html><head><title>");
			pw.println("User details");
			pw.println("</title></head><body><table border=\"2\" cellpadding=\"3\"><tr>");
			pw.println("<th>User name</th><th>email</th><th>Mobile number</th><th>Gender</th><th>City</th><th>Password</th><th>Balance</th>");
			pw.println("</tr><tr>");
			pw.println("<td>"+u.getUname()+"</td><td>"+u.getEmail()+"</td><td>"+u.getNumber()+"</td><td>"+u.getGender()+"</td><td>"+u.getCity()+"</td><td>"+u.getPass()+"</td><td>"+u.getBalance()+"</td></tr>");
			pw.print("</table></body>");
			pw.println("<a href=\"Home.jsp\">Home</a>");
			//pw.println("user name" + "\t" + "email" + "\t" + "mobile number" + "\t" + "gender" + "\t" + "city" + "\t" + "password" + "\t" + "balance");
			//pw.println(u.getUname() + "\t" + u.getEmail() + "\t" + u.getNumber() + "\t" + u.getGender() + "\t" + u.getCity() + "\t" + u.getPass() + "\t" + u.getBalance());
		} catch (Exception e) {
			response.sendRedirect("Search.jsp");
			e.printStackTrace();
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
