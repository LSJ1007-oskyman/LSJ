package p2024_07_24;

import java.io.FileReader;

public class FileReaderTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FileReader file = null;
		int inputValue =0;
		
		try {
			file = new FileReader("data.txt");
			
			//file의 끝을 만날 때 까지 데이터를 읽어 온다. 파일의 끝을 만나면 -1을 반환
			while((inputValue = file.read()) != -1) {
				System.out.print((char)inputValue);
			}
			file.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

}
