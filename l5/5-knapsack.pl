%%%% A 0/1 knapsack: optimisation, not just satisfaction

:- use_module(library(clpfd)).

%% item(Name, Weight, Value)

item(map,        9, 150).
item(compass,   13,  35).
item(water,    153, 200).
item(sandwich,  50, 160).
item(glucose,   15,  60).
item(banana,    27,  60).
item(suntan,   110,  70).
item(note,      22,  80).

%% Take is one 0/1 variable per item, in the order item/3 gives them.

knapsack(Capacity, Take, Weight, Value) :-
    findall(W-V, item(_, W, V), Pairs),
    pairs_keys_values(Pairs, Ws, Vs),
    same_length(Ws, Take),
    Take ins 0..1,
    scalar_product(Ws, Take, #=, Weight),
    scalar_product(Vs, Take, #=, Value),
    Weight #=< Capacity.

%% What was taken, by name

taken(Take, Names) :-
    findall(N, item(N, _, _), All),
    pairs_keys_values(Pairs, Take, All),
    findall(N, member(1-N, Pairs), Names).

%% Goals to try, from the deck:
%%
%%   ?- knapsack(200, T, W, V).
%%     — a residual constraint again: the model, not yet a solution
%%   ?- knapsack(200, T, W, V), labeling([max(V)], T).
%%   ?- knapsack(200, T, W, V), labeling([max(V)], T), taken(T, Names).
%%   ?- knapsack(100, T, W, V), labeling([max(V)], T), taken(T, Names).
