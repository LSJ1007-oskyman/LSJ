package p2024_07_24;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;


public class FileOutputStreamTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			
			//출력 스트림으로 출력한 내용을 iodata.txt 파일에 저장
			FileOutputStream fos = new FileOutputStream("iodata.txt");
			DataOutputStream dos = new DataOutputStream(fos);
			dos.writeBoolean(true);
			dos.writeChar('j');
			dos.writeInt(1234);
			dos.writeFloat(3.14F);
			dos.writeDouble(123.5423);
			dos.writeUTF("자바");
			
			//iodata.txt 파일의 내용을 읽어온다.
			FileInputStream fis = new FileInputStream("iodata.txt");
			DataInputStream dis = new DataInputStream(fis);
			System.out.println(dis.readBoolean());
			System.out.println(dis.readChar());
			System.out.println(dis.readInt());
			System.out.println(dis.readFloat());
			System.out.println(dis.readDouble());
			System.out.println(dis.readUTF());
			dis.close();
			dos.close();
		} catch(IOException io) {
			System.out.println(io.getMessage());
		}

	}

}
