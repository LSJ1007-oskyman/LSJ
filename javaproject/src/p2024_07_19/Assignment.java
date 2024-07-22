package p2024_07_19;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class Assignment {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Calendar cal =new GregorianCalendar();
		System.out.println("년도를 입력하세요.");
		Scanner sc = new Scanner(System.in);
		int year = sc.nextInt();
		
		cal.set(Calendar.YEAR,year);
		cal.set(Calendar.MONTH,1);
				
		if(cal.getActualMaximum(Calendar.DAY_OF_MONTH)==29) {
			System.out.println("윤년입니다.");
		}else {
			System.out.println("윤년 아닙니다.");
		}

	}

}
