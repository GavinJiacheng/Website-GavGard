package com.gg.websocketservlet;

import java.util.concurrent.CopyOnWriteArraySet;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

import com.gg.logindata.Userdata;
import com.gg.logindata.User;

@ServerEndpoint(value="/chatroom",configurator=GetHttpSessionConfigurator.class) //This is the url we need to write in jsp/js file.
public class chatroomsocket {

    private static int onlineCount = 0;

    private static CopyOnWriteArraySet<chatroomsocket> setofclient = new CopyOnWriteArraySet<chatroomsocket>();

    private Session session;

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        HttpSession httpSession= (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        String nickname = (String)httpSession.getAttribute("nickname");
        boolean isguest = true;
        if (nickname != null){
          isguest = false;
        }
        this.session = session;
        setofclient.add(this);
        chatroomsocket.onlineCount++;
        //String nickname = session.getAttribute("nickname");
        Date now = new Date();
        String name_of_user;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (isguest) {
          name_of_user = "GUEST";
        }else {
          name_of_user = nickname;
        }
        String time = dateFormat.format(now);
        for (chatroomsocket item : setofclient) {
            item.session.getAsyncRemote().sendText(name_of_user+" is joining in!    "+time);
        }
    }

    @OnClose
    public void onClose() {
        setofclient.remove(this);
        chatroomsocket.onlineCount--;
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = dateFormat.format(now);
        for (chatroomsocket item : setofclient) {
                item.session.getAsyncRemote().sendText(message +"     "+time);
        }
    }

    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("ERROR");
        error.printStackTrace();
    }
}
