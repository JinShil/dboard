module maplemini.trace;

nothrow:
@safe:

import arm.semihosting;
import arm.memory;

void write(string s)() @trusted
{
    arm.semihosting.write((s ~ '\0').ptr);
}

void writeln(string s)()
{
    write!(s ~ '\n')();
}