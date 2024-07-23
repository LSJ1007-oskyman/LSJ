package p2024_07_23;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BufferedReaderEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		try {
			System.out.println("원하는 단을 입력하세요.");
			String inputString = br.readLine();
			int dan = Integer.parseInt(inputString);
			System.out.println(dan+"단");
			System.out.println("-----------");
			for(int i=1; i<10; i++) {
				System.out.println(dan+" * "+i+" = "+(dan*i));
			}
		} catch (Exception io) {
			io.printStackTrace();
		}
	}

}
