import java.util.Scanner;

public class CalculadoraApp {
    public static void main(String[] args) {
        System.out.println("*** APP CALCULADORA ***");

        System.out.println("Ingrese el valor 1: ");
        Scanner scanner = new Scanner(System.in);
        int operando1 = scanner.nextInt();
        System.out.println("Ingrese el valor 2: ");
        int operando2 = scanner.nextInt();
        int resultado = operando1 + operando2;
        System.out.println("El resultado es: " + resultado);
    }
}
