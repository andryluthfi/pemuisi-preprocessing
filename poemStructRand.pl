
poem([A, B, C, D, E, F], [TA, TB, TC, TD, TE, TF], [FA, FB, FC, FD, FE, FF]):-
	sentence(A, _, KA, SA, TA, FA),
	lastElem(A, LastA),
	length(A, 1),

	sentence(B, _, KB, SB, TB, FB),
	lastElem(B, LastB),
	length(B, 2),
	rhyme(LastA, LastB),

	sentence(C, _, KC, SC, TC, FC),
	lastElem(C, LastC),
	length(C, 3),

	sentence(D, _, KD, SD, TD, FD),
	lastElem(D, LastD),
	length(D, 4),
	rhyme(LastC, LastD),

	sentence(E, _, KE, SE, TE, FE),
	lastElem(E, LastE),
	length(E, 5),

	sentence(F, _, KF, SF, TF, FF),
	lastElem(F, LastF),
	length(F, 6),
	rhyme(LastE, LastF).
poem([A, B, C, D], [TA, TB, TC, TD], [FA, FB, FC, FD]):-
	sentence(A, 10, KA, SA, TA, FA),
	length(A, 4),
	lastElem(A, LastA),

	sentence(C, 8, KC, SC, TC, FC),
	length(C, 4),
	lastElem(C, LastC),
	rhyme(LastA, LastC),

	sentence(B, 10, KB, SB, TB, FB),
	length(B, 6),
	lastElem(B, LastB),

	sentence(D, 12, KD, SD, TD, FD),
	lastElem(D, LastD),
	length(D, 6),
	rhyme(LastB, LastD).

poem([A, B, C, D, E, F], [TA, TB, TC, TD, TE, TF], [FA, FB, FC, FD, FE, FF]):-
	sentence(A, _, KA, SA, TA, FA),
	lastElem(A, LastA),
	length(A, 3),

	sentence(B, _, KB, SB, TB, FB),
	lastElem(B, LastB),
	length(B, 5),
	rhyme(LastA, LastB),

	sentence(C, _, KC, SC, TC, FC),
	lastElem(C, LastC),
	length(C, 6),
	rhyme(LastB, LastC),

	sentence(D, _, KD, SD, TD, FD),
	lastElem(D, LastD),
	length(D, 3),

	sentence(E, _, KE, SE, TE, FE),
	lastElem(E, LastE),
	length(E, 5),
	rhyme(LastD, LastE),

	sentence(F, _, KF, SF, TF, FF),
	lastElem(F, LastF),
	length(F, 6),
	rhyme(LastE, LastF).

poem([A, B, C, D, E, F], [TA, TB, TC, TD, TE, TF], [FA, FB, FC, FD, FE, FF]):-
	sentence(A, 2, KA, SA, TA, FA),
	lastElem(A, LastA),
	length(A, 1),

	sentence(B, 4, KB, SB, TB, FB),
	lastElem(B, LastB),
	length(B, 2),
	rhyme(LastA, LastB),

	sentence(C, 6, KC, SC, TC, FC),
	lastElem(C, LastC),
	length(C, 2),

	sentence(D, 8, KD, SD, TD, FD),
	lastElem(D, LastD),
	length(D, 3),
	rhyme(LastC, LastD),

	sentence(E, 10, KE, SE, TE, FE),
	lastElem(E, LastE),
	length(E, 4),

	sentence(F, 12, KF, SF, TF, FF),
	lastElem(F, LastF),
	length(F, 4),
	rhyme(LastE, LastF).

poem([A, B, C, D], [TA, TB, TC, TD], [FA, FB, FC, FD]):-
	sentence(A, 14, KA, SA, TA, FA),
	lastElem(A, LastA),
	length(A, 5),

	sentence(B, 8, KB, SB, TB, FB),
	lastElem(B, LastB),
	length(B, 4),
	rhyme(LastA, LastB),

	sentence(C, 12, KC, SC, TC, FC),
	lastElem(C, LastC),
	length(C, 5),
	rhyme(LastB, LastC),

	sentence(D, 10, KD, SD, TD, FD),
	lastElem(D, LastD),
	length(D, 4),
	rhyme(LastC, LastD).

poem([A, B, C, D], [TA, TB, TC, TD], [FA, FB, FC, FD]):-
	sentence(A, 4, KA, SA, TA, FA),
	lastElem(A, LastA),
	length(A, 2),

	sentence(B, 12, KB, SB, TB, FB),
	lastElem(B, LastB),
	length(B, 4),
	rhyme(LastA, LastB),

	sentence(C, 12, KC, SC, TC, FC),
	lastElem(C, LastC),
	length(C, 5),

	sentence(D, 5, KD, SD, TD, FD),
	lastElem(D, LastD),
	length(D, 2),
	rhyme(LastC, LastD).

poem([A, B, C, D], [TA, TB, TC, TD], [FA, FB, FC, FD]):-
	sentence(A, 12, KA, SA, TA, FA),
	lastElem(A, LastA),
	length(A, 4),

	sentence(C, 10, KC, SC, TC, FC),
	lastElem(C, LastC),
	length(C, 4),
	rhyme(LastA, LastC),

	sentence(B, 16, KB, SB, TB, FB),
	lastElem(B, LastB),
	length(B, 6),

	sentence(D, 16, KD, SD, TD, FD),
	lastElem(D, LastD),
	length(D, 6),
	rhyme(LastB, LastD).
