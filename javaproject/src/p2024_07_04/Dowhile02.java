package p2024_07_04;

public class Dowhile02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//do~while문으로 1~100까지 홀수, 짝수의 합을 구하는 프로그램을 작성하세요?
		int i=1, odd=0, even=0;
		do {
			if(i%2==1) {
				odd+=i;
			}
			else {
				even+=i;
			}
			i++;
		}while(i<=100);
		System.out.println("1~100 홀수의 합:"+odd);
		System.out.println("1~100 짝수의 합:"+even);
	}

}
