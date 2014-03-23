/*
The MIT License (MIT)

Copyright (c) 2014 MakeDeck

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

// Create a function that will run when the pin callback is triggered
function event_callback() {
    // Read the pin to make sure the trigger is high - simple debounce
    if (pin9.read()==1) {
        // Send a message to the agent to run "event" and the state of pin9.
        agent.send("event", pin9.read());
    }
};

// Assign global pin9 to hardware pin 9.
pin9 <- hardware.pin9;
// Configure pin9 as DIGITAL_IN, and register a callback function
pin9.configure(DIGITAL_IN, event_callback);
