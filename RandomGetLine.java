
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class RandomGetLine {

    public static void main(String[] arguments) throws FileNotFoundException, IOException {
        boolean isDebugMode = arguments.length >= 2 && arguments[1].equalsIgnoreCase("-debug");
        BufferedReader reader = new BufferedReader(new FileReader(arguments[0]));
        Random random = new Random();
        int totalLines = 0;
        List<String> lines = new ArrayList<String>();
        String line;
        int count = 1;
        while ((line = reader.readLine()) != null) {
            if (isDebugMode) {
                System.out.println(count++ + line);
            }
            totalLines++;
            lines.add(line);
        }
        if (isDebugMode) {
            System.out.println("");
        }
        int totalSpace = (int) Math.floor(totalLines/4);
        int randomLineNumber = random.nextInt(totalSpace) + 1;
        int headerLine = randomLineNumber * 4;
        String poemLine = lines.get(headerLine);
        String templatesLine = lines.get(headerLine + 1);
        String slotFillersLine = lines.get(headerLine + 2);
        
        System.out.printf("%s\n%s\n%s\n\n", poemLine, templatesLine, slotFillersLine);
    }
}