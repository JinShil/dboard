module main;

import maplemini;

extern(C) void main()
{
    while(true)
    {
        //writeln!"Hello, World!";
        led.toggle();
        int i = 20000000;
        while(i--) {}
    }
}