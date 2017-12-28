/////////////////////////////////////////////////////////////////////////////////////
// ブードゥー教の子 ///////////////////////////////////////////////////////////////////
// PSY.DR34M5:    ///////////////////////////////////////////////////////////////////
// SCL20170114    ///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 04.- egg            //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
TempoClock.default.tempo = 5;

m.allNotesOff(0);
m.allNotesOff(1);
n.allNotesOff(1);


m.program(0, 32);

m.control(9,0,1);
m.program(9, 5);



~bass = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\degree, Pwhite(5, 5+12, inf),\octave, 1,\dur, Pwhite(1, 3, inf),\legato, 1,\amp, 2).collect({ |event|~lastBassvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.1));

~bass.stop;

/////////////////////////////////////////////////////////////////////////////////////
n.control(1,0,1);
n.program(1, 47);

~bass2 = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,\degree, Pwhite(5, 5+12, inf),\octave, 2,\dur, Pwhite(1, 3, inf),\legato, 1,\amp, 0.2).collect({ |event|~lastBassvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.1));

~bass3 = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,\degree, Pwhite(5, 5+12, inf),\octave, 5,\dur, Pwhite(1, 3, inf),\legato, 1,\amp, 0.2).collect({ |event|~lastBassvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.1));

~bass2.stop;
~bass3.stop;



/////////////////////////////////////////////////////////////////////////////////////

~drum1 = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,\degree, Pwhite(0, 7, inf),\octave, 3,\dur, Pwhite(1, 1, inf),\legato, 1,\amp, 0.5).collect({ |event|~lastDrumEvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.1));
~drum2 = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,\degree, Pwhite(0, 7, inf),\octave, 3,\dur, Pwhite(1, 2, inf),\legato, 1,\amp, 0.3).collect({ |event|~lastDrumEvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.1));
~drum3 = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,\degree, Pwhite(0, 7, inf),\octave, 3,\dur, Pwhite(1, 3, inf),\legato, 1,\amp, 0.3).collect({ |event|~lastDrumEvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.1));
~drum4 = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,\degree, Pwhite(0, 7, inf),\octave, 3,\dur, Pwhite(1, 4, inf),\legato, 1,\amp, 0.5).collect({ |event|~lastDrumEvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.1));
~drum5 = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,\degree, Pwhite(0, 7, inf),\octave, 3,\dur, Pwhite(1, 5, inf),\legato, 1,\amp, 0.5).collect({ |event|~lastDrumEvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.1));

~drum6 = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,\degree, Pwhite(14, 16, inf),\octave, 3,\dur, Pwhite(1, 2, inf),\legato, 1,\amp, 0.8).collect({ |event|~lastDrumEvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.1));

~drum1.stop;
~drum2.stop;
~drum3.stop;
~drum4.stop;
~drum5.stop;
~drum6.stop;

/////////////////////////////////////////////////////////////////////////////////////

//TempoClock.default.tempo = 0.5;
TempoClock.default.tempo = 0.5;
TempoClock.default.tempo = 1;
TempoClock.default.tempo = 2.5;
TempoClock.default.tempo = 3.5;
TempoClock.default.tempo = 4.0;
TempoClock.default.tempo = 4.5;
TempoClock.default.tempo = 5;
/////////////////////////////////////////////////////////////////////////////////////