package weath.socket;

/**
 * Created by lenovo on 2015/7/20.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;



public class Connection{
	private static Connection instance = null;
	
    private static final int TIMEOUT = (int) TimeUnit.SECONDS.toMillis(10);
    private static final HashMap<String, Socket> pool = new HashMap<>();

    private Connection() {
    	
    }
    public static synchronized Connection getInstance() {
    	if (instance == null) {
    		instance = new Connection();
    	}
    	return instance;
    }
    private synchronized Socket getSocket(String ip, int port) throws IOException {
        String key = String.format("%s:%d", ip, port);
        Socket socket;
        if (pool.containsKey(key)){
            socket = pool.get(key);
            pool.remove(key);
        } else {
            socket = new Socket(ip, port);
            socket.setSoTimeout(TIMEOUT);
        }
        return socket;
    }

    public String sendRequest(String ip, int port, byte[] data) throws IOException {
        Socket socket = getSocket(ip, port);
        OutputStream out = socket.getOutputStream();
        out.write(data);
        BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        String response = reader.readLine();
        returnSocket(socket);
        return response;
    }


    private synchronized void returnSocket(Socket socket) {
        int port = socket.getPort();
        String ip = socket.getInetAddress().getHostAddress();
        String key = String.format("%s:%d", ip, port);
        pool.put(key, socket);
        
    }
}
