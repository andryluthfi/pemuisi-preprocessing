/*
 * Poetry Generator
 * Author : Fam Rashel P Scala
 */

:- ['res-templatesRand'].
:- ['res-keywordsRand'].
:- ['res-poeticwordsRand'].
:- ['res-poemStructRand'].

/* POSTAG yang akan di replace */
postagToReplace([pr, nn, jj, vb, rb]).

/* Daftar pelafalan vokal */
vowel([a, ax, aw, ay, e, ey, i, o, oy, u]).

/* Predikat untuk menulis semua kombinasi puisi */
main :-
    tell('res-poetryOutput.txt'),
    (
        statistics(walltime, [Start,_]),
        %writeln(Start),
        poem(X, Y, Z),
		write('Poem: '),
        writeln(X),
		write('Templates: '),
		writeln(Y),
		write('Slotfillers: '),
		writeln(Z),
		nl,
        fail
    ;
        statistics(walltime, [End,_]),
        writeln(End),
	told
    ).


writePoem(Time) :-
	open('test.txt', write, Stream),
	statistics(walltime, [Start,_]),
	%findall(X, poem(X), L),
	poem(X, Y, Z),
	statistics(walltime, [End,_]),
	Time is End - Start,
	write(Stream, X),
	nl(Stream),
	write(Stream, Time),
	close(Stream).


/* Predikat poem untuk melakukan selection sesuai constraint yang diberikan */
poem1([A, B], [TA, TB], [FA,FB]):-
	sentence(A, 12, KA, SA, TA, FA),
	length(A, 6),
	lastElem(A, LastA),

	sentence(B, 10, KB, SB, TB, FB),
	length(B, 4),
	lastElem(B, LastB),

	rhyme(LastA, LastB),
	KTotal is KA + KB,
	STotal is SA + SB.
	%KTotal * 100 / STotal >= 40.

/* predikat sentence untuk melakukan kombinasi template dengan slot filler */
sentence(Sentence, SylCount, KeyCount, SlotCount, Template, Slotfiller):-
	template(Template, STCount, SlotCount),
	postagToReplace(Postag),
	replacePosTag(Postag, Template, STCount, Sentence, SylCount, KeyCount, Slotfiller).

replacePosTag(_, [], N, [], N, 0, []).
replacePosTag(P, [Ori|T], N, [Replace|T2], L, K, [Replace|T3]):-
	member(Ori, P),
	word(Replace, Ori, _, W, filler),
	replacePosTag(P, T, N, T2, L1, K, T3),
	L is L1 + W.
replacePosTag(P, [Ori|T], N, [Replace|T2], L, K, [Replace|T3]):-
	member(Ori, P),
	word(Replace, Ori, _, W, keyword),
	replacePosTag(P, T, N, T2, L1, K1, T3),
	L is L1 + W,
	K is K1 + 1.
replacePosTag(P, [H|T], N, [H|T2], L, K, S):-
	\+member(H, P), replacePosTag(P, T, N, T2, L, K, S).


/* Predikat untuk mencari elemen terakhir dari suatu list */
lastElem([Elem], Elem).
lastElem([_|Tail], Elem):- lastElem(Tail, Elem).


/* Predikat rima untuk menyatakan X dan Y memiliki rima akhir yang sama */
rhyme(X,Y):- word(X, _, LafalX, _, _),
            word(Y, _, LafalY, _, _),
	    reverse(LafalX, LafalReverseX),
	    reverse(LafalY, LafalReverseY),
	    vowel(V),
	    sameLast(LafalReverseX, LafalReverseY, V).

sameLast([], [], _).
sameLast([H|_], [H|_], V):- member(H,V).
sameLast([H|T1], [H|T2], V):- \+member(H, V),
			      sameLast(T1, T2, V).


















