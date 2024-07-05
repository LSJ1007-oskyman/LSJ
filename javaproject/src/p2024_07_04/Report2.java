package p2024_07_04;

import java.util.Scanner;

public class Report2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("팩토리얼을 구하시오");
		
		Scanner sc= new Scanner(System.in);
		
		int num=sc.nextInt();
		int p=1;
		for(int i=num; i>0; i--)
		{
			p*=i;
		}
		
		System.out.println(num+"!: "+p);
	}

}
