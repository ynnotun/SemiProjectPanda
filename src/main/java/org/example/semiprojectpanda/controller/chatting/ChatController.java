package org.example.semiprojectpanda.controller.chatting;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

@Controller
public class ChatController {

    private static String secretKey = "SEpsU0ZHYmRPRmhHQVpmZVVxSUt5WmhidENSQmRYZ1c=";
    private static String apiUrl = "https://hfuj5gbnfk.apigw.ntruss.com/custom/v1/14820/662fd478ae538e1b0f002e1f97097070696872adc2748b8e2b46954a9ae0c115";

    @MessageMapping("/sendMessage")
    @SendTo("/topic/public")
    public String sendMessage(@Payload String chatMessage) {
        try {
            URL url = new URL(apiUrl);

            String message = getReqMessage(chatMessage);
            String encodeBase64String = makeSignature(message, secretKey);

            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json;UTF-8");
            con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.write(message.getBytes("UTF-8"));
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            if (responseCode == 200) {
                BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
                String decodedString;
                StringBuilder jsonString = new StringBuilder();
                while ((decodedString = in.readLine()) != null) {
                    jsonString.append(decodedString);
                }
                in.close();

                JSONParser jsonparser = new JSONParser();
                JSONObject json = (JSONObject) jsonparser.parse(jsonString.toString());
                JSONArray bubblesArray = (JSONArray) json.get("bubbles");
                JSONObject bubbles = (JSONObject) bubblesArray.get(0);
                JSONObject data = (JSONObject) bubbles.get("data");
                String description = (String) data.get("description");
                System.out.println(description);
                return description;
            } else {
                return "Error: " + con.getResponseMessage();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "Internal Server Error: " + e.getMessage();
        }
    }

    public static String makeSignature(String message, String secretKey) {
        try {
            byte[] secrete_key_bytes = Base64.decodeBase64(secretKey);
            SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);
            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
            return Base64.encodeBase64String(rawHmac);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public static String getReqMessage(String voiceMessage) {
        try {
            JSONObject obj = new JSONObject();
            long timestamp = new Date().getTime();
            obj.put("version", "v2");
            obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
            obj.put("timestamp", timestamp);

            JSONObject bubbles_obj = new JSONObject();
            bubbles_obj.put("type", "text");

            JSONObject data_obj = new JSONObject();
            data_obj.put("description", voiceMessage);

            bubbles_obj.put("type", "text");
            bubbles_obj.put("data", data_obj);

            JSONArray bubbles_array = new JSONArray();
            bubbles_array.add(bubbles_obj);

            obj.put("bubbles", bubbles_array);
            obj.put("event", "send");

            System.out.println(obj.toString());
            return obj.toString();
        } catch (Exception e) {
            System.out.println("## Exception : " + e);
            return "";
        }
    }

    @GetMapping("/chatbot")
    public String chatbot() {
        return "/websocket/chatbot";
    }
}
