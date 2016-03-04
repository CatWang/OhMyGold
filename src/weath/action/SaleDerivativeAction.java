package weath.action;

import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;

import weath.entity.User;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lenovo on 2015/7/25.
 */
public class SaleDerivativeAction implements IpAndPort, Action,SessionAware,RequestAware {
    private Map<String, Object> request;
	private Map<String, Object> session;

	@Override
    public String execute() throws Exception {
        Connection connection =Connection.getInstance();
        JSONObject object = new JSONObject();
        User user=(User) session.get("user");
        String userID=user.getUserID();
        int hand=(int) request.get("hand");

        object.put("command", "SaleDerivative");
        object.put("clientderivativeID", request.get("derivativeID"));
        object.put("saleamount", hand);

        JSONObject res = new JSONObject(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));

        if ("Success".equals(res.getString("Result")))
            return SUCCESS;
        else
            return INPUT;
    }

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		request=arg0;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}
}
