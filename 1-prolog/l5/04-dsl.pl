%%%% Prolog as host for DSL

% use as DSL
:- op(100,fx,person).
:- op(100,fx,name).
:- op(100,fx,age).
:- op(100,fx,nationality).
:- op(100,fx,married).

person {
    name 'Rossi Marco',
    age 30,
    nationality italy,
    married false
}.

%% Goal to try, from the deck:
%%
%%   ?- person { name NM, age A, nationality N, married M }.
%%     — NM / 'Rossi Marco'   A / 30   N / italy   M / false
