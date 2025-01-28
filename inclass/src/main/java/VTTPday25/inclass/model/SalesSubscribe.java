package VTTPday25.inclass.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;


//interacts only with appconfig
//method only triggers when we publish (not list) to sales channel
//spring has automatically scanned for beans, this @component bean is automatically added in appconfig's redis-pubsub through autowired
@Component //can use @Service as well
public class SalesSubscribe implements MessageListener {
    //onMessage method is called whenever a message is published to 'sales' Redis channel that salesSubscribe listener is subscribed to
    //method prints out and converts the message body from a byte array to a String
    @Override
    public void onMessage(Message message, byte[] pattern){
        System.out.println("Message received by sales subscriber: " + message.toString());
        //byte[] data = message.getBody();
        //JsonReader reader = Json.createReader(new ByteArrayInputStream(data));
        //JsonObject jsonData = reader.readObject();
        //process data further....
        String txt = new String(message.getBody());
        System.out.println("Message received by sales subscriber again...: " + txt);
    }

    //How can we publish messages to the sales channel without directly using redis-cli in ubuntu?
        // @Autowired private RedisTemplate<String, String> template;
        //below is functionally the same as publish [channel] [message]
        // template.convertAndSend(Channel.of("sales").getTopic(), sales.toJson().toString());




}
