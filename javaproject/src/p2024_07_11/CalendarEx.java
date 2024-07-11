package p2024_07_11;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class CalendarEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		3.Calendar 클래스
//		Calendar c1 = new Calendar(); ->실행 오류
		Calendar c2 = new GregorianCalendar();//둘이 상속관계여야 한다 ->Calendar 클래스의 자식클래스가 GregorianCalendar클래스다
		//이것을 자동형변환, 업캐스팅이라고 한다.
		
		Calendar c = Calendar.getInstance();
		System.out.println(c);
		System.out.println(Calendar.YEAR);
		
		int y = c.get(Calendar.YEAR);
		int m = c.get(Calendar.MONTH)+1;
		int d = c.get(Calendar.DATE);
		System.out.println(y+"-"+m+"-"+d);
		int h1 = c.get(Calendar.HOUR);
		int h2 = c.get(Calendar.HOUR_OF_DAY);
		int ap = c.get(Calendar.AM_PM);
		if(ap == 0) {
			System.out.println("오전");
		}else {
			System.out.println("오후");
		}
		
		int mm = c.get(Calendar.MINUTE);
		int s = c.get(Calendar.SECOND);
		
		System.out.println(h1+":"+mm+":"+s);
		System.out.println(h2+":"+mm+":"+s);

	}

}
