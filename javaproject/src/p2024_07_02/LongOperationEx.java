package p2024_07_02;

public class LongOperationEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		byte value1 =10;	//1byte
		int value2 = 100;   //4byte
		long value3 = 1000L;//8byte
		long result = value1 + value2 + value3; //산술연산자로 서로다른 자료형을 계산하면 가장큰 자료형으로 자동변환
		System.out.println(result);
	}

}
