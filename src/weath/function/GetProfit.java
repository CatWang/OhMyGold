package weath.function;

import org.json.JSONArray;
import org.json.JSONObject;
import weath.entity.Profit;
import weath.socket.Command;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import java.io.IOException;
import java.util.LinkedList;

/**
 * Created by lenovo on 2015/7/29.
 */
public class GetProfit implements IpAndPort,Command {

    public LinkedList<Profit> getMonthProfit(String userID) {
        LinkedList<Profit> result = new LinkedList<>();
        Connection connection = Connection.getInstance();
        JSONObject object = new JSONObject();
        object.put(REQUEST_COMMAND, REQUEST_GETMONTHPROFIT);
        object.put(KEY_USERID, userID);
        JSONArray array = null;

        try {
            array = new JSONArray(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (int i=0; i<array.length(); i++) {
            Profit profit = new Profit();
            JSONObject res = (JSONObject) array.get(i);
            profit.setYear(Integer.parseInt(res.getString(KEY_YEAR)));
            profit.setMonth(Integer.parseInt(res.getString(KEY_MONTH)));
            profit.setQuarter((Integer.parseInt(res.getString(KEY_MONTH))-1)/3);
            profit.setProfit(Double.parseDouble(res.getString(KEY_PROFIT)));
            result.add(profit);
        }
        return result;
    }


}
