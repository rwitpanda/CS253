CPP=g++
LEX=flex
YACC=bison -y

mycalc: lex.yy.c y.tab.c
	$(CPP) -std=c++11 -Wno-write-strings lex.yy.c y.tab.c -o mycalc

lex.yy.c: y.tab.c y.tab.h calc_scan.l
	$(LEX) calc_scan.l

y.tab.c y.tab.h: calc_grammar.y
	$(YACC) -dvt calc_grammar.y

clean:
	$(RM) lex.yy.c y.tab.c y.tab.h mycalc y.output

