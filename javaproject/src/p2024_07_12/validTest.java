package p2024_07_12;

import java.util.Scanner;

public class validTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc = new Scanner(System.in);
		try {

			System.out.println("앞자리 6자리를 입력하세요");
			String socialSecurityNumberFront = sc.nextLine();
			while (socialSecurityNumberFront.length() != 6) {
				System.out.println("잘못입력하셨습니다. 앞자리 6자리를 입력하세요");
				socialSecurityNumberFront = sc.nextLine();
			}

			System.out.println("뒷자리 7자리를 입력하세요");
			String socialSecurityNumberBack = sc.nextLine();

			while (socialSecurityNumberBack.length() != 7) {
				System.out.println("잘못입력하셨습니다. 뒷자리 7자리를 입력하세요");
				socialSecurityNumberBack = sc.nextLine();
			}

			if (socialSecurityNumberBack.charAt(0) == '1' || socialSecurityNumberBack.charAt(0) == '3') {
				System.out.println("남자");
			} else if (socialSecurityNumberBack.charAt(0) == '2' || socialSecurityNumberBack.charAt(0) == '4') {
				System.out.println("여자");
			} else {
				System.out.println("잘못된 입력값입니다.");
			}

			System.out.println("실행 완료");
		} catch (Exception e) {
			System.out.println("잘못된 입력입니다.");
		}//end of try-catch

	}// end of main

}// end of class
