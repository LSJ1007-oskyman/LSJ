package p2024_07_11;

public class ConnectString {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String gemini = "gemini";
		String johnharu = "johnharu";
		
		//두 String 객체를 "+"연산 수행
		String tempString1 =gemini + johnharu;
		System.out.println(tempString1);
		System.out.println("gemini"+"johnharu");
		
		//String + 정수형
		String tempString2 = tempString1 +100;
		System.out.println(tempString2);
	}

}
