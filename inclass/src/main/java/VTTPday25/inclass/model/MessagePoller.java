package VTTPday25.inclass.model;

import java.time.Duration;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

//interacts only with appconfig and inclass application
@Component
public class MessagePoller {
    @Autowired @Qualifier("redis-message-list")
    private RedisTemplate<String, String> template;

    //lets the start method asynchronously handle redis operations like right pop
    @Async
    public void start(){
        Runnable run = () -> {
            while(true){
                //call rightpop on redis list "sales", remove and return the last element
                //if list is empty when rightpop is called, the rightpop operation waits for up to 10 seconds for a new element
                //if not element is added withing 10 seconds, rightpop returns a null
                String message = template.opsForList().rightPop("sales", Duration.ofSeconds(10));
                if(message != null){
                    System.out.println("Message received: " + message); //usually where data processing happens
                }
            }
        };

        //polling logic will be executed on a seperate thread asynchronously and prevents blocking
        ExecutorService executor = Executors.newFixedThreadPool(1);
        executor.submit(run);

    }


    



}
