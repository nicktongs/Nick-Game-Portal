
package Quiz;
import Game.GameWriteable;
import java.io.File;
import java.util.Scanner;

public class Quiz implements GameWriteable {
        static Scanner sc = new Scanner(System.in);
private static int score=0;
        public static void main(String[] args) {
                // Create Categories
                Category GE = new Category("German Empire", "You are disciplined, organized, and driven by honor and achievement." +  
                " You like structure, efficiency, and planning ahead.");
                Category BE = new Category("British Empire", "You value stability, tradition, and influence at a distance. You stay calm under pressure" + 
                " and prefer thoughtful action, trying to mastermind any situation");
                Category FE = new Category("French Empire", "You are creative, expressive, and proud. You care most about style, culture, and" +
                " making a strong personal impression.");
                Category RE = new Category("Russian Empire", "You are intense, emotional, and driven by big ideals and beliefs." +
                "You may feel things deeply and transform over time.");
                Category AH = new Category("Austria-Hungary", "You balance many different sides of yourself. You care about harmony and connection," +
                " even when it is hard to keep everything together.");
                Category USA = new Category("United States of America", "You are optimistic, adaptable, and independent. You like new ideas, choice, and the freedom" +
                " to find your own path");
                // Create Questions
                Question q1 = new Question("What is your ideal way to spend the weekend?");
                // Attach Answers to Questions
                q1.possibleAnswers[0] = new Answer("Planning a new project/challenge", GE);
                q1.possibleAnswers[1] = new Answer("Reading by the fireplace", BE);
                q1.possibleAnswers[2] = new Answer("Strolling through a museum or sitting in a cafe", FE);
                q1.possibleAnswers[3] = new Answer("Debating with friends", RE);
                q1.possibleAnswers[4] = new Answer("Hosting a dinner for some friends", AH);
                q1.possibleAnswers[5] = new Answer("Going on an adventurous road trip", USA);

                Question q2 = new Question("How do you handle conflict?");
                q2.possibleAnswers[0] = new Answer("Control the situation", GE);
                q2.possibleAnswers[1] = new Answer("Negotiate patiently before escalating the conflict", BE);
                q2.possibleAnswers[2] = new Answer("Stand firm to fight for your dignity", FE);
                q2.possibleAnswers[3] = new Answer(" Let your emotions explode first, then reflect", RE);
                q2.possibleAnswers[4] = new Answer("Try to mediate but end up caught between both sides", AH);
                q2.possibleAnswers[5] = new Answer("Step in only when it affects your interests", USA);

                Question q3 = new Question("What kind of leader would you want to be?");
                q3.possibleAnswers[0] = new Answer("Strategic and orderly", GE);
                q3.possibleAnswers[1] = new Answer("Calm and respected", BE);
                q3.possibleAnswers[2] = new Answer("Charming and occasionally unpredictable", FE);
                q3.possibleAnswers[3] = new Answer("Compassionate but also volatile", RE);
                q3.possibleAnswers[4] = new Answer("Balancing multiple interests with difficulty, hard to adapt.", AH);
                q3.possibleAnswers[5] = new Answer("Charismatic and persuasive/adaptive", USA);

                Question q4 = new Question("What is your attitude towards tradition?");
                q4.possibleAnswers[0] = new Answer("Reinvent it into something better", GE);
                q4.possibleAnswers[1] = new Answer("Protect it", BE);
                q4.possibleAnswers[2] = new Answer("Blend it with creativity and passion", FE);
                q4.possibleAnswers[3] = new Answer("Question everything and start fresh", RE);
                q4.possibleAnswers[4] = new Answer("Try to make old systems work together", AH);
                q4.possibleAnswers[5] = new Answer("Mix the best of old and new", USA);

                Question q5 = new Question("Which historical aesthetic speaks the most to you?");
                q5.possibleAnswers[0] = new Answer("Industrial progress and precision", GE);
                q5.possibleAnswers[1] = new Answer("Imperial grandeur", BE);
                q5.possibleAnswers[2] = new Answer("Artistry and fashion", FE);
                q5.possibleAnswers[3] = new Answer("Transformation", RE);
                q5.possibleAnswers[4] = new Answer("Multicultural cities and __ tradition", AH);
                q5.possibleAnswers[5] = new Answer("Jazz age modernity and optimism", USA);

                Question q6 = new Question("How do you deal with setbacks?");
                q6.possibleAnswers[0] = new Answer("Analyze and plan your comeback", GE);
                q6.possibleAnswers[1] = new Answer("Keep calm and carry on", BE);
                q6.possibleAnswers[2] = new Answer("Express frustration but proudly bounce back", FE);
                q6.possibleAnswers[3] = new Answer("Take it personally and rebuild emotionally", RE);
                q6.possibleAnswers[4] = new Answer("Patch things together, even if imperfect", AH);
                q6.possibleAnswers[5] = new Answer("Move on", USA);

                Question q7 = new Question("What motivates you the most?");
                q7.possibleAnswers[0] = new Answer("Glory and achievement", GE);
                q7.possibleAnswers[1] = new Answer("Honor and legacy", BE);
                q7.possibleAnswers[2] = new Answer("Pride and self-expression", FE);
                q7.possibleAnswers[3] = new Answer("Justice and equality", RE);
                q7.possibleAnswers[4] = new Answer("Harmony and balance (tradition stuff)", AH);
                q7.possibleAnswers[5] = new Answer("Freedom and opportunity", USA);

                Question q8 = new Question("___when collaborating with others");
                q8.possibleAnswers[0] = new Answer("Lead with a clear structure and purpose", GE);
                q8.possibleAnswers[1] = new Answer("Listen, compromise, and delegate with all members", BE);
                q8.possibleAnswers[2] = new Answer("Impress and inspire your teammates", FE);
                q8.possibleAnswers[3] = new Answer("Share openly but sometimes too much", RE);
                q8.possibleAnswers[4] = new Answer("Struggle to compromise with everybody", AH);
                q8.possibleAnswers[5] = new Answer("Keep things casual but efficient", USA);

                Question q9 = new Question("What is your role at a party?");
                q9.possibleAnswers[0] = new Answer("The planner who organizes everything", GE);
                q9.possibleAnswers[1] = new Answer("The calm observer with witty remarks", BE);
                q9.possibleAnswers[2] = new Answer("Center of attention", FE);
                q9.possibleAnswers[3] = new Answer("Still talking about deep things at 2 AM", RE);
                q9.possibleAnswers[4] = new Answer("The one managing awkward tensions", AH);
                q9.possibleAnswers[5] = new Answer("The one who shows up late but makes it fun", USA);

                Question q10 = new Question("Which motto do you most align with?");
                q10.possibleAnswers[0] = new Answer("Order, discipline, and results above all", GE);
                q10.possibleAnswers[1] = new Answer("Steady, patient, and quietly influential", BE);
                q10.possibleAnswers[2] = new Answer("Passion, style, and self-expression", FE);
                q10.possibleAnswers[3] = new Answer("Depth, emotion, and transformation", RE);
                q10.possibleAnswers[4] = new Answer("Balance, compromise, and connection", AH);
                q10.possibleAnswers[5] = new Answer("Freedom", USA);

                // For each question, ask, read input, store answer.
                gameIntro();
                Question[] qList = { q1, q2, q3, q4, q5, q6, q7, q8, q9};
                for (Question q : qList) {
                        Category c = q.ask(sc);
                        c.points++;
                }
                // Get most common category from the questions asked
                // Return Category
                Category[] cList = { GE, BE, FE, RE, AH, USA};
                // these need to be in the same order or the points will be incorrect!
                int index = getMostPopularCatIndex(cList);

// tie checker and tiebreaking mechanism

 int[] tieIndices = getAllMaxIndices(cList);
if (tieIndices.length > 1) {
System.out.println("We have a tie! Time for a tiebreaker question!");

Category tieCat = q10.ask(sc);
boolean tieCatWasInTie = false;
for (int ti : tieIndices) {if (cList[ti] == tieCat) {tieCat.points++;
        tieCatWasInTie = true;
         break;

}if (!tieCatWasInTie) {
tieCat.points++;
}
index = getMostPopularCatIndex(cList);
}
}

System.out.println("If you were a 20th entury Great Power, you'd be " + cList[index].label + ". ");
System.out.println(cList[index].description);
score = cList[index].points;
        }

