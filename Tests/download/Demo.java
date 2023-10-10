import java.io.BufferedReader;
import java.io.FileReader;

public class Demo {
  public static void main(String args[]) {
    BufferedReader bufferedReader = new BufferedReader(FileReader("/Users/lion/sourcetree-workspace/demos/CLWordBook/Tests/download/cet64-8000-ios/GRE_8000_Words.txt"));
    String line = "";
    while (line = bufferedReader.readLine()) {
      System.out.println(line);
    }
    bufferedReader.close();

  }
}