package com.gg.logindata;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Userdata {


	public User findUser(User getuser){
		User user = null;
		user = searchUsername(getuser.getUsername());
		return user;
	}

	public boolean checkusername(User getuser){
		if(findUser(getuser) != null){
			return true;
		}
		else{
			return false;
		}
	}

	public boolean checknickname(User getuser){
		if(searchnickname(getuser.getnickname()) != null){
			return true;
		}
		else{
			return false;
		}
	}

	public boolean addUser(User user){
		boolean ret = false;
		Connection con = getConnection();
		PreparedStatement pstmt =null;
		String sql = "INSERT INTO user(username,nickname,password) VALUES(?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getnickname());
			pstmt.setString(3, user.getUserpass());
			if(pstmt.executeUpdate() != 0){
				ret = true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	return ret;
	}

	public static Connection getConnection(){
		String driver ="com.mysql.jdbc.Driver";
		String url ="jdbc:mysql://localhost:3306/gavgardweb";
		String user ="xjc";
		String password ="jjzz1100";
		Connection connection =null;
		try {
			Class.forName(driver);
			connection =DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return connection;
	}

	public User searchUsername(String username){
		String sql = "select * from user where username=?";
		Connection con =getConnection();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		User user = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if(rs.next()){
				user = new User();
				user.setUsername(rs.getString("username"));
				user.setnickname(rs.getString("nickname"));
				user.setUserpass(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}

	public User searchnickname(String nickname){
		String sql = "select * from user where nickname=?";
		Connection con =getConnection();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		User user = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			if(rs.next()){
				user = new User();
				user.setUsername(rs.getString("username"));
				user.setnickname(rs.getString("nickname"));
				user.setUserpass(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}
}
	//public static void main(String[] args) {
		//test
//		System.out.println(new Userdata().findUser("123"));
//		new Userdata().addUser("1345", "1345");
	//}

/*
 * database
  CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL UNIQUE,
	`nickname` varchar(255) DEFAULT NULL UNIQUE,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
*/

//}
