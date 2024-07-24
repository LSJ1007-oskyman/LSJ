package p2024_07_24;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Assign {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
try {
			Scanner sc = new Scanner(System.in);
			String temp = sc.nextLine();
			
			FileWriter fw = new FileWriter("result.txt");
			
			fw.write(temp);
			
			
			fw.close();
		} catch(IOException io) {
			System.out.println(io.getMessage());
		}


	}

}
