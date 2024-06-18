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
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class ChatController {

    private static final Logger logger = Logger.getLogger(ChatController.class.getName());

    private static final String SECRET_KEY = "dHRFRmF6ZE9qWFd2dnNNcnhGZ1BRS3J0VGZ0RUl2TEY=";
    private static final String API_URL = "https://bgtp3dpg76.apigw.ntruss.com/custom/v1/14828/3965a753907d8398a2d872283a8b21282f3a930fcd429c433c23ca027dfd5c67";

    @MessageMapping("/sendMessage")
    @SendTo("/topic/public")
    public String sendMessage(@Payload String chatMessage) {
        try {
            logger.info("Sending message: " + chatMessage);
            URL url = new URL(API_URL);

            String message = getReqMessage(chatMessage);
            logger.info("Request message: " + message);
            String signature = makeSignature(message, SECRET_KEY);

            logger.info("Generated signature: " + signature);

            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json;UTF-8");
            con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", signature);

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(message.getBytes("UTF-8"));
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            logger.info("Response Code: " + responseCode);
            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"))) {
                    String decodedString;
                    StringBuilder jsonString = new StringBuilder();
                    while ((decodedString = in.readLine()) != null) {
                        jsonString.append(decodedString);
                    }
                    JSONParser jsonparser = new JSONParser();
                    JSONObject json = (JSONObject) jsonparser.parse(jsonString.toString());
                    JSONArray bubblesArray = (JSONArray) json.get("bubbles");
                    JSONObject bubbles = (JSONObject) bubblesArray.get(0);
                    JSONObject data = (JSONObject) bubbles.get("data");
                    String description = (String) data.get("description");
                    logger.info("Response description: " + description);
                    return description;
                }
            } else {
                try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"))) {
                    String errorString;
                    StringBuilder errorResponse = new StringBuilder();
                    while ((errorString = in.readLine()) != null) {
                        errorResponse.append(errorString);
                    }
                    logger.severe("Error Response: " + errorResponse.toString());
                    return "Error: " + errorResponse.toString();
                }
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Internal Server Error", e);
            return "Internal Server Error: " + e.getMessage();
        }
    }

    public static String makeSignature(String message, String secretKey) {
        try {
            byte[] secretKeyBytes = Base64.decodeBase64(secretKey);
            SecretKeySpec signingKey = new SecretKeySpec(secretKeyBytes, "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);
            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
            return Base64.encodeBase64String(rawHmac);
        } catch (Exception e) {
            Logger.getLogger(ChatController.class.getName()).log(Level.SEVERE, "Error while generating signature", e);
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

            JSONObject bubblesObj = new JSONObject();
            bubblesObj.put("type", "text");

            JSONObject dataObj = new JSONObject();
            dataObj.put("description", voiceMessage);

            bubblesObj.put("type", "text");
            bubblesObj.put("data", dataObj);

            JSONArray bubblesArray = new JSONArray();
            bubblesArray.add(bubblesObj);

            obj.put("bubbles", bubblesArray);
            obj.put("event", "send");

            logger.info("Request JSON: " + obj.toString());
            return obj.toString();
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while creating request message", e);
            return "";
        }
    }

    @GetMapping("/chatbot")
    public String chatbot() {
        return "/websocket/chatbot";
    }
}
