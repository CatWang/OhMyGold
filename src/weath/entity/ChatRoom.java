package weath.entity;

/**
 * Created by lenovo on 2015/7/25.
 */
public class ChatRoom {
    private String userID;
    private String chatlistID;
    private String contactID;
    private String partenerID;
    private String order1ID;
    private String order2ID;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getChatlistID() {
        return chatlistID;
    }

    public void setChatlistID(String chatlistID) {
        this.chatlistID = chatlistID;
    }

    public String getContactID() {
        return contactID;
    }

    public void setContactID(String contactID) {
        this.contactID = contactID;
    }

    public String getPartenerID() {
        return partenerID;
    }

    public void setPartenerID(String partenerID) {
        this.partenerID = partenerID;
    }

    public String getOrder1ID() {
        return order1ID;
    }

    public void setOrder1ID(String order1ID) {
        this.order1ID = order1ID;
    }

    public String getOrder2ID() {
        return order2ID;
    }

    public void setOrder2ID(String order2ID) {
        this.order2ID = order2ID;
    }
}
