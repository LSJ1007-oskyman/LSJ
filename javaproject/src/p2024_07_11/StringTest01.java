package p2024_07_11;

public class StringTest01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str1 = "Java Programming";
		
		str1.toUpperCase();//->str1.toUpperCase()는 힙메모리에 저장되나 접근가능한 주소값을 가진 변수가 없다 ->이에 Garbage Collection가 지워줌
		System.out.println(str1);
		System.out.println(str1.toUpperCase());//->str1.toUpperCase()는 힙메모리에 저장되나 접근가능한 주소값을 가진 변수가 없다 ->이에 Garbage Collection가 지워줌
		
		String str2 = str1.toUpperCase();
		System.out.println(str2);
	}

}
