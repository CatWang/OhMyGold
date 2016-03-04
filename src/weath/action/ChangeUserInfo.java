package weath.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;
import weath.function.GetUserInfo;
import weath.socket.Connection;
import weath.entity.User;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by lenovo on 2015/7/23.
 */
public class ChangeUserInfo implements Action,SessionAware {
    private final String ip = "192.168.202.68";
    private final int port = 23333;
	private Map<String, Object> session;

    @Override
    public String execute() throws Exception {
    	User user=(User) session.get("user");
        String userID = user.getUserID();

        HttpServletRequest request = ServletActionContext.getRequest();

        String brief = request.getParameter("brief");
        String profession = request.getParameter("profession");
        String property = request.getParameter("property");
        

        JSONObject object = new JSONObject();
        object.put("command", "SetUserInfo");
        object.put("userID", userID);
        object.put("brief", brief);
        object.put("profession", profession);
        object.put("property", property);

        Connection connection = Connection.getInstance();

        String res = connection.sendRequest(ip, port, object.toString().getBytes("UTF-8"));

        JSONObject result = new JSONObject(res);

        if ("Fail".equals(result.getString("Result")))
            return INPUT;
        else {
        	user.setBrief(brief);
        	user.setProfession(profession);
        	user.setProperty(property);
        	session.put("user", user);
          return SUCCESS;
        }

    }

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}
}
