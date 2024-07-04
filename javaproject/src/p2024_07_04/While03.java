package p2024_07_04;

import java.util.Scanner;

public class While03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int i=1;
		System.out.println("원하는 단을 입력하세요?");
		Scanner sc = new Scanner(System.in);
		
		int dan = sc.nextInt();
		
		while(i<=9)
		{
			System.out.println(dan+"*"+i+"="+dan*i);
			i++;
		}

	}

}
