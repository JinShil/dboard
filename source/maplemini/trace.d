module maplemini.trace;

nothrow:
@safe:

import arm.semihosting;
import arm.memory;

void write(string s)()
{
    arm.semihosting.write(&((s ~ '\0')[0]));
}

void writeln(string s)()
{
    write!(s ~ '\n')();
}

/************************************************************************************
* Print unsigned integer
*/
void write(uint value)
{
    enum base = 10;

    //Will use at most 10 digits, for a 32-bit base-10 number
    char[11] buffer;

    //Print digit to the end of the buffer starting with the
    //least significant bit first.
    auto i = buffer.length;
    buffer[--i] = '\0';
    do
    {
        uint index = value % base;
        buffer[--i] = cast(char)(index <= 9 ? '0' + index : 'A' + (index - 10));
        value /= base;
    } while(value);

    // &buffer[i] == pointer to most significant digit
    // buffer.length - i == length of string
    arm.semihosting.write(&buffer[i]);
}

/************************************************************************************
* Print signed integer
*/
void write(int value)
{
    // if negative, write minus sign and get absolute value
    if (value < 0)
    {
        write("-");
        write(cast(uint)(value * -1));
    }
    // if greater than or equal to 0, just treat it as an unsigned int
    else
    {
        write(cast(uint)value);
    }
}

void write(ushort value)
{
    write(cast(uint)value);
}

/************************************************************************************
* Print string of charactes
*/
void write(const scope string text)
{
    if (text.length > 0)
    {
        arm.semihosting.write(&text[0]);
    }
}

/************************************************************************************
* Print several values at once
*/
void write(A...)(const A a)
{
    foreach(t; a)
    {
        write(t);
    }
}

/************************************************************************************
* Print several values at once with a new line
*/
void writeln(A...)(const A a)
{
    foreach(t; a)
    {
        write(t);
    }
    write("\r\n");
}