package p2024_07_03;

import java.util.Scanner;

public class If02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("정수를 입력 하세요?");
		Scanner sc = new Scanner(System.in);
		
		int n = sc.nextInt();
		
		if(n%2 ==0) {
			System.out.println(n+"은(는) 짝수");
		}else {
			System.out.println(n+"은(는) 홀수");
		}
	}

}
