package p2024_07_23;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BufferedReaderTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);
		//BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.println("Input Data : ");
		
		try {
			String inputString = br.readLine();
			System.out.println();
			System.out.println("Output String = "+inputString);
		} catch (IOException io) {
			System.out.println(io.getMessage());
		}
	}

}
