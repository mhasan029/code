
class MyClass {
	   int num;
	   
	   MyClass(int n ) {
	      num = n;
	   }
	}

public class FindFactorial {

	public static void main(String[] args) {
		
		MyClass MyObj = new MyClass(4);
		int fact =1;
		for (int i=1; i<=MyObj.num;i++) {
			fact = fact*i;
		}
		System.out.println("Factorial of " + MyObj.num + " is: " + fact);
		

	}

}


