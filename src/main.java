import java.sql.*;
import java.util.Scanner;

public class main {

    public static final String DEFAULT_DRIVER_CLASS = "com.mysql.cj.jdbc.Driver";
    public static String hostname = "127.0.0.1";
    public static String dbName = "la_traviata";
    public static int port = 3306;
    public static final String DEFAULT_URL = "jdbc:mysql://"+ hostname +":"+port+"/"+dbName + "?useSSL=false";
    private static final String DEFAULT_USERNAME = "root";
    private static final String DEFAULT_PASSWORD = "";
    private static int quest_id = 0;
    private static Quest quest;
    private static String name;
    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        print("La Traviata"); // Intro
        print("Choose a name for your character: ");
        System.out.print("> ");
        name = scanner.next(); // Select a custom name for the protagonist. This will replace all instances of the name in the story.
        run(); // Start the game loop
    }

    /**
     * Pretty printer, centeres text in console
     * @param text Text that you want printed
     */
    public static void print(String text){
     int indent = 20 - text.length()/2;
     for(int i = 0; i < indent; i++){
         System.out.print(" ");
     }
     System.out.print("~ " + text + " ~");
     System.out.println();
    }

    /**
     * Replaces every instance of #name with the variable name
     * @param text The text that should be processed.
     */
    public static String replace(String text){
        String returnString = "";
        int ignore = 0;
        for(int i = 0; i < text.length(); i++){
            if(ignore > 0){
                ignore--;
            } else {
                if(text.charAt(i) == '#'){
                    ignore = 4;
                    returnString += name;
                } else {
                    returnString += text.charAt(i);
                }
            }
        }

        return returnString;
    }

    /**
     * Game loop
     */
    public static void run(){
        quest = getQuest(quest_id);
        print("Text");
        String text = quest.text.substring(1, quest.text.length()-2);
        text = replace(text);
        printLong(text);
        print("Options");
        for(int i = 0; i < quest.options.length; i++) {
            if (quest.options[i] != null) {
                System.out.println("[" + (i + 1) + "] > " + quest.options[i].substring(2));
            }
        }

        System.out.print("> ");
        quest_id = Integer.parseInt(quest.options[Integer.parseInt(scanner.next())-1].substring(0, 1));
        run(); // Loop around with the new selected option
    }

    /**
     * Print a longer text, will line break when necessary
     * @param text
     */
    public static void printLong(String text){
        String[] textArr = text.split(" ");
        int rowLength = 0;
        for(int i = 0; i < textArr.length; i++){
            if(rowLength + textArr[i].length() > 40){
                System.out.println();
                rowLength = 0;
            } else {
                System.out.print(textArr[i] + " ");
                rowLength+=textArr[i].length();
            }
        }
        System.out.println();
    }

    /**
     * Get quest from quest_id. Connects to the database and retrieves the quest.
     * @param id quest_id of the quest you want
     * @return The Quest
     */
   public static Quest getQuest(int id){
       Connection connection = null;

       try {
           Class.forName(DEFAULT_DRIVER_CLASS);
           connection = DriverManager.getConnection(DEFAULT_URL, DEFAULT_USERNAME, DEFAULT_PASSWORD);

           PreparedStatement ps = null;
           ResultSet rs = null;
           ps = connection.prepareStatement("SELECT * FROM story");
           rs = ps.executeQuery();


           while (rs.next()) {
               if(rs.getInt("question_id") == id){
                   return new Quest(id, rs.getString("text"), rs.getString("options"));
               }
           }

       } catch (SQLException e) {
           System.err.println(e.getMessage());
       } catch (Exception e) {
           System.err.println(e.getMessage());
       }
       return new Quest(-1, "", "");
   }
}