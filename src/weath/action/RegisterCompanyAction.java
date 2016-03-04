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
 * Created by lenovo on 2015/7/20.
 */
public class RegisterCompanyAction implements Action , SessionAware{
	private final String ip = "192.168.202.68";
	private final int port = 23333;
	private Map<String, Object> session;

	@Override
	public String execute() throws Exception {
		User user = new User();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setName((String) request.getParameter("name"));
		user.setPwd((String) request.getParameter("pwd"));
		user.setEmail((String) request.getParameter("email"));
		user.setBrief((String) request.getParameter("brief"));
		user.setProfession((String) request.getParameter("profession"));
		user.setBankaccount((String) request.getParameter("bankaccount"));
		user.setProperty((String) request.getParameter("property"));
		user.setId((String) request.getParameter("ID"));
		user.setType("enterprise");
		
		Connection conn = Connection.getInstance();
		JSONObject obj = new JSONObject();
		obj.put("command", "Regist");
		obj.put("name", user.getName());
		obj.put("pwd", user.getPwd());
		obj.put("email", user.getEmail());
		obj.put("brief", user.getBrief());
		obj.put("profession", user.getProfession());
		obj.put("property",user.getProperty());
		obj.put("bankaccount", user.getProperty());
		obj.put("identity", user.getId());
		obj.put("type", user.getType());
		
		System.out.println(obj.toString());
		String res = conn.sendRequest(ip, port, obj.toString().getBytes("UTF-8"));
		JSONObject resultObj = new JSONObject(res);
		String result = resultObj.getString("Result");
		System.out.println(result);
		if (result.equals("Success")) {
			JSONObject ll=new JSONObject();
			ll.put("command","Login");
			ll.put("email", user.getEmail());
			ll.put("pwd", user.getPwd());
			String ress = conn.sendRequest(ip, port, obj.toString().getBytes("UTF-8"));
			JSONObject jj=new JSONObject(ress);
			user.setUserID(jj.getString("userID"));
			session.put("user", user);
			
			System.out.print(SUCCESS);
			return SUCCESS;
		} else
			return INPUT;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}

}
