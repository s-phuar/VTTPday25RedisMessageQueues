package VTTPday25.inclass.model;

import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.stereotype.Component;

@Component
public class SalesSubscribe implements MessageListener {
    //onMessage method is called whenever a message is published to 'sales' Redis channel that salesSubscribe listener is subscribed to
    //method prints out and converts the message body from a byte array to a String
    @Override
    public void onMessage(Message message, byte[] pattern){
        System.out.println("Message received: " + message.toString());
        String txt = new String(message.getBody());
        System.out.println("Message received: " + txt);
    }


}
