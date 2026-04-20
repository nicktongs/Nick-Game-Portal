import Game.Game;
import Quiz.Quiz;
import java.util.Scanner;

public class GamePortal {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Game quiz = new Quiz();

        while (true) {
            System.out.println("=== Game Portal ===");
            System.out.println("1. " + quiz.getName());
            System.out.println("0. Exit");
            System.out.print("Choose a game: ");

            String choice = input.nextLine();

            if (choice.equals("1")) {
                quiz.play();
            } else if (choice.equals("0")) {
                break;
            } else {
                System.out.println("Invalid input.");
            }
        }

        System.out.println("Goodbye!");
    }
}