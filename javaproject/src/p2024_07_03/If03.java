package p2024_07_03;

import java.util.Scanner;

public class If03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int n1, n2, max, min;
		System.out.println("정수 2개를 입력 하세요?");
		Scanner sc = new Scanner(System.in);
		n1 = sc.nextInt();
		n2 = sc.nextInt();
		
		if(n1 >n2) {
			max = n1;
			min = n2;
		}else {
			max = n2;
			min = n1;
		}
		System.out.println("max="+ max);
		System.out.println("min="+ min);
	}

}
