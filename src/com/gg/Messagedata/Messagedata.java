package com.gg.Messagedata;

import java.sql.*;
import java.util.ArrayList;

public class Messagedata {
    public static Connection getConnection(){
        String driver ="com.mysql.jdbc.Driver";
        String url ="jdbc:mysql://localhost:3306/gavgardweb";
        String user ="xjc";
        String password ="jjzz1100";
        Connection connection =null;
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public ArrayList<Messagess> getallmessage(){
        ArrayList<Messagess> all=new ArrayList<Messagess>();
        Connection con =getConnection();
        String sql = "SELECT * FROM messagess";
        PreparedStatement pstmt =null;
        try{
            pstmt =con.prepareStatement(sql);
            ResultSet rs = null;
            rs=pstmt.executeQuery();
            while(rs.next()){
                Messagess newmd=new Messagess();
                newmd.setId(Integer.parseInt(rs.getString("id")));
                newmd.setTime(rs.getString("time"));
                newmd.setName(rs.getString("nickname"));
                newmd.setTitle(rs.getString("title"));
                newmd.setMessage(rs.getString("message"));
                all.add(newmd);
            }
        }catch(Exception e){
            e.printStackTrace();
            all = null;
        }finally {
            try {
                if(pstmt!=null)pstmt.close();
                if(con!=null)con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return all;
    }

    public int getmessagecount(){
        Connection con =getConnection();
        String sql = "SELECT COUNT(DISTINCT id) FROM messagess";
        PreparedStatement pstmt =null;
        int ret = 0;
        try{
            pstmt =con.prepareStatement(sql);
            ResultSet rs = null;
            rs=pstmt.executeQuery();
            if(rs.next()){
                ret = rs.getInt(1);
            }
        }catch(Exception e){
            e.printStackTrace();
            ret = -1;
        }finally {
            try {
                if(pstmt!=null)pstmt.close();
                if(con!=null)con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return ret;
    }

    public Messagess searchmessage(int id){
        String sql = "SELECT * FROM messagess WHERE id=?";
        Connection con =getConnection();
        PreparedStatement pstmt =null;
        ResultSet rs = null;
        Messagess themessage = null;
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(id));
            rs = pstmt.executeQuery();
            if(rs.next()){
                themessage = new Messagess();
                themessage.setId(id);
                themessage.setTime(rs.getString("time"));
                themessage.setName(rs.getString("nickname"));
                themessage.setTitle(rs.getString("title"));
                themessage.setMessage(rs.getString("message"));
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
        return themessage;
    }

    public boolean addInfo(Messagess md){
        Connection con =getConnection();
        String sql = "INSERT INTO messagess(nickname,time,title, message) VALUES(?,?,?,?)";
        PreparedStatement pstmt =null;
        boolean ret = false;
        try{
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, md.getName());
            pstmt.setString(2, md.getTime());
            pstmt.setString(3, md.getTitle());
            pstmt.setString(4, md.getMessage());
            if(pstmt.executeUpdate() != 0){
                ret = true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            try {
                if(pstmt!=null)pstmt.close();
                if(con!=null)con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return ret;
    }



    public int deletemessage (String id) throws Exception{
        Connection con =getConnection();
        String sql = "DELETE FROM messagess WHERE id = ?";
        PreparedStatement pstmt =null;
        int ret = 0;
        try{
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, id);
            ret = pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            try {
                if(pstmt!=null)pstmt.close();
                if(con!=null)con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return ret;
    }

    //

}


/*

 CREATE TABLE `messagess`(
  `id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT 'GUEST' NOT NULL,
  `time` varchar(40) DEFAULT '2012-12-12 12:12:12' NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `message` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (nickname) REFERENCES user(nickname)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


  CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL UNIQUE,
  `nickname` varchar(255) DEFAULT NULL UNIQUE,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8

 */
