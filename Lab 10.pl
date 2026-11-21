:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the botton'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice.'), nl,
    read(Choice),
    process_choice(Choice).

process_choice(1) :-
    nl,
    display_letters,
    menu.

process_choice(2) :-
    write('Enter the letter to add: '),
    read(L),
    assert(letter(L)),
    menu.

process_choice(3) :-
    write('Enter the letter to add at the top: '),
    read(L),
    asserta(letter(L)),
    menu.

process_choice(4) :-
    write('Enter the letter to add at the bottom: '),
    read(L),
    assertz(letter(L)),
    menu.

process_choice(5) :-
    write('Enter the letter to delete: '),
    read(L),
    (retract(letter(L)) -> write('Letter deleted.'), nl ; write('Letter not found.'), nl),
    menu.

process_choice(6) :-
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    menu.

process_choice(7) :-
    write('Goodbye!'), nl.

process_choice(_) :-
    write('Invalid choice, try again.'), nl,
    menu.

display_letters :-
    letter(X),
    writeln(X),
    fail.
display_letters.
