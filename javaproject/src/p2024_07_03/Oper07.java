package p2024_07_03;

import java.util.Scanner;

public class Oper07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int n1,n2,n3,n4,n5,n6,total;
		double avg;
		System.out.println("5과목의 점수를 입력 하세요?");
		Scanner sc = new Scanner(System.in);
		
		n1 = sc.nextInt();
		n2 = sc.nextInt();
		n3 = sc.nextInt();
		n4 = sc.nextInt();
		n5 = sc.nextInt();
		
		total = n1 + n2 + n3 + n4 + n5;
		
		//1.int형과 int형을 산술연산을 수행하면 int형으로 처리된다.
		//2.int형과 double형을 산술연산을 수행하면 큰자료형인 double형으로 처리된다.
		//아래 과정에서 double로 강제변환을 안하면 avg가 int처리됬다가 avg선언이 double형이므로 다시 강제 double형변환되어서 자료 손실남
		
		avg = (double)total /(double)5;
		System.out.println("avg: "+avg);
		
		if(n1>=40 && n2>=40 && n3>=40 && n4>=40 && n5>=40 && avg>=60 ) {
			System.out.println("합격");
		}else {
			System.out.println("불합격");
		}

	}

}
