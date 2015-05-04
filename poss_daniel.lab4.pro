% Daniel Poss
% CSCI 305 Lab 4

% Mother of given person(C).
mother(M,C):- parent(M,C), female(M).

% Father of given person(C).
father(F,C):- parent(F,C), male(F).

% Wife of given person(H).
spouse(W,H):- married(W,H), female(H).

% Husband of given person(W).
spouse(H,W):- married(H,W), male(W).

% Children of given Father(F).
child(C,F):- parent(F,C), male(F).

% Children of given Mother(M).
child(C,M):- parent(M,C), female(M).

% Son/Sons of given person(C).
son(M,C):- male(M),parent(C,M).

% Daughter/Daughters of given person(C).
daughter(M,C):- female(M),parent(C,M).

% Sibling of given person(C).
sibling(M,C):- parent(Shared,M), parent(Shared,C), M \= C.

% Brother of given person(C).
brother(M,C):- male(M),parent(Shared,M),parent(Shared,C), M \= C.

% Sister of given person(C).
sister(M,C):- female(M),parent(Shared,M),parent(Shared,C), M \= C.

% Uncle of given person(C) (by blood).
uncle(M,C):- brother(M,Shared),parent(Shared,C).

% Uncle of given person(C) (by marriage).
uncleMarriage(M,C):- married(C,Shared),uncle(Shared,M).

% Aunt of given person(C) (by blood).
%aunt(M,C):- sister(M,Shared),parent(Shared,C).

% Aunt of given person(C) (by marriage).

% Grandparent of given person(C).
grandparent(M,C):- parent(M,Shared),parent(Shared,C).

% Grandfather of given person(C)
grandfather(M,C):- male(M),parent(M,Shared),parent(Shared,C).

% Grandmother of given person(C).
grandmother(M,C):- female(M),parent(M,Shared),parent(Shared,C).

% Grandchild of given person(C)
grandchild(M,C):- child(M, Shared),child(Shared,C).

% Ancestor of given person(C).
ancestor(M,C):- parent(M,C).
ancestor(M,C):- parent(M,Shared),ancestor(Shared,C).

% Descendant of given person(C).
descendant(M,C):- child(M,C).
descendant(M,C):- child(M,Shared),descendant(Shared,C).

% Is X older than Y, will return true if X is older than Y and false if X is not.
older(X,Y):- born(X,XAge),born(Y,YAge),XAge<YAge.

% Is X younger than Y, will return true if X is younger than Y and false if X is not.
younger(X,Y):- born(X,XAge),born(Y,YAge),XAge>YAge.

% Who ruled when given person was born
regentWhenBorn(X,Y):- born(Y,Age),reigned(X,Start,Finish), Start<Age, Age<Finish.