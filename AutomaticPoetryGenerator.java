
import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AutomaticPoetryGenerator {

    public static void main(String[] arguments) {
        ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor();

        Runnable periodicTask = new Runnable() {
            public void run() {
                try {
                    // Invoke method(s) to do the work
                    Runtime.getRuntime().exec("run.bat");
                } catch (IOException ex) {
                    Logger.getLogger(AutomaticPoetryGenerator.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        };

        executor.scheduleAtFixedRate(periodicTask, 0, 6, TimeUnit.HOURS);
    }
}