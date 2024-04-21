package dao; 
import java.util.Collections; 
import java.util.HashSet; 
import java.util.Set; 
import javax.websocket.*; 
import javax.websocket.server.*; 
@ServerEndpoint("/talkbroadcasting") 
public class BroadSocket { 
	public static Set<Session> setClients = Collections.synchronizedSet(new HashSet<Session>()); 
	@OnMessage		// 클라이언트로부터 메시지가 도착했을 때. 
	public void onMessage(String message, Session session) throws Exception {
		System.out.println("message : " + message);
		
		String[] arrMessage = message.split("_");
		int num = Integer.parseInt(arrMessage[0]);
		String senderId = arrMessage[1];
		int idxOfUnderbar = message.replaceFirst("_", ".").indexOf("_");
		String chat = message.substring(idxOfUnderbar+1);       // "num_senderId_chat" --> "num.senderId_chat"
		
		String sellerId = TalktalkchatDao.getSellerIdFromNum(num);
		String customerId = TalktalkchatDao.getCustomerIdFromNum(num);

		//System.out.println("from client : " + chat);		// message의 형식 = "num_senderId_chat"
		System.out.println("num : " + num + ", sellerId : " + sellerId + ", customerId : " + customerId);
		System.out.println("senderId = " + senderId + ", chat = " + chat);

		TalktalkchatDao talkinsert = new TalktalkchatDao();
		if(senderId!=null && senderId.equals(sellerId)) {
			talkinsert.chat(sellerId, customerId, senderId, chat, num);  // 판매자입장
		} else {
			talkinsert.chat(sellerId, customerId, senderId, chat);  // 구매자입장
		}
		synchronized(setClients) { 
			for(Session client : setClients) { 
				client.getBasicRemote().sendText(senderId + " : " + chat); 
			} 
		}
	} 
	@OnOpen			// 클라이언트가 서버로 접속했을 때. 
	public void onOpen(Session session) { 
		//System.out.println(session); 
		setClients.add(session); 
		System.out.println("참여 : " + setClients.size() + "명."); 
	} 
	@OnClose		// 클라이언트의 접속이 끊어졌을 때. 
	public void onClose(Session session) { 
		setClients.remove(session); 
		System.out.println("참여 : " + setClients.size() + "명."); 
	} 
}