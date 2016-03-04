package weather.servlet;

import org.json.JSONObject;

import weath.socket.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Created by lenovo on 2015/7/21.
 */
public class PersonRegister extends HttpServlet{
    private final String ip = "192.168.202.68";
    private final int port = 23333;
    private String sucess = "index_login.jsp";
    private String fail = "registerperson.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = "RegistIndividual";
        String pwd = req.getParameter("pwd");
        String profession = req.getParameter("profession");
        String Tel = req.getParameter("Tel1") + "-" + req.getParameter("Tel2");
        String brief = req.getParameter("brief");
        String status = "1";
        String province = req.getParameter("province");
        String city = req.getParameter("city");
        String district = req.getParameter("district");
        String address = req.getParameter("address");
        String postCode = req.getParameter("postCode");
        String name = req.getParameter("name");
        String property = req.getParameter("property");
        String identityID = req.getParameter("identityID");
        String profitCountWay = req.getParameter("profitCountWay");
        String email = req.getParameter("Email");

        Connection connection =Connection.getInstance();
        JSONObject obj = new JSONObject();
        obj.put("command", command);
        obj.put("pwd", pwd);
        obj.put("profession", profession);
        obj.put("Tel", Tel);
        obj.put("brief", brief);
        obj.put("status", status);
        obj.put("province", province);
        obj.put("city", city);
        obj.put("district", district);
        obj.put("address", address);
        obj.put("postCode", postCode);
        obj.put("name", name);
        obj.put("property", property);
        obj.put("identityID", identityID);
        obj.put("profitCountWay", profitCountWay);
        obj.put("email", email);

        String result = connection.sendRequest(ip, port, obj.toString().getBytes("UTF-8"));

        if (result == "Success") {
            req.setAttribute("obj", obj);
            req.getRequestDispatcher(sucess).forward(req, resp);
        } else
            req.getRequestDispatcher(fail).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
