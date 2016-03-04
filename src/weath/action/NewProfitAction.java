package weath.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;

import weath.entity.User;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by lenovo on 2015/7/25.
 */
public class NewProfitAction implements IpAndPort, Action,SessionAware,RequestAware {
    private Map<String, Object> session;
	private Map<String, Object> request;

	@Override
    public String execute() throws Exception {
        Connection connection = Connection.getInstance();
        JSONObject object = new JSONObject();
        User user=(User)session.get("user");
        String userID = user.getUserID();
        int year = (int) request.get("year");
        int quarter = (int) request.get("quarter");
        int profit =(int) request.get("profit");
        int month=0;
        if(quarter==1) month=0;
        if(quarter==2) month=3;
        if(quarter==3) month=6;
        if(quarter==4) month=9;
        for(int i=1;i<=3;i++)
        {
        object.put("command", "NewMonthProfit");
        object.put("userID", userID);
        object.put("year", year);
        object.put("month", month+i);
        object.put("profit", profit/3);
        JSONObject res = new JSONObject(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        if ("Fail".equals(res.getString("Result")))
            return INPUT;
        }
        return SUCCESS;
    }

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		request=arg0;
	}
}
