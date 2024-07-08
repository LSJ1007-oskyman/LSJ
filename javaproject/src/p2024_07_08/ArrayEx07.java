package p2024_07_08;

public class ArrayEx07 {

	static int abs(int data)
	{
		if(data<0)
			data = -data;
		return data;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("args[0]: "+args[0]);
		System.out.println("args[1]: "+args[1]);
		
		int num = Integer.parseInt(args[0]);
		System.out.println("절대값: "+abs(num));
	}

}
