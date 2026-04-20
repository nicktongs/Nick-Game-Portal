/*
A question class with Answers.
*/ 
import java.util.Scanner;
import java.util.Random; //for shuffling

public class Question {
    // Fields
    String label;
    Answer[] possibleAnswers = new Answer[6];

    Question(String label) {
        this.label = label;
    }

    //answer shuffling
    void shuffleAnswers() {
Random rand = new Random();
for (int i = possibleAnswers.length-1; i>0; i--){
int j = rand.nextInt(i+1);
Answer temp = possibleAnswers[i];
possibleAnswers[i] = possibleAnswers[j];
possibleAnswers[j] = temp;

}

    }
    // ask a question, and return the category that corresponds to the answer
    Category ask(Scanner sc) {

        shuffleAnswers();

        System.out.println(this.label);
        // prints out all the answer choices
        for (int i = 0; i < this.possibleAnswers.length; i++) {
            String choice = Integer.toString(i + 1);
            System.out.println("[" + choice + "]:" +
                    this.possibleAnswers[i].label);
        }

//checker
int ans = -1;
while(true) {
if (!sc.hasNextInt()) {
System.out.println("Please enter a number between 1 and "+this.possibleAnswers.length+". ");
sc.next();
continue;
}
ans=sc.nextInt();
if (ans<1 || ans > this.possibleAnswers.length) {
    System.out.println("Number out of range, enter 1-" +this.possibleAnswers.length+".+");
    continue;
}
break;
}

if (sc.hasNextLine()) {
            sc.nextLine();
        }

        return possibleAnswers[ans - 1].cat;
    }

}