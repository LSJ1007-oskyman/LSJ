package p2024_07_03;

public class Oper04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//아래 2가지 String 선언 방식이 있다
		
		String str1 ="자바";
		String str2 ="자바";//new를 쓰지 않고 같은 값을 선언하면 같은 주소값을 가진다
		String str3 =new String("자바");//new를 사용해서 선언하면 다른 주소값을 가진다
		
		if(str1 == str2) {
			System.out.println("같은주소");		
		}else {
			System.out.println("다른주소");
		}
		
		if(str1 == str3) {
			System.out.println("같은주소");		
		}else {
			System.out.println("다른주소");
		}
		
		//값을 비교
		System.out.println(str1.equals(str2));
		System.out.println(str1.equals(str3));

	}

}
