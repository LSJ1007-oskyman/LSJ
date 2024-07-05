package p2024_07_05;

public class MethodEX02 {

	static void sum(int n) {
		int hap=0;
		for(int i=1; i<=n; i++)
		{
			hap+=i;
		}
		System.out.println("1~"+n+"="+hap);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		sum(3);
		sum(5);
		sum(10);
		sum(30);
		sum(100);
		sum(1000);
		sum(10000);
	}

}
