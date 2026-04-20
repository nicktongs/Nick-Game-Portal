/*
 *
 * This is an answer with a Category it corresponds to
 */

public class Answer {
    String label;
    Category cat;
    
    // Constructor
    Answer(String label, Category c) {
        this.label = label; 
        this.cat = c;
    }

    //copy Constructur for answer shuffle
    Answer(Answer other) {
this.label = other.label;
this.cat = other.cat;

    }
}
