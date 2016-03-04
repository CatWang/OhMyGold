package weath.action;

import java.util.Map;

import com.opensymphony.xwork2.Action;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;

import weath.entity.User;
import weath.socket.Connection;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lenovo on 2015/7/23.
 */
public class LoginAction implements Action , SessionAware {
    private final String ip = "192.168.202.68";
    private final int port = 23333;
	private Map<String, Object> session;

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String email = (String) request.getParameter("email");
        String pwd = (String) request.getParameter("pwd");
        Connection connection = Connection.getInstance();
        JSONObject object = new JSONObject();

        object.put("command", "Login");
        object.put("email", email);
        object.put("pwd", pwd);
        
       
        String result = connection.sendRequest(ip, port, object.toString().getBytes("UTF-8"));
        
        JSONObject resultObj = new JSONObject(result);
        
        String res = resultObj.getString("Result");
        
        if ("Fail".equals(res))
        	return INPUT;
        else {
        	  String userID = resultObj.getString("userID");
            JSONObject userInfoObj = new JSONObject();

            userInfoObj.put("command", "GetUserInfo");
            userInfoObj.put("userID",userID);
            
            
            
            result = connection.sendRequest(ip, port, userInfoObj.toString().getBytes("UTF-8"));
            
            
            JSONObject userInfo = new JSONObject(result);
            
            User user = new User();
            user.setName(userInfo.getString("name"));
            user.setEmail(userInfo.getString("email"));
            user.setBrief(userInfo.getString("brief"));
            user.setDealamount(userInfo.getInt("dealamount"));
            user.setProfession(userInfo.getString("profession"));
            user.setProperty(userInfo.getString("property"));
            user.setBankaccount(userInfo.getString("bankaccount"));
            user.setPicaddress(userInfo.getString("picaddress"));
            user.setType(userInfo.getString("type"));
            user.setCredit(userInfo.getDouble("credit"));
            user.setId(userInfo.getString("identity"));
            user.setUserID(userID);

        	session.put("user", user);

            return SUCCESS;
        }
    }

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session = arg0;
	}
}
