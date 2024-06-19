package org.example.semiprojectpanda.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.amazonaws.services.s3.model.JSONOutput;
import org.example.semiprojectpanda.dto.ChattingDto;
import org.example.semiprojectpanda.mapperInter.ChattingMapperInter;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {

    @Autowired
    private ChattingMapperInter chattingMapperInter;

    // 방 번호와 세션 정보를 저장할 리스트
    List<HashMap<String, Object>> roomSessionList = new ArrayList<>();

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) {
        // 클라이언트에서 전송된 메시지 처리
        String msg = message.getPayload();
        JSONObject jsonObject = jsonToObjectParser(msg);
        System.out.println(jsonObject);

        try {
            chattingMapperInter.insertChatting(
                    ChattingDto.builder()
                            .sendusernum(Integer.parseInt(jsonObject.get("usernum").toString()) )
                            .chatroomnum(Integer.parseInt(jsonObject.get("roomNumber").toString()))
                            .chattingmessage((String) jsonObject.get("msg"))
                            .build()
            );
        } catch (Exception e) {
            // 예외 처리 로직
            System.out.println(e.getMessage());
            // 필요한 경우 추가적인 예외 처리 로직 작성
            e.printStackTrace();
                return;
        }





        String roomNumber = jsonObject.get("roomNumber").toString();
        HashMap<String, Object> roomSessionMap = new HashMap<>();
        if (!roomSessionList.isEmpty()) {
            // 기존 방 번호 정보 검색
            for (int i = 0; i < roomSessionList.size(); i++) {
                String currentRoomNumber = (String) roomSessionList.get(i).get("roomNumber");
                if (currentRoomNumber.equals(roomNumber)) {
                    roomSessionMap = roomSessionList.get(i);
                    break;
                }
            }

            // 같은 방에 있는 세션들에게 메시지 전송
            for (String key : roomSessionMap.keySet()) {
                if (key.equals("roomNumber")) {
                    continue;
                }

                WebSocketSession webSocketSession = (WebSocketSession) roomSessionMap.get(key);
                if (webSocketSession != null) {
                    try {
                        webSocketSession.sendMessage(new TextMessage(jsonObject.toJSONString()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 클라이언트와의 웹소켓 연결 성립
        super.afterConnectionEstablished(session);
        boolean isExistingRoom = false;
        String url = session.getUri().toString();
        System.out.println(url);
        String roomNumber = url.split("/chatroom/")[1];
        int roomIndex = roomSessionList.size(); // 방 리스트의 크기
        if (!roomSessionList.isEmpty()) {
            // 기존 방 번호 정보 검색
            for (int i = 0; i < roomSessionList.size(); i++) {
                String currentRoomNumber = (String) roomSessionList.get(i).get("roomNumber");
                if (currentRoomNumber.equals(roomNumber)) {
                    isExistingRoom = true;
                    roomIndex = i;
                    break;
                }
            }
        }

        if (isExistingRoom) { // 기존 방이 있는 경우, 세션만 추가
            HashMap<String, Object> roomSessionMap = roomSessionList.get(roomIndex);
            roomSessionMap.put(session.getId(), session);
        } else { // 새로운 방을 생성하고 세션 추가
            HashMap<String, Object> roomSessionMap = new HashMap<>();
            roomSessionMap.put("roomNumber", roomNumber);
            roomSessionMap.put(session.getId(), session);
            roomSessionList.add(roomSessionMap);
        }

        // 세션 ID 전송
        JSONObject sessionIdObject = new JSONObject();
        sessionIdObject.put("type", "getId");
        sessionIdObject.put("sessionId", session.getId());
        session.sendMessage(new TextMessage(sessionIdObject.toJSONString()));
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 클라이언트와의 웹소켓 연결 종료
        if (roomSessionList.size() > 0) {
            // 해당 세션 정보 제거
            for (int i = 0; i < roomSessionList.size(); i++) {
                roomSessionList.get(i).remove(session.getId());
            }
        }
        super.afterConnectionClosed(session, status);
    }

    private static JSONObject jsonToObjectParser(String jsonStr) {
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = null;
        try {
            jsonObject = (JSONObject) parser.parse(jsonStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
}
