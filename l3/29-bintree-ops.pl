%%%% Binary trees: other operations, leaves and leftlist

% leaves(+Tree,-ListLeaves), returns the list of leaves
leaves(nil, []).                     % handling empty tree
leaves(tree(nil, E, nil), [E]) :- !. % handling a leaf
leaves(tree(L, _, R), O) :-          % general case
  leaves(L, OL),        % OL are leaves on left
  leaves(R, OR),        % OR are leaves on right
  append(OL, OR, O).    % O appends the two

% leftlist(+Tree,-List)
% returns the left-most branch as a list
leftlist(nil, []).
leftlist(tree(nil, E, _), [E]) :- !.
leftlist(tree(T, E, _ ), [E | L]) :- leftlist(T, L).

%% Goals to try, from the deck:
%%
%%   ?- leaves( tree(tree(nil, 10, nil), 20,
%%                   tree(tree(nil, 30, nil), 40, nil)), L).
%%     — L/[10,30]
%%   ?- leftlist( tree(tree(nil, 10, nil), 20,
%%                     tree(tree(nil, 30, nil), 40, nil)), L).
%%     — L/[20,10]
