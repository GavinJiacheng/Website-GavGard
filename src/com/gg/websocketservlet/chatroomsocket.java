package com.gg.websocketservlet;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatroom") //This is the url we need to write in jsp/js file.
public class chatroomsocket {

    private static int onlineCount = 0;

    private static CopyOnWriteArraySet<chatroomsocket> setofclient = new CopyOnWriteArraySet<chatroomsocket>();

    private Session session;

    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        setofclient.add(this);
        chatroomsocket.onlineCount++;
        //String nickname = session.getAttribute("nickname");
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = dateFormat.format(now);
        for (chatroomsocket item : setofclient) {
            item.session.getAsyncRemote().sendText("New user is joining in!    "+time);
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
