import java.io.File;
import java.util.Scanner;

import Game.ErrorCheck;
import Game.Game;

public class GamePortal {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        File highScoreFile = new File("highscores.csv");

        Game[] games = new Game[] {
            new BuzzfeedQuiz(),
            new Uno(),
            new ShapeShifter()
        };

        while (true) {
            System.out.println("\n=== GAME PORTAL ===");
            for (int i = 0; i < games.length; i++) {
                System.out.println((i + 1) + ". " + games[i].getGameName());
            }
            System.out.println((games.length + 1) + ". Quit");
            System.out.print("Choose a game: ");

            int choice = ErrorCheck.getInt(sc);

            if (choice == games.length + 1) {
                System.out.println("Goodbye!");
                break;
            }

            if (choice < 1 || choice > games.length) {
                System.out.println("Invalid choice.");
                continue;
            }

            Game selected = games[choice - 1];
            selected.play();
            selected.writeHighScore(highScoreFile);
        }

        sc.close();
    }
}