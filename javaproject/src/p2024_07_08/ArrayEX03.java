package p2024_07_08;

import java.util.Scanner;

public class ArrayEX03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int s[]= new int[5];
		System.out.println("5과목의 점수를 입력하세요?");
		Scanner sc = new Scanner(System.in);
		
		int sum=0;
		for(int i =0 ;i<5; i++)
		{
			s[i] = sc.nextInt();
			sum+=s[i];
		}
		
		double avg = sum/5.0;
		System.out.println("총점: "+sum);
		System.out.println("평균: "+avg);

	}

}