        public static void gameIntro() {
                // requires 1 to keep going
                System.out.println("Which 1900 Great Power are you?");
                System.out.println("You get to choose numbers 1-6 for every question. Enter '1' to play!");
                int play = sc.nextInt();
                if (play != 1) {
                        System.out.println("Unidentifiable input. Please enter '1' to play");
                        gameIntro();
                }
        }
// returns the index that is the max
        // the tie breaker is the first Category that has the count is the "max" :/ 
        public static int getMostPopularCatIndex(Category[] counts) {
                int maxCount = 0;
                int maxIndex = 0;
                for (int i = 0; i < counts.length; i++) {
                        if (counts[i].points > maxCount) {
                                maxCount = counts[i].points;
                                maxIndex = i;
                        }
                }
                return maxIndex;
        }

        //tie decection by checking max indices
        public static int[] getAllMaxIndices(Category[] counts) {
                int max = 0;
                for (Category c : counts) {
                        if (c.points > max) {
                                max = c.points;
                        }
                }
                int numMax = 0;
                for (Category c : counts) {
                        if (c.points == max) {
                                numMax++;
                        }
                }
                int[] result = new int[numMax];
                int idx = 0;
                for (int i = 0; i < counts.length; i++) {
                        if (counts[i].points == max) {
                                result[idx] = i;
                                idx++;
                        }
                }
                return result;
        } 
@Override
public String getName() {
    return "BuzzFeed Quiz";
}

@Override
public String getScore() {
    return String.valueOf(score);
}

@Override
public boolean isHighScore(String score, String currentHighScore) {
    if (currentHighScore == null) {
        return true;
    }
    return Integer.parseInt(score) > Integer.parseInt(currentHighScore);
}

@Override
public void play() {
    score = 0;
    System.out.println("Starting Quiz...");
    main(new String[0]); 
    writeHighScore(new File("Highscore.csv"));
}
}
