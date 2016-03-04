package weath.action;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONArray;
import org.json.JSONObject;

import weath.entity.User;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import com.opensymphony.xwork2.Action;

public class MatchOrderAction implements Action,SessionAware,IpAndPort,ServletRequestAware{

	private Map<String, Object> session;
	private HttpServletRequest request;

	

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
	
		session = arg0;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String type[]= request.getParameterValues("userType");
		String recording =request.getParameter("recording");
		String sss="credit";
		if(recording.equals("1")) sss="credit";
		if(recording.equals("2")) sss="credit";
		if(recording.equals("3")) sss="property";
		if(recording.equals("4")) sss="dealamount";
		String order=request.getParameter("order");
		User user=(User) session.get("user");
		Connection connection= Connection.getInstance();
		String orderID=(String) session.get("orderID");
		
		System.out.println("orderIDd"+orderID);
		if(orderID!=null)
		{
		JSONObject json=new JSONObject();//匹配下单
		json.put("command","SearchOrder");
		json.put("orderID",orderID);
		if((type.length==2)||(type.length==0)){json.put("type","all");}
		else if(type.length==1){ if (type[0].equals("company"))json.put("type", "enterprise");
									else json.put("type","individual");}
		
		
		json.put("field","all");//要改！！！
		json.put("status","available");
		
		System.out.println(json.toString());
		
		String res=connection.sendRequest(ip, port, json.toString().getBytes("UTF-8"));
		JSONArray jsona=new JSONArray(res);
		
		System.out.println(res);
		 LinkedHashMap<String,JSONObject> map = new LinkedHashMap<String,JSONObject>();
		for (int i=0;i<jsona.length();i++)
		{ JSONObject jso=new JSONObject();//查询用户信息
		  jso.put("command","GetUserInfo");
		  jso.put("userID",jsona.getJSONObject(i).get("holderID"));
		  
		  System.out.println(jso);
		  String result=connection.sendRequest(ip, port, jso.toString().getBytes("UTF-8"));
		  JSONObject jj=new JSONObject(result);
		  System.out.println(jj);
		  
		  jj.put("orderID",jsona.getJSONObject(i).get("orderID"));
		  jj.put("userID",jsona.getJSONObject(i).get("holderID"));
		  
		 
          map.put(i+"",jj); 
         
		}
		if(order.equals("1")){
			for(int i=0;i<map.size();i++)
				for(int j=i;j<map.size();j++)
					if((int)(map.get(i+"").get(sss))>(int)(map.get(j+"").get(sss))){
																					JSONObject p=map.get(i+"");
																					map.put(i+"",map.get(j+""));
																					map.put(j+"", p);
																					}
		}
		else {
			for(int i=0;i<map.size();i++)
				for(int j=i;j<map.size();j++)
					if((int)(map.get(i+"").get(sss))<(int)(map.get(j+"").get(sss))){
																					JSONObject p=map.get(i+"");
																					map.put(i+"",map.get(j+""));
																					map.put(j+"", p);
																					}
		}
		
		 request.setAttribute("orderlist", map);
		}
		return SUCCESS;
		
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		request = arg0;
	}


}
