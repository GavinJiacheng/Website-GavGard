package com.gg.logindata;

public class User {

  int id;
  private String username;
  private String userpass;
  private String nickname;

  public int getid() {
    return id;
  }
  public void setid(int id){
    this.id = id;
  }
  public String getUsername() {
      return username;
  }
  public void setUsername(String username) {
      this.username = username;
  }
  public String getUserpass() {
      return userpass;
  }
  public void setUserpass(String userpass) {
      this.userpass = userpass;
  }
  public String getnickname() {
      return nickname;
  }
  public void setnickname(String nickname) {
      this.nickname = nickname;
  }
}
