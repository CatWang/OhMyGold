package weath.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.processors.JsDateJsonBeanProcessor;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONArray;
import org.json.JSONObject;

import weath.entity.User;
import weath.socket.Connection;

import com.opensymphony.xwork2.Action;

public class NewOrderAction implements Action,SessionAware {
	  private final String ip = "192.168.202.68";
	    private final int port = 23333;
		private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
	session=arg0;	
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String orderID;
		HttpServletRequest request = ServletActionContext.getRequest();
		boolean b=false;
		String province =request.getParameter("province");
		String city = request.getParameter("city");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String temperature =request.getParameter("temperature");
		User user=(User) session.get("user");
		
		String userID=user.getUserID();
		
		System.out.println(userID);
		
		Connection connection = Connection.getInstance();
        
		
		JSONObject object = new JSONObject();
        object.put("command","NewOrder");
		object.put("userID",userID);
		object.put("year",year);
		object.put("month",month);
		object.put("temperature", temperature);
		object.put("province", province);
		object.put("city", city);
		
		String result=connection.sendRequest(ip, port, object.toString().getBytes("UTF-8"));
		
		JSONObject resultjson =new JSONObject(result);
        if(resultjson.getString("Result").equals("Success"))
        {
        	JSONObject gol = new JSONObject();
        	gol.put("command","GetOrderList");
        	gol.put("userID", userID);
        	
        	String orderlist=connection.sendRequest(ip, port, gol.toString().getBytes("UTF-8"));
        	
        	JSONArray len=new JSONArray(orderlist);
        	for (int i=0;i<len.length();i++)//查找订单
        	{
        		JSONObject order = new JSONObject();
        		order.put("command","GetOrder");
        		order.put("orderID",len.getJSONObject(i).get("orderID"));
        		System.out.println(order);
        		
        		
        		String orderm=connection.sendRequest(ip, port, order.toString().getBytes("UTF-8"));
        		
        		System.out.println(orderm);
        		
        		if(orderm!=null)
        			{
        			JSONObject mess=new JSONObject(orderm);
        		
        			if(mess.get("province").equals(province)&&mess.get("city").equals(city)&&
        				mess.get("year").equals(year)&&mess.get("month").equals(month)&&
        				mess.get("temperature").equals(temperature)&&mess.get("holderID").equals(userID))
        			{
        				orderID=(String) len.getJSONObject(i).get("orderID");
        				
        				session.put("orderID", orderID);
        				System.out.println("orderIDd"+orderID);
        				b=true;
        				}
        			}
        	}
        	
        	if(!b){ session.put("orderID", null);System.out.print("b=false");}
        	System.out.println("ordersucc");
        	return SUCCESS;
        }
        else {
        	if(!b) session.put("orderID", null);
        	System.out.println("orderfail");
        	return INPUT;
        }
        }
	}

