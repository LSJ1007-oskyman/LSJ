package p2024_07_12;

import java.util.Scanner;

public class SocialSecurityNumberValidTest {

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

			int checkNum=Integer.parseInt(socialSecurityNumberBack.substring(6,7));
			int sum=0;
			int[]vaildNum = {2,3,4,5,6,7,8,9,2,3,4,5}; 
			
			for(int i=0;i<socialSecurityNumberFront.length();i++)
			{
				int temptNum=Integer.parseInt(socialSecurityNumberFront.substring(i,i+1));
				sum+=(vaildNum[i]*temptNum);
			}
			
			for(int i=0;i<socialSecurityNumberBack.length()-1;i++)
			{
				int temptNum=Integer.parseInt(socialSecurityNumberBack.substring(i,i+1));
				sum+=(vaildNum[i+6]*temptNum);
			}
			
			int checking = sum%11;
			int vaildN=0;
			
			if((11-checking)>=10) {
				vaildN=(11-checking)%10;
			} else {
				vaildN=11-checking;
			}
			
			
			if(vaildN != checkNum) System.out.println("유효하지 않은 번호입니다.");
			
			System.out.println("실행 완료");
		} catch (Exception e) {
			System.out.println("잘못된 입력입니다.");
		}//end of try-catch

	}// end of main
}//end of class
