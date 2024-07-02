package p2024_07_02;

public class PromotionEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		자동 타입 변환 : 작은 자료형 데이터를 큰 자료형 변수에 할당하는 경우
		
		byte byteValue =10;
		int intValue = byteValue;
		System.out.println("intValue: " + intValue);
		
		char charValue = '가';
		intValue = charValue;
		System.out.println("가의 유니코드 : " + intValue);
		
		intValue =50;
		long longValue = intValue;
		System.out.println("longValue : " + longValue);

		longValue =100;
		float floatValue = longValue;
		System.out.println("floatValue : " + floatValue);
		
		floatValue =100.5F;
		double doubleValue = floatValue;
		System.out.println("doubleValue : " + doubleValue);
		
	}

}
