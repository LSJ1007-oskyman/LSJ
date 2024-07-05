package p2024_07_05;

public class MethodEx01 {
	
	static void check() {
		System.out.println("메소드 호출 성공");
		return;
	}
	
	static void check(int a) {
		System.out.println("전달된 값:"+a);
		return;
	}
	
	static void check(int a, double d) {
		double result =a +d;
		System.out.println("전달된 갑시 "+result);
		return;
	}
	
	static void check(char c) {
		System.out.println("전달된 값:"+c);
		return;
	}
	
	static void check(boolean b) {
		System.out.println("전달된 값:"+b);
		return;
	}
	
	static void check(String s) {
		System.out.println("전달된 값:"+s);
		return;
	}
	
	static int check01() {
		System.out.println("리턴구문");
		return 50;
	}
	
	static double check02(int a, double d) {
		double result = a+d;
		return result;
	}
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		check();
		check(30);
		check(10,20.5);
		check('A');
		check(true);
		check("자바");
		check(new String("파이썬"));
		
		check01();
		int result = check01();
		System.out.println("돌려 받은 값1:"+result);
		System.out.println("돌려 받은 값2:"+check01());
		
		double result2 = check02(50, 3.14);
		System.out.println("돌려 받은 값3:"+result2);
		System.out.println("돌려 받은 값4:"+check02(50, 3.14));
	}

}
