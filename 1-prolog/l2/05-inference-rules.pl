%%%% Inference with resolution: a rule names a composition of goals

%% Still propositional, with the relation written into the predicate name.
%% The Shortcomings slide that follows is about exactly this limitation.

father_abraham_isaac.
father_terach_abraham.
grandfather_terach_isaac :-
    father_abraham_isaac, father_terach_abraham.

%% The deck asks no goal of this program.  The one it is built for:
%%
%%   ?- grandfather_terach_isaac.
