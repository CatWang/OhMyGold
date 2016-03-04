package weath.entity;

import org.json.JSONArray;
import org.json.JSONObject;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;

/**
 * Created by lenovo on 2015/7/25.
 */
public class SelectOrder implements IpAndPort {
    private HttpSession session;
    public SelectOrder(HttpSession session) {
        this.session = session;
    }

    public LinkedList<String> selectOrderByUserType(String type) {
       LinkedList<String> result = new LinkedList<>();
        JSONObject object = new JSONObject();
        Connection connection =Connection.getInstance();
        JSONArray array = null;

        object.put("command", "SearchOrderUserType");
        object.put("userType", type);
        try {
            array = new JSONArray(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (int i=0; i<array.length(); i++) {
            JSONObject res = (JSONObject) array.get(i);
            String orderID = res.getString("orderID");
            result.add(orderID);
        }

        return result;
    }

    public LinkedList<String> selectOrderByField(String field) {
        LinkedList<String> result = new LinkedList<>();

        JSONObject object = new JSONObject();
        Connection connection =Connection.getInstance();
        JSONArray array = null;

        object.put("command", "SearchOrderField");
        object.put("userType", field);
        try {
            array = new JSONArray(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (int i=0; i<array.length(); i++) {
            JSONObject res = (JSONObject) array.get(i);
            String orderID = res.getString("orderID");
            result.add(orderID);
        }

        return result;
    }

    public LinkedList<String> selectOrderByTemp(String temp) {
        LinkedList<String> result = new LinkedList<>();

        JSONObject object = new JSONObject();
        Connection connection = Connection.getInstance();
        JSONArray array = null;

        object.put("command", "SearchOrdertemperature");
        object.put("userType", temp);
        try {
            array = new JSONArray(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (int i=0; i<array.length(); i++) {
            JSONObject res = (JSONObject) array.get(i);
            String orderID = res.getString("orderID");
            result.add(orderID);
        }

        return result;
    }

}
