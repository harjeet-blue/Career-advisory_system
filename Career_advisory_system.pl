/* HARJEET SINGH YADAV */
/* IIIT - DELHI */
/* ROLL NO :- 2020561  */
/* BRANCH  :- CSAI     */
/* IIS 2nd SEM Assigment " Career advisory system " */


/* TO RUN THIS PROGRAM CONSULT & WRITE -> lets_go.  IN THE PROLOG TERMINAL  */


/* This is the main driver fucntion like main fucntion in c++  and java */

lets_go:-
    introduction,
    remove_previous_data,
    name_and_branch,
    askquestion,
    convert_to_list,
    compute,
    display_details,
    retract(value(Max)),
    display_result(Max),nl.




/* introduction function greets the user */

introduction:- nl,nl,write('Hello Folk , This is a career advisory system'),nl,nl,
              write('It will ask a set of 15 basic questions, answer them with as much authencity as you can '),nl,nl,
              write('NOTE :- 1). DO NOT FORGET TO PUT A FULL STOP AFTER EVERY INPUT'),nl,
              write('        2). USE double invertd comma IF YOU WANT TO ENTER FULL NAME e.g " name surname ".'),nl,nl.




/* remove previous data function removes all the previous records and data
 * form memory so that they do not affect the current computations */

remove_previous_data:-

    retractall(name(_)),
    retractall(cgpa(_)),
    retractall(software_developer(_)),
    retractall(it_consultant(_)),
    retractall(data_scientist(_)),
    retractall(research(_)),
    retractall(machine_learning(_)),
    retractall(software_score(_)),
    retractall(data_score(_)),
    retractall(it_score(_)),
    retractall(ml_score(_)),
    retractall(re_score(_)),
    retractall(value(_)),
    retractall(final_list(_)).



/* this fuction will take brach and name of user as input */

name_and_branch:- write('Enter your name : '),nl,read(X),assert(name(X)),nl,nl,
                  write('Enter your branch: ( enter the corresponding no. )'),nl,nl,
                  print_format(["CSAI","CSE","CSAM","CSSS","CSD","ECE","CSB"],1),read(Y),branch(Y),!.
                                                                            % cut operator to stop brach form becoming a choice point



/*this fucntion ask the branch & gpa & clubs & porjects in a nice formatted way */

print_format([],_).
print_format([H|T],C):-format("~d. ~s~n",[C,H]),C1 is C+1,print_format(T,C1).




/* to assert the branch in memory and handle the wrong input */

branch(1):-
    assert(stream("CSAI")).

branch(2):-
    assert(stream("CSE")).

branch(3):-
    assert(stream("CSAM")).

branch(4):-
    assert(stream("CSSS")).

branch(5):-
    assert(stream("CSD")).

branch(6):-
    assert(stream("ECE")).

branch(7):-
    assert(stream("CSB")).

branch(Y):-
    nl,write(' " '),write(Y),write(' " '),
    format(' is WRONG INPUT FOLK ~n Please choose a correct number do not trouble me delebrately :) '),
    read(X),branch(X).


/* to read the gpa and to handle the wrong input */

read_gpa:-
    print_format(["Ten","Nine","Eight","Seven","Six","less than six"],1),nl,
    read(A),gpa(A),!. % cut operator to stop gpa from becoming a choice point


gpa(1):-
    assert(cgpa(10)).
gpa(2):-
    assert(cgpa(9)).
gpa(3):-
    assert(cgpa(8)).
gpa(4):-
    assert(cgpa(7)).
gpa(5):-
    assert(cgpa(6)).
gpa(6):-
    assert(cgpa(5)).
gpa(A):-
    nl,write(' " '),write(A),write(' " '),
    format(' is WRONG INPUT FOLK ~n Please choose the correspoding no '),
    read(X),gpa(X).



/*this function display infromation about different clubs and projects and read the input */

clubs_and_projects:-
   format('~nEnter the correspoing no of the clubs you have been part of,~nyou can choose multiple and enter " ok " if you are done.~n~n'),
    print_format(["EVARISTE","ENACTUS","FOOBAR","ACM","BYLD","FINNEXIA","BIOBYTES"],1),read(X),clubs(X),nl,nl,
    format('have you done any BTECH projects in any of these fields, enter the corresoping no ,~nyou can choose muliple options enter " ok " if you are done~n'),nl,
  print_format(["Machine learning", "data scinece","Software development","business managment","part of any research project"],1),
    read(Y),projects(Y),nl.



/*this is helper fucntion to print the clubs name and handle the invalid input */

