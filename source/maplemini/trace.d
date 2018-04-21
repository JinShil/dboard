module maplemini.trace;

import arm.semihosting;
import arm.memory;

void write(string s)()
{
    arm.semihosting.write((s ~ '\0').ptr);
}

void writeln(string s)()
{
    write!(s ~ '\n')();
}