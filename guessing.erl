-module(guessing).
-export([start_game/0]).

% called to start a new game
start_game() ->
    io:format("Welcome to the Higher-Lower game!~n"),
    io:format("Guess a number between 1 and 100.~n"),
    RandomNumber = rand:uniform(100), % gets a random number to find
    % play game with the new random number
    play_game(RandomNumber).

play_game(RandomNumber) ->
    % gets user's guess
    {ok, NewGuess} = io:read("Enter your guess: "),
    % compares the guess to the random number using pattern matching
    compare_guess(NewGuess, RandomNumber, 1).

% when guess is greater than number, we tell them to guess lower
compare_guess(Guess, RandomNumber, Guesses) when Guess > RandomNumber ->
    io:format("Guess Lower\n"),
    {ok, NewGuess} = io:read("Enter guess: "),
    compare_guess(NewGuess, RandomNumber, Guesses+1); % Guesses + 1 allows us to count the number of tries it takes (uses the recursion)

% when guess is less than number, we tell them to guess higher
compare_guess(Guess, RandomNumber, Guesses) when Guess < RandomNumber ->
    io:format("Guess Higher\n"),
    {ok, NewGuess} = io:read("Enter guess: "),
    compare_guess(NewGuess, RandomNumber, Guesses+1);

% when the above two comparisons are not true
% guess is equal to number, we tell them they got it
compare_guess(Guess, RandomNumber, Guesses) ->
    io:format("Congrats, you got it!"),
    io:format("It took you "),
    % Prints the number of guesses they had tried
    io:fwrite("~w\n\n",[Guesses]).