package p2024_07_03;

import java.util.Scanner;

public class If04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		키보드로 입력한 점수가 어느학점에 해당 되는지 판별하는 프로그램을 작성하세요?
//		90점 이상 - A학점
//		80점 이상 - B학점
//		70점 이상 - C학점
//		60점 이상 - D학점
//		60점 미만 - F학점
		
		System.out.println("0~100점 사이의 점수를 입력 하세요?");
		Scanner sc = new Scanner(System.in);
		int s =sc.nextInt();
		
		if(s>=90) {
			System.out.println("A학점");
		}else if(s>=80) {
			System.out.println("B학점");
		}else if(s>=70) {
			System.out.println("C학점");
		}else if(s>=60) {
			System.out.println("D학점");
		}else {
			System.out.println("F학점");
		}

	}

}
