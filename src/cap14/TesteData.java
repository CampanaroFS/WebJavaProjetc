package cap14;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
public class TesteData {
	public static void main(String[] args) {
		String data = "29/07/2019";
		Date data1 = null;
		
		try {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			data1 = df.parse(data);
			System.out.println(data1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
