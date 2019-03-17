import org.json.*;

public class Quest {

    public int question_id;
    public String text;
    public String[] options = new String[4];

    Quest(int question_id, String text, String options){
        if(question_id < 0)System.err.println("Invalid question_id");
        this.text = text;
        this.question_id = question_id;
        try{
            JSONArray jsonArray = new JSONArray(options);
            for(int i = 0; i < jsonArray.length(); i++){
                this.options[i] = jsonArray.get(i).toString();
            }
        } catch (org.json.JSONException e){
            System.err.println("JSON Error");
        }
    }
}
