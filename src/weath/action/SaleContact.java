package weath.action;

import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lenovo on 2015/7/25.
 */
public class SaleContact implements Action, IpAndPort {
    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();

        JSONObject object = new JSONObject();
        Connection connection = Connection.getInstance();

        object.put("command", "SaleContact");
        object.put("contactID", request.getParameter("contactID"));

        if ("Success".equals(connection.sendRequest(ip, port, object.toString().getBytes("UTF-8"))))
            return SUCCESS;
        else
            return INPUT;
    }
}
