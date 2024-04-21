
public class Test {

	public static void main(String[] args) {
		String t = "2023-06-09 15:55:05";
		
		String year = t.substring(0,4);
		String month = t.substring(5,7);
		String date = t.substring(8,10);
		String hour = t.split(" ")[1].substring(0,2);
		String minute = t.split(" ")[1].substring(3,5);
		
		System.out.println(year + "-" + month + "-" + date + " " + hour + ":" + minute);
	}

}
