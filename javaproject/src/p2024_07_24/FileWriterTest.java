package p2024_07_24;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileWriterTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			FileReader fr = new FileReader("data.txt");
			FileWriter fw = new FileWriter("data1.txt");
			int input=0;
			
			while((input = fr.read())!=-1) {
				System.out.print((char)input);
				fw.write(input);
			}
			fr.close();
			fw.close();
		} catch(IOException io) {
			System.out.println(io);
		}
	}

}
