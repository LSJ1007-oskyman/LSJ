package p2024_07_18;

import java.util.Scanner;

public class Year {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		int year = sc.nextInt();
		boolean flag = false;
		if(year%4 ==0)
		{
			flag = true;
			if(year%100 == 0)
			{
				flag =false;
				if(year%400 == 0)
				{
					flag =true;
				}
			}
		}
		
		if(flag ==true) System.out.println("윤년입니다.");
		else if(flag ==false) System.out.println("윤년이 아닙니다.");

	}

}
