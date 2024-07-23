package p2024_07_23;

import java.io.IOException;
import java.io.InputStreamReader;

public class InputStreamReaderTest2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		InputStreamReader isr = new InputStreamReader(System.in);
		
		int inputValue = 0;
		char[] temp = new char[10];
		
		System.out.println("Input Value : ");
		
		try {
			inputValue = isr.read(temp);
		} catch (IOException io) {
			io.printStackTrace();
		}
		System.out.println("InputValue : "+inputValue);
		
		for(int i=0; i<inputValue; i++) {
			System.out.println(temp[i]);
		}
		
		System.out.println("char[] -> String : "+new String(temp));

	}

}
