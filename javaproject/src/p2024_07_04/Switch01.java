package p2024_07_04;

import java.util.Scanner;

public class Switch01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("0~100점 사이의 점수를 입력 하세요?");
		Scanner sc = new Scanner(System.in);
		int s =sc.nextInt();
		
		switch(s/10) {
			case 10:System.out.println("A학점");
					break;
			case 9: System.out.println("A학점");
					break;
			case 8: System.out.println("B학점");
					break;
			case 7: System.out.println("C학점");
					break;
			case 6: System.out.println("D학점");
					break;
			default :  System.out.println("F학점");
		}

	}

}
