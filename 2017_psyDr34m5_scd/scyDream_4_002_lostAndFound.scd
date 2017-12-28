/////////////////////////////////////////////////////////////////////////////////////
// ブードゥー教の子 ///////////////////////////////////////////////////////////////////
// PSY.DR34M5:    ///////////////////////////////////////////////////////////////////
// SCL20170114    ///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 02.- lost&found     //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
(
TempoClock.default.tempo = 4 ;//1.8*132/60;


m.program(0, 4);//(1*8)+8+28);
n.control(1,0,0);
n.program(1, 12);

(
m.allNotesOff(0);
m.allNotesOff(1);
n.allNotesOff(1);
)

)

(
~violins =

	//Pxrand([
EventPatternProxy(
Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,
        \midinote,

		Pseq(-3+[0, 60, 65, 68, 67, 68, 67, 60,
                     0, 60, 65, 68, 67, 68, 67, 60,
                     0, 62, 67, 70, 69, 70, 69, 62,
                     0, 62, 67, 70, 69, 70, 69, 62,
                     0, 67, 72, 75, 74, 75, 74, 67,
                    70, 72, 70, 63, 65, 67, 65, 60,
                    62, 63, 62, 55, 58, 60, 58, 51,
			        53, 55, 53, 48, 50, 51, 50, 43], inf),
        \dur, 1,//Pwhite(0, 4, inf),
        \legato, 1.2,\amp, 0.5)
)
.play(quant: Quant(quant: 1, timingOffset: 0.1));


~bassV = EventPatternProxy(
Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,
	\midinote, Pseq(-12+9+0+[24, 24, 36, 36, 24, 24, 36, 36,
                         24, 24, 36, 36, 24, 24, 36, 36,
                         24+2, 24+2, 36+2, 36+2, 24+2, 24+2, 36+2, 36+2,
                         24+2, 24+2, 36+2, 36+2, 24+2, 24+2, 36+2, 36+2,
                         24+2+5, 24+2+5, 36+2+5, 36+2+5, 24+2+5, 24+2+5, 36+2+5, 36+2+5,
                         24+2+5, 24+2+5, 36+2+5, 36+2+5, 24+2+5, 24+2+5, 36+2+5, 36+2+5,
                         24+2+5, 24+2+5, 36+2+5, 36+2+5, 24+2+5, 24+2+5, 36+2+5, 36+2+5,
                         24+2+5, 24+2+5, 36+2+5, 36+2+5, 24+2+5, 24+2+5, 36+2+5, 36+2+5
		], inf),
        \dur, 1,
        \legato, 0.6,\amp, 0.5)
)
.play(quant: Quant(quant: 1, timingOffset: 0.1));

~bassW = EventPatternProxy(
Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,1,
	\midinote, Prand(-12+9+24+12+[
			        53, 55, 53, 48, 50, 51, 50, 43
		], inf),
        \dur, 	0.5,//Pbrown(0,0.5,0.125,inf),
        \legato, 0.6,\amp, 0.5)
)
.play(quant: Quant(quant: 1, timingOffset: 0.1));
)
(

~drumV = EventPatternProxy(
Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,
	\midinote, Pseq([
			//36, 42, 38, 42, 36, 36, 38, 42
			36,42,42,42,38,42,42,42,36,42,42,42,38,42,42,42
		], inf),
        \dur, 0.5,
        \legato, 0.5,\amp, 1.5)
)
.play(quant: Quant(quant: 1, timingOffset: 0.1));



)
//////////////////////////////////////////////////
(
~violins.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Prand(-3+12+12+[//Pseq
                     0, 67, 72, 75, 74, 75, 74, 67,
                    70, 72, 70, 63, 65, 67, 65, 60,
                    62, 63, 62, 55, 58, 60, 58, 51,
			        53, 55, 53, 48, 50, 51, 50, 43
], inf),\dur,
	//Pwhite(1, 2, inf)
	Pbrown(1,3,1,inf)
	//1.0
	,\legato, 0.6,\amp, 0.5);
)
(
~violins.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Prand(-3+12+12+[//Pseq
                     0, 67, 72, 75, 74, 75, 74, 67,
                    70, 0, 70, 63, 65, 67, 65, 60,
                    62, 63,0, 55, 58, 60, 58, 51,
			        53, 55, 53, 0, 50, 51, 50, 43
], inf),\dur,
	//Pwhite(1, 2, inf)
	Pbrown(1,3,1,inf)
	//1.0
	,\legato, 0.6,\amp, 0.5);
)
(
~violins.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Pseq(-3+12+12+[
//	0, 60, 65, 68, 67, 68, 67, 60,
						        53, 55, 53, 48, 50, 51, 50, 43,
	62, 63, 62, 55, 58, 60, 58, 51,
//                   70, 72, 70, 63, 65, 67, 65, 60
], inf),\dur,
//	Pwhite(0, 2, inf)
		Pbrown(1,3,1,inf)
//	1.0
	,\legato, 0.9,\amp, 0.5);
)

(
~violins.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Pseq(-3+24+12+[
				                         24+2+5, 24+2+5, 36+2+5, 36+2+5, 24+2+5, 24+2+5, 36+2+5, 36+2+5,
], inf),\dur,
//	Pwhite(0, 2, inf)
//	1.0
			Pbrown(1,3,7,inf)
	,\legato, 0.9,\amp, 0.5);
)


//	~violins.stop;
(
~bassV.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,\midinote,
	Pseq(-12+9+[
//		70, 72, 70, 63, 65, 67, 65, 60,
//		24+2//, 24+2, 36+2, 36+2, 24+2, 24+2, 36+2, 36+2,
				                         24+2+5, 24+2+5, 36+2+5, 36+2+5, 24+2+5, 24+2+5, 36+2+5, 36+2+5,
//
], inf),\dur, 0.5,\legato, 0.6,\amp, 0.5);
)
(
~drumV.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,\midinote, Pseq([38,42,42,42,36,42,42,42,38,42,42,42,36,42,42,42], inf),\dur, 0.5,\legato, 0.5,\amp, 1.0);
)




//~violins.play(quant: Quant(quant: 1, timingOffset: 0.1));
(
~violins.stop;
~bassV.stop;
//~bassW.stop;
~drumV.stop;
)
~drumV.stop;
/////////////////////////////////////////////////////////////////////////////////////