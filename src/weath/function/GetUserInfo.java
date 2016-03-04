package weath.function;

import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;
import weath.entity.User;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import java.io.IOException;
import java.util.Map;

/**
 * Created by lenovo on 2015/7/23.
 */
public class GetUserInfo implements IpAndPort,SessionAware{

    private Map<String, Object> session;
    
    public String getUserId()
    {
    	User user=(User)session.get("user");
    	String userID=user.getUserID();
    	return userID;
    }
    public String getUsername()
    {
    	User user=(User)session.get("user");
    	String username=user.getName();
    	return username;
    }
	public User getUserInfo(String userID) {
        JSONObject object = new JSONObject();
        User user = new User();

        object.put("command", "GetUserInfo");
        object.put("userID",userID);

        Connection connection = Connection.getInstance();

        String result = null;
        try {
            result = connection.sendRequest(ip, port, object.toString().getBytes("UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        JSONObject userInfo = new JSONObject(result);

            user.setUserID(userID);
            user.setName(userInfo.getString("name"));
            user.setEmail(userInfo.getString("email"));
            user.setBrief(userInfo.getString("brief"));
            user.setDealamount(userInfo.getInt("dealamount"));
            user.setProfession(userInfo.getString("profession"));
            user.setProperty(userInfo.getString("property"));
            user.setBankaccount(userInfo.getString("bankaccount"));
            user.setPicaddress(userInfo.getString("picaddress"));
            user.setId(userInfo.getString("identity"));
            user.setType(userInfo.getString("type"));
            user.setCredit(userInfo.getDouble("credt"));
            if ("individual".equals(user.getType()))
                user.setType_chinese("����");
            else if ("enterprise".equals(user.getType()))
                user.setType_chinese("��ҵ");
            return user;
        }

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}
    }
