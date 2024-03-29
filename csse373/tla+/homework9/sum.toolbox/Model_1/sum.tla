-------------------------------- MODULE sum --------------------------------
EXTENDS Integers

RECURSIVE Sum(_)
Sum(num) == IF num = 0 THEN 0 ELSE num + Sum(num-1)

(*
--fair algorithm sum {
    variable n \in Int, count = 0, sum = 0;
    {
        while (count < n) {
            sum := sum + count;
            count := count+1;
        };
    }
}
*)
\* BEGIN TRANSLATION
VARIABLES n, count, sum, pc

vars == << n, count, sum, pc >>

Init == (* Global variables *)
        /\ n \in Int
        /\ count = 0
        /\ sum = 0
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF count < n
               THEN /\ sum' = sum + count
                    /\ count' = count+1
                    /\ pc' = "Lbl_1"
               ELSE /\ pc' = "Done"
                    /\ UNCHANGED << count, sum >>
         /\ n' = n

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION

PartialCorrectness == (pc = "Done") => sum = Sum(n)

=============================================================================
\* Modification History
\* Last modified Tue May 16 15:58:14 EDT 2017 by jeem
\* Created Tue May 16 15:49:26 EDT 2017 by jeem
