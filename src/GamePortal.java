import java.io.File;
import java.util.Scanner;

import Game.Game;
import Quiz.Quiz;
import CardGame.Uno;
import Shapeshifter.ShapeShifter;

public class GamePortal {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        Game quiz = new Quiz();
        Game uno = new Uno();
        Game shape = new ShapeShifter();

        while (true) {
            System.out.println("=== Game Portal ===");
            System.out.println("1. " + quiz.getName());
            System.out.println("2. " + uno.getName());
            System.out.println("3. " + shape.getName());
            System.out.println("0. Exit");
            System.out.print("Choose a game: ");

            String choice = input.nextLine();

            if (choice.equals("1")) {
                quiz.play();
            } else if (choice.equals("2")) {
                uno.play();
            } else if (choice.equals("3")) {
                shape.play();
            } else if (choice.equals("0")) {
                break;
            } else {
                System.out.println("Invalid input.");
            }

            System.out.println();
        }

        System.out.println("Goodbye!");
    }
}