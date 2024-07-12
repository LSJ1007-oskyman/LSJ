package p2024_07_12;

public class SubstringEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//아래와 같은 주민번호가 있을때, 남자인지 여자인지를 판벼랗는 프로그램 작성하세요?
		
		String jumin = "950101-2234567";
		
		String gender = jumin.substring(7,8);
		System.out.println(gender);
		
		char gender_c = jumin.charAt(7);
		if(gender_c == '1' || gender_c == '3') {
			System.out.println("남자");
		}else if(gender_c == '2' || gender_c == '4') {
			System.out.println("여자");
		}else {
			System.out.println("잘못된 정보 입니다.");
		}
		
		if(gender.equals("1") || gender.equals("3")) {
			System.out.println("남자");
		}else if(gender.equals("2") || gender.equals("4")) {
			System.out.println("여자");
		}else {
			System.out.println("잘못된 정보 입니다.");
		}
	}//end of main

}//end of class
