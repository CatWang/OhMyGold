package weath.function;

import org.json.JSONArray;
import org.json.JSONObject;
import weath.entity.Order;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import java.io.IOException;
import java.util.LinkedList;

/**
 * Created by damiao on 2015/7/25.
 */
public class GetOrder implements IpAndPort {

    public LinkedList<String> getOrderList(String userID) {
        LinkedList<String> result = new LinkedList<>();
        Connection connection = Connection.getInstance();
        JSONArray array = null;
        JSONObject object = new JSONObject();

        object.put("command", "GetOrderList");
        object.put("userID", userID);

        try {
            array = new JSONArray(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (int i=0; i<array.length(); i++) {
            result.add(((JSONObject)array.get(i)).getString("orderID"));
        }


        return result;
    }

    public Order getOrder(String orderID) {
        Order order = new Order();
        Connection connection = Connection.getInstance();
        JSONObject object = new JSONObject();
        JSONObject res = null;

        object.put("command", "GetOrder");
        object.put("orderID", orderID);

        try {
            res = new JSONObject(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        order.setOrderID(orderID);
        order.setHolderID(res.getString("holderID"));
        order.setMonth(Integer.parseInt(res.getString("month")));
        order.setYear(Integer.parseInt(res.getString("year")));
        order.setProvince(res.getString("province"));
        order.setCity(res.getString("city"));
        if (res.getString("status").equals("available"))
            order.setStatus("未签订");
        else if(res.getString("status").equals("inavailable"))
            order.setStatus("已签订");
        order.setStatus(res.getString("status"));
        order.setTemperature(res.getString("temperature"));
        order.setStatus_english(res.getString("status"));
        return order;
    }

    public LinkedList<Order> getOrderContentList(String userID) {
        LinkedList<Order> result = new LinkedList<>();

        LinkedList<String> list = getOrderList(userID);

        for (String id : list) {
            result.add(getOrder(id));
        }
        return result;
    }

    public LinkedList<Order> getOrderByOrderList(LinkedList<String> list) {
        LinkedList<Order> result = new LinkedList<>();

        for (String id : list) {
            result.add(getOrder(id));
        }

        return result;
    }
}
