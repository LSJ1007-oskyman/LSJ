package p2024_07_26;


import java.util.GregorianCalendar;
import java.util.Scanner;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		GregorianCalendar c =new GregorianCalendar();
		System.out.print("년도를 입력하세요");
		Scanner sc =new Scanner(System.in);
		int year = sc.nextInt();
		if(c.isLeapYear(year)) System.out.println("윤년입니다.");
		else System.out.println("윤년이 아닙니다.");

	}

}