clubs(X):-X==ok.
clubs(X):-not(number(X)),nl,write(X),format(' is WRONG INPUT, enter ok to exit or enter a valid no '),read(Y),clubs(Y).
clubs(X):-
    X=:=1 ->assert(data_scientist(5)),read(Y),clubs(Y);
    X=:=2 ->assert(it_consultant(5)),read(Y),clubs(Y);
    X=:=3 ->assert(machine_learning(5)),assert(software_developer(5)),read(Y),clubs(Y);
    X=:=4 ->assert(software_developer(5)),read(Y),clubs(Y);
    X=:=5 ->assert(machine_learning(5)),read(Y),clubs(Y);
    X=:=6 ->assert(it_consultant(5)),read(Y),clubs(Y);
    X=:=7 ->assert(data_scientist(5)),read(Y),clubs(Y);
    nl,write(X),format(' is wrong input FOLK enter a valid option '),read(Y),clubs(Y).



/*this is helper function to display prjects and handle the invalid input */

projects(Y):-Y==ok.
projects(Y):-not(number(Y)),nl,write(Y),format(' is WRONG INPUT , enter ok to exit or enter a valid no '),read(A),projects(A).
projects(Y):-
    Y=:=1 ->assert(machine_learning(5)),read(A),projects(A);
    Y=:=2 ->assert(data_scientist(5)),read(A),projects(A);
    Y=:=3 ->assert(software_developer(5)),read(A),projects(A);
    Y=:=4 ->assert(it_consultant(5)),read(A),projects(A);
    Y=:=5 ->assert(research(10)),read(A),projects(A);
    nl,write(Y),format(' is wrong input FOLK enter a valid option '),read(A),projects(A).



/* this function ask all the relevent questions */

askquestion:-
    nl,write('what is your gpa :'),nl,nl,
    read_gpa,
    clubs_and_projects,
    format('~n~n NOW, ANSWER ALL QUESTIONS ON A SCALE OF 0 TO 10 : ~n'),
    software_developer,
    data_scientist,
    it_consultant,
    machine_learning,
    research.



data_scientist:-

    format('~n How much do you like playing with graphs, data '),
    read(A),
    check_data_scale(A),

    format('~n how good are you in probability '),
    read(B),
    check_data_scale(B),

    format('~n how much do you like data analysis and interpretation '),
    read(D),
    check_data_scale(D).



software_developer:-

    format('~n how much are you interested in coding and programming '),
    read(A),
    check_sd_scale(A),

    format('~n how much are you interested in softwares '),
    read(B),
    check_sd_scale(B),

    format('~n how much do you like solving logical questions '),
    read(D),
    check_sd_scale(D).



it_consultant:-

    format('~n Your ablity to troubleshoot hardware and software '),
    read(A),
    check_it_scale(A),

    format('~n how much do you like working in a team '),
    read(B),
    check_it_scale(B),

    format('~n Your leadership qualities '),
    read(D),
    check_it_scale(D).


machine_learning:-

    format('~n Are you good at data modelling and data visualinsation '),
    read(A),
    check_ml_scale(A),

    format('~n How much are you interested machine learning and deep learning '),
    read(B),
    check_ml_scale(B),

    format('~n how good are you with statistics '),
    read(C),
    check_ml_scale(C).


research:-

    format('~n do you like focusing on details of problem '),
    read(A),
    check_re_scale(A),

    format('~n Are you good in structured thinking '),
    read(B),
    check_re_scale(B),

    format('~n have you published any research paper,~n enter quantity if yes, otherwise enter 0'),
    read(C),
    assert(research(C*10)).




/* to assert the score and handle the wrong input ( if user input out of 1 to 10 range )*/

check_sd_scale(X):-
    number(X),
    X>=0,X=<10,
    assert(software_developer(X)).
check_sd_scale(X):-
    nl,write(' " '), write(X),write(' " '),
    format(' is WRONG INPUT FOLK ~n please enter a no between 0 to 10 '),
    read(Y),check_sd_scale(Y),!. % cut opetator to stop backtracking and prevent assertion multiple times


check_data_scale(X):-
     number(X),
     X>=0,X=<10,
     assert(data_scientist(X)).
check_data_scale(X):-
    nl,write(' " '),write(X),write(' " '),
    format(' is WRONG INPUT FOLK ~n please enter a no between 0 to 10 '),
    read(Y),check_data_scale(Y),!. % cut opetator to stop backtracking and prevent assertion multiple times


check_it_scale(X):-
     number(X),
     X>=0,X=<10,
     assert(it_consultant(X)).
check_it_scale(X):-
    nl,write(' " '),write(X),write(' " '),
    format(' is WRONG INPUT FOLK ~n please enter a no between 0 to 10 '),
    read(Y),check_it_scale(Y),!. % cut opetator to stop backtracking and prevent assertion multiple times


check_ml_scale(X):-
    number(X),
    X>=0,X=<10,
    assert(machine_learning(X)).
