package p2024_07_03;

public class While02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//while문을 이용해서 1~100까지 홀수, 짝수의 합을 구하는 프로그래을 작성하세요?
		//(단,while문 1개와 if~else문으로 작성 하세요?)
		
		int i=1, odd =0, even =0;
		while(i<=100)
		{
			if(i%2 == 1) 
			{
				odd+=i;
			}
			
			else 
			{
				even+=i;
			}
			
			i++;
		}
		System.out.println("1~100 홀수의 합:"+odd);
		System.out.println("1~100 짝수의 합:"+even);
		
	}

}
