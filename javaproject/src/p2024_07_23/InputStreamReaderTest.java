package p2024_07_23;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class InputStreamReaderTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		InputStream is = System.in;
		//InputStreamReader: 문자 스트림으로 2바이트를 읽어온다.->한글 1자만 입력받을 수 있다.
		InputStreamReader isr = new InputStreamReader(is);
		//InputStreamReader isr = new InputStreamReader(System.in);
		
		int inputValue =0;
		System.out.println("Input Value : ");
		try { 
			
			inputValue = isr.read();
		}catch (IOException io) {
			System.out.println(io.getMessage());
		}
		System.out.println("Input Result : "+inputValue);
		System.out.println("Input Result : "+(char)inputValue);
	}

}
