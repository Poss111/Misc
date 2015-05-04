% Daniel Poss
% CSCI 305 Lab 4

% Mother of given person
mother(M,C):- parent(M,C), female(M).

% Father of given person
father(F,C):- parent(F,C), male(F).

% Wife of given person
spouse(W,H):- married(W,H), female(H).

% Husband of given person
spouse(H,W):- married(H,W), male(W).

% Children of Father
child(C,F):- parent(F,C), male(F).

% Children of Mother
child(C,M):- parent(M,C), female(M).

% Son/Sons of given person
son(M,C):- male(M),parent(C,M).

% Daughter/Daughters of given person
daughter(M,C):- female(M),parent(C,M).

% Sibling of given person
sibling(M,C):- parent(Shared,M), parent(Shared,C), M \= C.

% Brother of given person
brother(M,C):- male(M),parent(Shared,M),parent(Shared,C), M \= C.

% Sister of given person
sister(M,C):- female(M),parent(Shared,M),parent(Shared,C), M \= C.

% Uncle of given person (by blood)
uncle(M,C):- brother(M,Shared),parent(Shared,C).

% Uncle of given person (by marriage)
uncleMarriage(M,C):- married(C,Shared),uncle(Shared,M).

% Aunt of given person (by blood)
%aunt(M,C):- sister(M,Shared),parent(Shared,C).

% Aunt of given person (by marriage)

% Grandparent of given person
grandparent(M,C):- parent(M,Shared),parent(Shared,C).

% Grandfather of given person
grandfather(M,C):- male(M),parent(M,Shared),parent(Shared,C).

% Grandmother of given person
grandmother(M,C):- female(M),parent(M,Shared),parent(Shared,C).

% Grandchild of given person
grandchild(M,C):- child(M, Shared),child(Shared,C).

% Ancestor of given person
ancestor(M,C):- parent(M,C).
ancestor(M,C):- parent(M,Shared),ancestor(Shared,C).

% Descendant of given person
descendant(M,C):- child(M,C).
descendant(M,C):- child(M,Shared),descendant(Shared,C).

% Older
older(X,Y):- born(X,XAge),born(Y,YAge),XAge<YAge.

% Younger
younger(X,Y):- born(X,XAge),born(Y,YAge),XAge>YAge.

% Who ruled when given person was born