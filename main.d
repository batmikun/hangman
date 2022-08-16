import std.stdio, std.string;
import core.stdc.stdlib:exit;
import std.random: uniform;

// HangMan
void main() {
    int lives = 3;
    
    string[10] dictionaty = ["apple", "orange", "volleyball", "laptop", "universe", "chicken",
                            "theater", "window", "violin", "guitar"];
    
    
    int index = uniform(0, 10);
    string word = dictionaty[index];
    char[] display_word;

    for (int i = 0; i < word.length; i++) {
        display_word ~= '_';
    }

    main_menu();

    char guess;
    int letters_guessed = 0;
    while (true) {
        print_word(display_word);

        write("Your guess, please (", lives, " lives): ");
        readf(" %s", guess);

        int temp = letters_guessed;
        for(int i = 0; i < word.length; i++) {
            if (guess == word[i] && guess != display_word[i]) {
                display_word[i] = guess;
                letters_guessed += 1;
            }
        }

        if (temp == letters_guessed) {
            lives--;
        }

        if(letters_guessed == word.length) {
            writeln("YOU WIN");
            main();
        }

        if(lives < 0) {
            writeln("YOU LOSE");
            main();
        }
    }

    exit(0);

}

void print_word(char[] display_word) {
    for (int i = 0; i < display_word.length; i++) {
        write(display_word[i], " ");
    }
}

void main_menu() {
    writeln("Hello! Welcome to Hangman game!");
    writeln("1 - Play");
    writeln("2 - Exit");

    string line = readln.chomp;

    writeln();

    if (line == "play" || line == "Play" || line == "1") {
        writeln("Let's Play");
        return ;
    }

    if (line == "exit" || line == "Exit" || line == "2") {
        writeln("Thanks For Playing!");
        exit(0);
    }

    main_menu();
}