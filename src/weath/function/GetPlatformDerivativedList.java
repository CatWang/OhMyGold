package weath.function;

import org.json.JSONArray;
import org.json.JSONObject;
import weath.socket.Connection;
import weath.socket.IpAndPort;
import java.util.LinkedHashMap;

/**
 * Created by lenovo on 2015/7/24.
 */
public class GetPlatformDerivativedList implements IpAndPort{
    
    public LinkedHashMap<String,JSONObject> GetPlatformDerivarivedList1() throws Exception{

		Connection connection= Connection.getInstance();
        JSONObject json=new JSONObject();
        json.put("command", "GetPlatformDerivativedList");

		String res=connection.sendRequest(ip, port, json.toString().getBytes("UTF-8"));
		JSONArray jsona=new JSONArray(res);
		
		System.out.println(res);
		LinkedHashMap<String,JSONObject> map = new LinkedHashMap<String,JSONObject>();
		
		for (int i=0;i<jsona.length();i++)
		{ JSONObject jso=new JSONObject();//查询合同信息
		  jso.put("command","GetPlatformDerivative");
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




}

