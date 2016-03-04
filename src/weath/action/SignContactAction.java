package weath.action;

import com.opensymphony.xwork2.Action;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;
import weath.entity.User;
import weath.function.GetContact;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by lenovo on 2015/7/24.
 */
public class SignContactAction implements Action, IpAndPort, ServletRequestAware, SessionAware {
    private Map<String, Object> session;
    HttpServletRequest request;
    @Override
    public String execute() throws Exception {
        User user = (User) session.get("user");
        String userID=  user.getUserID();
        String contactID = request.getParameter("contactID");

        JSONObject object = new JSONObject();
        object.put("command", "SignContact");
        object.put("userID", userID);
        object.put("contactID", contactID);

        JSONObject res = null;
        Connection connection = Connection.getInstance();


        res = new JSONObject(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8")));
        String result = res.getString("Result");

        if ("Fail".equals(result))
            return ERROR;
        else
            request.setAttribute("contract", new GetContact().getContact(contactID));
            return SUCCESS;
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        setServletRequest(httpServletRequest);
    }

    @Override
    public void setSession(Map<String, Object> map) {
        setSession(map);
    }
}
