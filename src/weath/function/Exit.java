package weath.function;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

public class Exit implements SessionAware {

	private Map<String, Object> session;
	public Exit(){
		session.remove("user");
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}

}
