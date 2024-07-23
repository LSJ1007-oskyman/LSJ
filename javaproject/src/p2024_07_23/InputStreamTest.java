package p2024_07_23;

import java.io.IOException;
import java.io.InputStream;

public class InputStreamTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//system.in은 표준입력 장치인 키보드로 입력 받는다는 의미를 가지고 있다.
		InputStream is = System.in;
		int inputValue = 0;
		System.out.println("Input Data : ");
		
		try {
			//read()메소드는 1바이트를 읽어와서 ascii코드 값으로 casting
			inputValue = is.read();
		}catch (IOException io) {
			System.out.println(io.getMessage());
		}
		System.out.println("InputData is "+inputValue);
		System.out.println("InputData is "+(char)inputValue);

	}

}