check_ml_scale(X):-
    nl,write(' " '),write(X),write(' " '),
    format(' is WRONG INPUT FOLK ~n please enter a no between 0 to 10 '),
    read(Y),check_ml_scale(Y),!. % cut opetator to stop backtracking and prevent assertion multiple times


check_re_scale(X):-
     number(X),
     X>=0,X=<10,
     assert(research(X)).
check_re_scale(X):-
    nl,write(' " '),write(X),write(' " '),
    format(' is WRONG INPUT FOLK ~n please enter a no between 0 to 10 '),
    read(Y),check_re_scale(Y),!. % cut opetator to stop backtracking and prevent assertion multiple times



/* to convert the different career score into corresponding list */

convert_to_list:-

    convert_sd_tolist(SD),
    sum_of_list(SD,A),
    assert(software_score(A)),

    convert_ds_tolist(DS),
    sum_of_list(DS,B),
    assert(data_score(B)),

    convert_it_tolist(IT),
    sum_of_list(IT,C),
    assert(it_score(C)),

    convert_ml_tolist(ML),
    sum_of_list(ML,D),
    assert(ml_score(D)),

    convert_research_tolist(RS),
    sum_of_list(RS,E),
    assert(re_score(E)),

    assert(final_list([A,B,C,D,E])).



/* helper function in converting to list */

convert_sd_tolist([E|T]):- retract(software_developer(E)),convert_sd_tolist(T).
convert_sd_tolist([]).

convert_ds_tolist([H|T]):- retract(data_scientist(H)),convert_ds_tolist(T).
convert_ds_tolist([]).

convert_it_tolist([H|T]):- retract(it_consultant(H)),convert_it_tolist(T).
convert_it_tolist([]).

convert_ml_tolist([H|T]):- retract(machine_learning(H)),convert_ml_tolist(T).
convert_ml_tolist([]).

convert_research_tolist([H|T]):- retract(research(H)),convert_research_tolist(T).
convert_research_tolist([]).



/* to find the sum of the scores i.e list */

sum_of_list([],0).
sum_of_list([H|T],S):-sum_of_list(T,S1),S is S1+H.


/* to find the max in a list i.e max among the scores */

max_of([E],E).
max_of([H|T],M):-max_of(T,N),max_of_two(M,H,N).

max_of_two(M,H,N):- H>N,M=H.
max_of_two(M,H,N):- N>=H,M=N.


/* to check gpa , using not operator */
check_gpa(X):-X>7.
check_gpa(X):-not(X>7),format('~n Message :- YOUR GPA IS NOT UP TO THE MARK,~n'),
              format('~t"YOU NEED TO WORK HARD"~t~50|'),nl.



/* this fucntion calls the max function and assert the max value */

compute:-
    retract(final_list(List)),
    max_of(List,Max),
    assert(value(Max)).



/* to display all the basic details of user */

display_details:-
    nl,nl,
    retract(name(X)),
    retract(stream(Y)),
    retract(cgpa(Z)),
    format('~n~n ================= RESULT ===================== ~n~n'),
    format(' NAME :-  ~s~n BRANCH :-  ~s~n GPA :-  ~d~n ',[X,Y,Z]),
    check_gpa(Z),
    format('~n ==============================================~n~n'),
    format('~n ACCORDING TO OUR DATABASE AND YOUR RESPONSES  ~n~n ').



/* to check the which carrer the max score max score mathches with */

display_result(Max):-
    check_software(Max);
    check_data(Max);
    check_it(Max);
    check_ml(Max);
    check_re(Max).


/* to display the result */

check_software(Max):-
     retract(software_score(A)),
     A=:=Max -> write('you are best suited for SOFTWARE ENGINEER '),
     nl,nl,write(' THANK YOU AND ALL THE BEST :)'),nl.

check_data(Max):-
     retract(data_score(B)),
     B=:=Max -> write('you are best suited for DATA SCIENTIST '),
     nl,nl,write(' THANK YOU AND ALL THE BEST :)'),nl.

check_it(Max):-
     retract(it_score(C)),
     C=:=Max -> write('you are best suited for IT CONSULTANT '),
     nl,nl,write(' THANK YOU AND ALL THE BEST :)'),nl.

check_ml(Max):-
     retract(ml_score(D)),
     D=:=Max -> write('you are best suited for MACHINE LEARNING AND AI FEILD '),
     nl,nl,write(' THANK YOU AND ALL THE BEST :)'),nl.

check_re(Max):-
     retract(re_score(E)),
     E=:=Max -> write('you should go for RESEARCH AND HIGHER STUDIES '),
     nl,nl,write(' THANK YOU AND ALL THE BEST :)'),nl.













