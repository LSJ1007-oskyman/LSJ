package p2024_07_11;

class MyDate{

	private int year;		// 필드
	private int month;
	private int day;
	
	// 생성자는 클래스로 객체를 생성할때 호출되며, 필드값을 초기화 시키는 역할을 한다. 
	public MyDate() {		// 기본 생성자
		year = 2024;
		month = 7;
		day = 11;
	}
	
	public MyDate(int year, int month, int day) {
		this.year = year;		// 2024
		this.month = month;		// 12
		this.day = day;			// 25
	}

	public void print() {	// 메소드
		System.out.println(year+"/"+month+"/"+day);
	}	
}

public class ClassTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MyDate d = new MyDate();
//		               생성자 호출
		
		// private 접근 제어자는 외부 클래스의 접근을 허용하지 않기 때문에
		// 직접 접근 할 수 없다.
		// System.out.println(d.year);   오류발생
		
		d.print();		
		
		MyDate d2 = new MyDate(2024,12,25);
		d2.print();
		
	}

}



