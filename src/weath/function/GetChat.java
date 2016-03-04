package weath.function;

import org.json.JSONArray;
import org.json.JSONObject;
import weath.entity.ChatContent;
import weath.entity.ChatRoom;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.LinkedList;

/**
 * Created by lenovo on 2015/7/25.
 */
public class GetChat implements IpAndPort{
    private HttpSession session;

    public GetChat(HttpSession session) {
        this.session = session;
    }

    public LinkedList<ChatRoom> getChatList() {
        LinkedList<ChatRoom> chatRooms = new LinkedList<ChatRoom>();

        String userID = (String) session.getAttribute("userID");

        JSONObject object = new JSONObject();

        object.put("command", userID);
        object.put("userID", userID);

        Connection connection = Connection.getInstance();
        JSONArray array = null;

        try {
            array = new JSONArray(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (int i=0; i<array.length(); i++) {
            ChatRoom chatRoom = new ChatRoom();
            JSONObject res = (JSONObject)array.get(i);
            chatRoom.setUserID(userID);
            chatRoom.setChatlistID(res.getString("chatlistID"));
            chatRoom.setContactID(res.getString("contactID"));
            chatRoom.setPartenerID(res.getString("partenerID"));
            chatRoom.setOrder1ID(res.getString("order1ID"));
            chatRoom.setOrder2ID(res.getString("order2ID"));
            chatRooms.add(chatRoom);
        }
        return chatRooms;
    }

    public LinkedList<ChatContent> getChatContent(String chatlistID) {
        LinkedList<ChatContent> result = new LinkedList<>();

        Connection connection = Connection.getInstance();
        JSONObject object = new JSONObject();
        JSONArray array = null;

        object.put("command", "GetChatContent");
        object.put("chatlistID", chatlistID);

        try {
            array = new JSONArray(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (int i=0; i<array.length(); i++) {
            ChatContent content = new ChatContent();
            JSONObject res = (JSONObject) array.get(i);

            content.setSenderID(res.getString("senderID"));
            content.setReceiverID(res.getString("receiverID"));
            content.setChatlistID(res.getString("chatlistID"));
            content.setTime(Date.valueOf(new SimpleDateFormat("YYYY-MM-DD 00:00:00").format(res.getString("time"))));
            content.setContent(res.getString("content"));

            result.add(content);
        }

        return result;
    }
}
