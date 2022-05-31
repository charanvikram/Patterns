import java.util.Scanner;
public class Main
{
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String gender = sc.next().toUpperCase();
		if(gender.equals("MALE")){
		    System.out.println("I am male");
		}
		else if(gender.equals("FEMALE")){
		    System.out.println("I am female");
		}
		else{
		    System.out.println("Entered incorrect input");
		}
		
	}
}
