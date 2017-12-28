/////////////////////////////////////////////////////////////////////////////////////
// ブードゥー教の子 ///////////////////////////////////////////////////////////////////
// PSY.DR34M5:    ///////////////////////////////////////////////////////////////////
// SCL20170114    ///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 07.- karmaZqncer    //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
TempoClock.default.tempo = 1.9;

m.program(0, 16);
n.control(1,0,0);
n.program(1, 2);

m.control(9,0,1);
m.program(9, 5);

m.allNotesOff(0);
m.allNotesOff(1);
n.allNotesOff(1);

(
~bassdrum = EventPatternProxy(
	        Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,
	              \midinote, Pseq([36,36,36,36], inf),
                  \dur, 1,
                  \legato, 0.9,\amp, 1.0)
            ).play(quant: Quant(quant: 1, timingOffset: 0.1));
~someBass2 = EventPatternProxy(
	        Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,1,
	              \midinote, Pseq([38,50,38+5,38+5+12,38-2], inf),
                  \dur,      0.25,
                  \legato,   0.9,\amp, 1.0)
           ).play(quant: Quant(quant: 1, timingOffset: 0.1));

~someBass = EventPatternProxy(
	        Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,
	              \midinote, Pseq([38,50,50], inf),
                  \dur,      0.25,
                  \legato, 0.9,\amp, 1.0)
           ).play(quant: Quant(quant: 1, timingOffset: 0.1));

~someKeys = EventPatternProxy(
	        Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,
	              \midinote, Pseq(12+[38,50], inf),
                  \dur,      0.25,
                  \legato, 0.9,\amp, 1.0)
           ).play(quant: Quant(quant: 1, timingOffset: 0.1));

)

//p = Pchain(~someBass, ~bassdrum).play;
~bassdrum.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,\midinote, Pseq([36,42,42,42,36,42,42,42,36,42,42,42,36,42,42,42], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~bassdrum.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,\midinote, Pseq([36,42,42,42,38,42,42,42,36,42,42,42,38,42,42,42], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~bassdrum.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,\midinote, Pseq([36], inf),\dur, 1,\legato, 0.9,\amp, 1.0);

~someBass2.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,1,\midinote, Pseq([38,50,50], inf),\dur, Pseq([0.25,0.25,0.25], inf),\legato, 0.9,\amp, 1.0);

~someBass2.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,1,\midinote, Pseq([38,50,38+5,38+12,38+12+5], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~someBass2.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,1,\midinote, Pseq([38,50], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~someBass.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,\midinote, Pseq([38,50], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~someBass.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,\midinote, Pseq(12+[38,50,50], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~someKeys.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Pseq(2*12+[38,50,50], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~someKeys.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Pseq(31+12+[38,50,38+5,38+5+12,38-2], inf),\dur, 0.5,\legato, 0.8,\amp, 1.0);

~someKeys.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Pseq(31+12*2.0+[38,50,38+5,38+5+12,38-2], inf),\dur, 0.5,\legato, 0.8,\amp, 1.0);

~someKeys.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Pseq(12+[38,50,38+5,38+5+12,38-2], inf),\dur, 0.5,\legato, 0.8,\amp, 1.0);


~someKeys.stop;
~bassdrum.stop;
~someBass.stop;
~someBass2.stop;


/////////////////////////////////////////////////////////////////////////////////////