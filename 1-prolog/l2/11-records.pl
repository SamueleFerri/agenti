%%%% Working with records: facts relating structured terms

%% manager, clerk and chief are predicates; person is a functor.

manager(person(john,smith,1283)).
clerk(person(jim,white,3475)).
clerk(person(george,red,8765)).
chief(person(john,smith,1283), person(george,red,8765)).

%% Goal to try, from the deck:
%%
%%   ?- chief(X,person(Y,Z,8765)).
%%     — X/person(john,smith,1283) Y/george Z/red, and Prolog answers with
%%       the minimal substitution and the instantiated goal
