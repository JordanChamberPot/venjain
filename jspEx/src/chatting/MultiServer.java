package chatting;

import java.io.IOException;
import java.net.*;
import java.util.*;

public class MultiServer {
	 private ArrayList<MultiServerThread> list;
	 private Socket socket;
	 private ServerSocket serverSocket;
	 
	//생성자
	 public MultiServer() throws IOException{
	  list = new ArrayList<MultiServerThread>(20);
	  serverSocket = new ServerSocket(6000);
	  //thread 생성하기 위해 선언
	  MultiServerThread mst =null;
	  //accept() 무한루프일때 정지 가능하하게 하기위한 변수
	  boolean isStop =false;
	   
	    while(!isStop) {
	      System.out.println("서버 대기중");
	      //ServerSocket.accept()메소드로 클라언트 접속대기
	      //연결이 되면 socket객체를 맴버로 할당
	      socket = serverSocket.accept();
	      //MultiServer 객체 인자로해서..
	      //Runable객체인 MultiServerThread객체생성
	      mst = new MultiServerThread(this);
	      list.add(mst);
	      //스레드 생성하고 시작
	      Thread t = new Thread(mst);
	      t.start();
	    }
	 }
	    // 연결된 클라이언트가 들어 있는 리스스 반환하기
	   public ArrayList<MultiServerThread> getList(){
		   return list;
	   }
	    //클라이언트 소켓 반환하기
	   public Socket getSocket() {
		   return socket;
	   }
	   public static void main(String[] args)throws IOException{
	     new MultiServer();
	   }
	
}
