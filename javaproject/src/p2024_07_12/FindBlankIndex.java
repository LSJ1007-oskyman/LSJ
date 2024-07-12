package p2024_07_12;

public class FindBlankIndex {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//length() : 문자열의 길이를 구해주는 역할
		
		String message = "Java program creates many objects.";
		
		int len = message.length();
		
		System.out.println(len);
		
		for(int i=0; i<len; i++)
		{
			char c = message.charAt(i);
			if(c == ' ')
			{
				System.out.println("index = "+i);
			}
		}

	}//end of main

}//end of class
