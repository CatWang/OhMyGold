package weath.function;

import org.json.JSONArray;
import org.json.JSONObject;
import weath.entity.Derivative;
import weath.socket.Command;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import java.io.IOException;
import java.util.LinkedList;

/**
 * Created by lenovo on 2015/7/25.
 */
public class GetDerivative implements IpAndPort, Command {

    public LinkedList<String> getClientDerivativeList(String userID) {
        LinkedList<String> result = new LinkedList<>();
        Connection connection = Connection.getInstance();
        JSONObject object = new JSONObject();
        JSONArray array = null;

        object.put(REQUEST_COMMAND, REQUEST_GETCLIENTDERIVATIVELIST);
        object.put(KEY_USERID, userID);

        try {
            array = new JSONArray(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (int i=0; i<array.length(); i++) {
            JSONObject res = (JSONObject) array.get(i);
            result.add(res.getString(KEY_DERIVATIVEID));
        }

        return result;
    }

    public LinkedList<String> getPlatformDerivateList() {
        LinkedList<String> result = new LinkedList<>();
        Connection connection = Connection.getInstance();
        JSONObject object = new JSONObject();
        JSONArray array = null;

        object.put(REQUEST_COMMAND, REQUEST_GETPLATFORMDERIVATIVELIST);

        try {
            array = new JSONArray(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (int i=0; i<array.length(); i++) {
            JSONObject res = (JSONObject) array.get(i);
            result.add(res.getString(KEY_DERIVATIVEID));
        }

        return result;
    }

    public Derivative getClientDerivativeInfo(String derivativeID) {
        Derivative derivative = new Derivative();
        Connection connection = Connection.getInstance();
        JSONObject object = new JSONObject();
        JSONObject res = null;

        object.put(REQUEST_COMMAND, REQUEST_GETCLIENTDERIVATIVEINFO);
        object.put(KEY_DERIVATIVEID, derivativeID);

        try {
            res = new JSONObject(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        derivative.setDerivativeID(derivativeID);
        derivative.setHolderID(res.getString(KEY_HOLDERID));
        derivative.setYear(Integer.parseInt(res.getString(KEY_YEAR)));
        derivative.setMonth(Integer.parseInt(res.getString(KEY_MONTH)));
        derivative.setAmount(Integer.parseInt(res.getString(KEY_AMOUNT)));
        derivative.setSingleprice(Double.parseDouble(res.getString(KEY_SINGLEPRICE)));
        derivative.setTemperature(res.getString(KEY_TEMPERATURE));
        derivative.setLossratio(Double.parseDouble(res.getString(KEY_LOSSRATIO)));
        derivative.setProtocoltemperature(Double.parseDouble(res.getString(KEY_TEMPERATURE)));
        derivative.setPlatformderivativeID(res.getString(KEY_PLATFORMDERIVATIVEID));
        return derivative;
    }

    public Derivative getPlatformDerivativeInfo(String derivativeID) {
        Derivative derivative = new Derivative();
        Connection connection = Connection.getInstance();
        JSONObject object = new JSONObject();
        JSONObject res = null;

        object.put(REQUEST_COMMAND, REQUEST_GETPLATFORMDERIVATIVEINFO);
        object.put(KEY_DERIVATIVEID, derivativeID);

        try {
            res = new JSONObject(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        derivative.setDerivativeID(derivativeID);
        derivative.setYear(Integer.parseInt(res.getString(KEY_YEAR)));
        derivative.setMonth(Integer.parseInt(res.getString(KEY_MONTH)));
        derivative.setRemain(Integer.parseInt(res.getString(KEY_REMAIN)));
        derivative.setSingleprice(Double.parseDouble(res.getString(KEY_SINGLEPRICE)));
        derivative.setTemperature(res.getString(KEY_TEMPERATURE));
        derivative.setLossratio(Double.parseDouble(res.getString(KEY_LOSSRATIO)));
        derivative.setProtocoltemperature(Double.parseDouble(res.getString(KEY_PROTOCOLTEMPERATURE)));

        return derivative;
    }

    //该用户所拥有的所有自有衍生品详细信息集合
    public LinkedList<Derivative> getClientDerivativeInfoList(String userID) {
        LinkedList<Derivative> result = new LinkedList<>();
        LinkedList<String> res = getClientDerivativeList(userID);
        for (String id : res) {
            result.add(getClientDerivativeInfo(id));
        }
        return result;
    }

    //该平台现有的所有自有衍生品详细信息集合
    public LinkedList<Derivative> getPlatformDerivativeInfoList() {
        LinkedList<Derivative> result = new LinkedList<>();
        LinkedList<String> res = getPlatformDerivateList();
        for (String id: res) {
            result.add(getPlatformDerivativeInfo(id));
        }
        return result;
    }

}
