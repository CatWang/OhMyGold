package weath.entity;

import java.sql.Date;

/**
 * Created by lenovo on 2015/7/25.
 */
public class ChatContent {
    private String chatlistID;
    private String senderID;
    private String receiverID;
    private Date time;
    private String content;

    public String getChatlistID() {
        return chatlistID;
    }

    public void setChatlistID(String chatlistID) {
        this.chatlistID = chatlistID;
    }

    public String getSenderID() {
        return senderID;
    }

    public void setSenderID(String senderID) {
        this.senderID = senderID;
    }

    public String getReceiverID() {
        return receiverID;
    }

    public void setReceiverID(String receiverID) {
        this.receiverID = receiverID;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
