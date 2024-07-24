package p2024_07_24;

import java.io.File;

public class FileTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			File temp = new File("c:/java01","temp");
			File tempFile = new File("test");
			
			System.out.println("create directory state : "+temp.mkdirs());
			System.out.println("create directory state : "+tempFile.mkdirs());
			
			System.out.println("temp canRead : "+temp.canRead());
			System.out.println("temp canWrite : "+temp.canWrite());
			System.out.println("temp getAbsoluteFile : "+temp.getAbsoluteFile());
			System.out.println("temp getName : "+temp.getName());
			System.out.println("temp getParent : "+temp.getParent());
			System.out.println("temp getPath : "+temp.getPath());
			System.out.println("temp isDirectory : "+temp.isDirectory());
			System.out.println("temp isFile : "+temp.isFile());
			
			//1.디렉토리 삭제:비어있는 디렉토리만 삭제가능
			//temp.delete();
			
			//2.비어있지 않는 디렉토리 삭제(과제)
			for(File f :tempFile.listFiles())
			{	
				f.delete();
			}
			tempFile.delete();
			
			//3.자식 디렉토리 삭제
			temp.delete();
			
			//4.부모 디렉토리 삭제
			temp.getParentFile().delete();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
