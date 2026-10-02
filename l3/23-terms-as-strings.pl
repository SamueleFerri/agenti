%%%% Terms as strings: chars, codes, concatenation

%% No program: every predicate here is built in.

%% Goals to try, from the deck:
%%
%% atoms to/from sequence of one-char atoms
%%   ?- atom_chars(hello,L).        % L/[h,e,l,l,o]
%%   ?- atom_chars(X,[h,e,l,l,o]).  % X/hello
%%
%% atoms to/from sequence of ASCII codes
%%   ?- atom_codes(hello,L).        % L/[104,101,108,108,111]
%%   ?- atom_codes(X,[95,48,32,49]).% X='_0 1'
%%   ?- atom('_0 1').               % yes
%%
%% concatenation
%%   ?- atom_concat(aa,bb,X).       % X/aabb
%%
%% numbers vs chars/codes
%%   ?- number_chars(100,X).        % X/['1','0','0']
%%   ?- number_codes(100,X).        % X/[49,48,48]
