module board.trace;

import arm.semihosting;

void write(in string s)
{
    immutable int STDOUT = 1;
    arm.semihosting.write(STDOUT, s);
}

void writeln(in string s)
{
    write(s);
    write("\n");
}