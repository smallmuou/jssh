import java.io.FileReader;
import java.io.File;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

public class jssh {
    public static void usage() {
        System.out.println("Usage: jssh <javascript.js>");
    }

    public static boolean fileExists(String filename)
    {
        return new File(filename).exists();
    } 

    public static void main(String[] args) {
        if (args.length != 1) {
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

        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine engine = manager.getEngineByName("js");
        try {
            FileReader reader = new FileReader(args[0]);
            engine.eval(reader);
            reader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
