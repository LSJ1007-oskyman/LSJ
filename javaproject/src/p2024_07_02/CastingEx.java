package p2024_07_02;

public class CastingEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		강제 형변환: 큰 자료형 데이터를 작은 자료형 변수에 할당하는 경우
		int intValue = 44032;
		char charValue = (char)intValue;
		System.out.println(charValue);
		
		long longValue= 500;
		intValue = (int)longValue;
		System.out.println(intValue);
		
		double doubleValue = 3.14;
		intValue = (int)doubleValue;
		System.out.println(intValue);
		
	}

}
