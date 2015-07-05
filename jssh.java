import java.io.FileReader;
import java.io.BufferedReader;
import java.io.File;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

public class jssh {
    public static void usage() {
        System.out.println("Usage: jssh <javascript.js> [arg1 [arg2 [...]]]\nNotes: args must less then 9");
    }

    public static boolean fileExists(String filename)
    {
        return new File(filename).exists();
    }

    public static boolean isInteger(String value) {
        try {
            Integer.parseInt(value);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static boolean isDouble(String value) {
        try {
            Double.parseDouble(value);
            if (value.contains("."))
                return true;
            return false;
        } catch (NumberFormatException e) { 
            return false;
        }
    }

    public static boolean isNumber(String value) {
        return isInteger(value) || isDouble(value);
    }

    public static void main(String[] args) {
         if (args.length > 10) {
             usage();
             return;
         }

        if (args[0].equals("--help")) {
            usage();
            return;
        }

        if (!fileExists(args[0])) {
            System.out.println("The javascript file \""+args[0]+"\" does not exist.");
            return;
        }

        String content = readFile(args[0]);
        for (int i = 0; i < args.length; i++) {
            if (isNumber(args[i])) {
                content = content.replace("$"+i, args[i]);
            } else {
                content = content.replace("$"+i, "\""+args[i]+"\"");
            }
        }
        content = content.replace("$n", ""+args.length);

        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine engine = manager.getEngineByName("js");
        try {
            engine.eval(content);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static String readFile(String fileName) {
        try {
            FileReader reader = new FileReader(fileName);
            BufferedReader bufferedReader = new BufferedReader(reader);
            String line = "";
            StringBuffer  buffer = new StringBuffer();
            while((line=bufferedReader.readLine())!=null){
                buffer.append(line);
            }
            reader.close();
            return buffer.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
}
