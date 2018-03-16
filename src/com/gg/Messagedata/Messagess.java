package com.gg.Messagedata;

public class Messagess {
    private int id = -1;
    private String nickname;
    private String time;
    private String title;
    private String message;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id=id;
    }
    public String getName() {
        return nickname;
    }
    public void setName(String name) {
        this.nickname=name;
    }
    public String getTime() {
        return time;
    }
    public void setTime(String time) {
        this.time=time;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title=title;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message=message;
    }
}
