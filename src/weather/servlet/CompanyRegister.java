package weather.servlet;


import org.json.JSONObject;

import weath.socket.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Created by lenovo on 2015/7/20.
 */

public class CompanyRegister extends HttpServlet{
    private final String ip = "192.168.202.68";
    private final int port = 23333;
    private String sucess = "index_login.jsp";
    private String fail = "registercompany.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = "Regist";
        String name = req.getParameter("name");
        String pwd = req.getParameter("pwd");
        String email = req.getParameter("email");
        String brief = req.getParameter("brief");
        String profession = req.getParameter("profession");
        String property = req.getParameter("property");
        String bankaccount = req.getParameter("bankaccount");
        String identity = req.getParameter("ID");
        String type = "enterprise";
        Connection connection = Connection.getInstance();
        JSONObject obj = new JSONObject();
        obj.put("command", command);
        obj.put("name", name);
        obj.put("pwd", pwd);
        obj.put("email", email);
        obj.put("brief", brief);
        obj.put("profession",profession);
        obj.put("property", property);
        obj.put("bankaccount",bankaccount);
        obj.put("identity", identity);
        obj.put("type", type);

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
