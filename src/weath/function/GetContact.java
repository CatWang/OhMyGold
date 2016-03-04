package weath.function;

import org.json.JSONArray;
import org.json.JSONObject;
import weath.entity.Contact;
import weath.socket.Connection;

import java.io.IOException;
import java.util.LinkedList;

/**
 * Created by lenovo on 2015/7/23.
 */
public class GetContact implements weath.socket.IpAndPort{

    public LinkedList<String> getContactIDList(String userID) {

        JSONObject object = new JSONObject();
        JSONArray array = null;

        object.put("command", "GetContactList");
        object.put("userID", userID);

        Connection connection = Connection.getInstance();
        try {
            array = new JSONArray(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        LinkedList<String> result = new LinkedList<>();

        for (int i=0; i<array.length(); i++) {
            result.add(((JSONObject)array.get(i)).getString("contactID"));
        }
        return result;
    }

    public Contact getContact(String contactID) {
        Contact contact = new Contact();
        JSONObject res = null;

        JSONObject object = new JSONObject();
        object.put("command", "GetContact");
        object.put("contactID", contactID);

        Connection connection = Connection.getInstance();

        try {
            res = new JSONObject(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        contact.setContactID(contactID);
        contact.setPartener1ID(res.getString("partener1ID"));
        contact.setPartener2ID(res.getString("partener2ID"));
        contact.setYear(Integer.parseInt(res.getString("year")));
        contact.setMonth(Integer.parseInt(res.getString("month")));
        contact.setProvince(res.getString("province"));
        contact.setCity(res.getString("city"));
        contact.setLossratio(Double.parseDouble(res.getString("lossratio")));
        contact.setProtocoltemperature(Double.parseDouble(res.getString("protocoltemperature")));
        contact.setPart1temperature(res.getString("part1temperature"));
        contact.setPart2temperature(res.getString("part2temperature"));
        contact.setStatus(res.getString("status"));
        contact.setPart1signed(res.getString("part1signed"));
        contact.setPart2signed(res.getString("part2signed"));

        return contact;
    }

    public LinkedList<Contact> getContactItemsList(String userID) {
        LinkedList<Contact> result = new LinkedList<>();

        LinkedList<String> contactIDList = getContactIDList(userID);

        for (String contactID: contactIDList) {
            result.add(getContact(contactID));
        }

        return result;
    }

}