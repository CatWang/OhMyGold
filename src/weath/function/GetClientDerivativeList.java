package weath.function;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONArray;
import org.json.JSONObject;

import weath.entity.User;
import weath.socket.Connection;
import weath.socket.IpAndPort;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by lenovo on 2015/7/24.
 */
public class GetClientDerivativeList implements IpAndPort,SessionAware{
    
    private Map<String, Object> session;

	public LinkedHashMap<String,JSONObject> GetClientDerivariveList1() throws Exception{

		Connection connection= Connection.getInstance();
        User user=(User)session.get("user");
        String userID=user.getUserID();
		JSONObject json=new JSONObject();
        json.put("command", "GetClientDerivativeList");
        json.put("userID",userID);
		String res=connection.sendRequest(ip, port, json.toString().getBytes("UTF-8"));
		JSONArray jsona=new JSONArray(res);
		
		System.out.println(res);
		LinkedHashMap<String,JSONObject> map = new LinkedHashMap<String,JSONObject>();
		
		for (int i=0;i<jsona.length();i++)
		{ JSONObject jso=new JSONObject();//查询合同信息
		  jso.put("command","GetClientDerivative");
		  jso.put("derivativeID",jsona.getJSONObject(i).get("derivativeID"));
		  
		  System.out.println(jso);
		  String result=connection.sendRequest(ip, port, jso.toString().getBytes("UTF-8"));
		  JSONObject jj=new JSONObject(result);
		  System.out.println(jj);
		  
		  jj.put("derivativeID",jsona.getJSONObject(i).get("derivativeID"));
		 
          map.put(i+"",jj); 
         
		}
		return map;
		
    }

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}




}

