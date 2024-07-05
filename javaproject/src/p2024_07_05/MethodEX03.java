package p2024_07_05;

import java.util.Scanner;

public class MethodEX03 {
	static int max (int a, int b) {
		if(a>b)
			return a;
		else
			return b;
		
	}
	
	static int min (int a, int b) {
		if(a<b)
			return a;
		else
			return b;
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int n1,n2,max,min;
		System.out.println("2개의 정수를 입력 하세요?");
		Scanner sc= new Scanner(System.in);
		n1 = sc.nextInt();
		n2 = sc.nextInt();
		
		max = max(n1,n2);
		min = min(n1,n2);
		System.out.println("max: "+max);
		System.out.println("min: "+min);
	}

}
