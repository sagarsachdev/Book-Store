package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.model.Login;
import com.model.User;

/**
 * 
 * This class is used to create the connection to the database and different methods are defined to interact with the database.
 * 
 * @author sagarsachdev
 *
 */
public class DBApplication {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public Connection myConnection(){
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "Sagar123");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/**
	 * This method is used for inserting data received from jsp page into table using insert command.
	 * @param ls  The method accepts List of user(s) which is/are supposed to be inserted into the database.
	 * @return int  The method returns int value which becomes positive if the query works without any error otherwise returns non-positive value.
	 */
	public int saveData(List<User> ls) {
		int i=0;
		User u = null;
		con = myConnection();
		try {
			Iterator<User> itr = ls.iterator();
			while(itr.hasNext())
			{
				u = itr.next();
				ps = con.prepareStatement("insert into UserDetails values(?,?,?,?,?,?,?)");
				ps.setString(1, u.getUname());
				ps.setString(2, u.getEmail());
				ps.setLong(3, u.getNumber());
				ps.setString(4, u.getGender());
				ps.setString(5, u.getCity());
				ps.setString(6, u.getPass());
				ps.setLong(7, u.getBalance());
				i = ps.executeUpdate();
			}
			}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;
	}
	
	/**
	 * This method is used to retreive all the tuples from the table using select statement.
	 * @return List  The method returns List of users whose tuple is present in the table in database.
	 */
	
	public List<User> getAllData()
	{
		List<User> lst=new LinkedList<User>();
		con=myConnection();
		try
		{
		Statement s=
					con.createStatement
					(ResultSet.TYPE_SCROLL_SENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
			rs=s.executeQuery("select * from UserDetails");
			while(rs.next())
			{
				User u=new User();
				u.setUname(rs.getString("uname"));
				u.setEmail(rs.getString("email"));
				u.setNumber(rs.getLong("num"));
				u.setGender(rs.getString("gender"));
				u.setCity(rs.getString("city"));
				u.setPass(rs.getString("pass"));
				u.setBalance(rs.getLong("balance"));
				lst.add(u);
				System.out.println("cnt");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return lst;
	}
	
	/**
	 * This method is used to verify the details of user which are entered in the jsp page
	 *  whether those values are present in the table or not.
	 * @param lst	It accepts the values entered by user on jsp page in list of login object.
	 * @return boolean	This returns true if the details are correct otherwise false.
	 */
	
	public boolean validateData(List<Login> lst) {
		myConnection();
		List<User> ls=getAllData();
		boolean b=false;
		for(User u:ls)
		{
			if(lst.get(0).getUname().equals(u.getUname()) && lst.get(0).getPass().equals(u.getPass()))
				{
					b=true;
					break;
				}
		}
		return b;
	}
	
	/**
	 * This method is used for retreiving details of logged in user from table using search command
	 * @param u	accepts username and passes it in form of user object which is used for retrieving details from table 
	 * @return	This returns List of user object which contains all the details of logged in user
	 */
	
	public List<User> getUser(User u){
		List<User> lst = new ArrayList<User>();
		try {
			con = myConnection();
			ps = con.prepareStatement("select * from UserDetails where uname=?");
			ps.setString(1, u.getUname());
			rs = ps.executeQuery();
			while(rs.next())
			{
				u.setUname(rs.getString("uname"));
				u.setEmail(rs.getString("email"));
				u.setNumber(rs.getLong("num"));
				u.setGender(rs.getString("gender"));
				u.setCity(rs.getString("city"));
				u.setPass(rs.getString("pass"));
				u.setBalance(rs.getLong("balance"));
				lst.add(u);
				System.out.println("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lst;	
	}
	
	/**
	 * This method is used to buy book from given books and deduct money from user's account.
	 * @param ls	This is List of login object which is used for retrieving details of logged in user in order to deduct balance from user's account.
	 * @return int	This returns an integer value which signies whether the query successfully worked or not.
	 */
	
	public int buyBook(List<Login> ls) {
		int j = 0;
		try {
			con = myConnection();
			ps = con.prepareStatement("update UserDetails set balance=balance-2000 where uname=?");
			ps.setString(1, ls.get(0).getUname());
			j = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return j;
		
	}
}
