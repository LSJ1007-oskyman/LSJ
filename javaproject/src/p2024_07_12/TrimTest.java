package p2024_07_12;

public class TrimTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//trim() : 문자열 좌,우의 공백을 없애주는 역할
		//boolean equals() : 문자열 값을 비교하는 역할
		
		String str1 = new String("gemini  ");
		String str2 = new String("   gemini ");
		
		System.out.println(str1.equals(str2));
		System.out.println(str1.trim().equals(str2.trim()));

	}//end of main

}//end of class
