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
