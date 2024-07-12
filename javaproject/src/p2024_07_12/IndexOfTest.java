package p2024_07_12;

public class IndexOfTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//int indexof(): 특정문자의 인덱스 번호를 구해주는 메서드

		String message = "Java program creates many objects.";
		
		//가장 먼저 나오는 'a'의 인덱스 번호를 구해준다.
		int index1= message.indexOf('a');
		int index2= message.indexOf(97);
		
		
		System.out.println(index1);
		System.out.println(index2);
		
		//인덱스 번호 13번 이후로 나오는 a라는 문자의 인덱스 번호를 구하라
		int index3= message.indexOf('a',13);
		
		System.out.println(index3);
		
		//가장먼저 나오는 'av'의 인덱스 번호를 구해준다.
		int index4= message.indexOf("av");
		System.out.println(index4);
			
		//인덱스번호 12번 이후의 'man'의 인덱스 번호를 구한다.
		int index5= message.indexOf("man",12);
		System.out.println(index5);
		
		//찾는 문자가 없을 경ㅇ에는 -을 리턴한다.
		int index6= message.indexOf("java");
		System.out.println(index6);
		
	}//end of  main

}//end of class
