package weath.action;

import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lenovo on 2015/7/25.
 */
public class CancelOrder implements Action, IpAndPort,SessionAware {
    private Map<String, Object> session;

	@Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        JSONObject object = new JSONObject();
        Connection connection =Connection.getInstance();
        object.put("command", "Cancel");
        object.put("orderID", request.getParameter("orderID"));

        if ("Success".equals(new JSONObject(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8"))).getString("Result")))
            return SUCCESS;
        else
            return INPUT;
    }

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}
}
