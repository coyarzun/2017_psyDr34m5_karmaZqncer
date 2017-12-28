/////////////////////////////////////////////////////////////////////////////////////
// ブードゥー教の子 ///////////////////////////////////////////////////////////////////
// PSY.DR34M5:    ///////////////////////////////////////////////////////////////////
// SCL20170419    ///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 00.- tune           //////////////////////////////////////////////////////////////
// 01.- brownie        //////////////////////////////////////////////////////////////
// 02.- warpWidow      //////////////////////////////////////////////////////////////
// 03.- egg            //////////////////////////////////////////////////////////////
// 04.- cardioid       //////////////////////////////////////////////////////////////
// 05.- toshimiYeah!   //////////////////////////////////////////////////////////////
// 06.- karmaZqncer    //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
s.boot;
MIDIClient.init;
/////////////////////////////////////////////////////////////////////////////////////
(
m=MIDIOut(1);//1);
n=MIDIOut(2);//2);
TempoClock.default.tempo = 1;
)
/////////////////////////////////////////////////////////////////////////////////////
b = NetAddr.new("192.168.1.8", 12000);
/////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////
(
SynthDef(\playbuf, { |bufnum, start, dur = 0.2, amp = 1.2, out|
    var    sig = PlayBuf.ar(1, bufnum, BufRateScale.ir(bufnum), 0, start);
    sig = sig * amp * EnvGen.kr(Env.linen(0.01, dur, 0.01), doneAction: 2);
    Out.ar(out, sig ! 2)
}).add;
)
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 00.- tune           //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

(
m.program(0, 46);

m.control(9,0,1);
m.program(9, 5);

n.control(1,0,1);
n.program(1, 47);

)

//visuals
(
b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/vsa", 1.0);
b.sendMsg("/process/cop", 0.0);
)

/////////////////////////////////////////////////////////////////////////////////////

m.noteOn(0, 62, 60);
m.noteOff(0, 62, 60);
/////////////////////////////////////////////////////////////////////////////////////
m.noteOn(9, 36, 127);
m.noteOff(9, 36, 60);
m.noteOn(9, 38, 60*2);
m.noteOff(9, 38, 60);
/////////////////////////////////////////////////////////////////////////////////////
(
m.noteOn(0, 61, 60);
b.sendMsg("/process/rg", 0.75);
)
m.noteOff(0, 61, 60);

m.noteOn(1, 67, 60);
m.noteOff(1, 67, 60);
//bassline
n.noteOn(1, 64, 60);
n.noteOff(1, 64, 60);

//noteOffes
(
m.allNotesOff(0);
m.allNotesOff(1);
n.allNotesOff(1);
)

(
b.sendMsg("/process/cop", 1.0);
b.sendMsg("/process/do", 0.0);
)
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 01.- Brownie        //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
(
m.program(0, 46);

m.control(9,0,1);
m.program(9, 5);

n.control(1,0,2);
n.program(1, 3);

TempoClock.default.tempo = 1.2;
)
(
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/goDream1", 1.0);
)
///////////////////////////////////////////////////////////////////////////////////// bassdrum
(
~bdPick = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 9,
    \degree, Pwhite(6, 7, inf),
    \octave, 2,
    \dur, 0.25*Pbrown(1, 3, 3, inf),
    \amp, 1.8
).play;
)
~bdPick.stop;
///////////////////////////////////////////////////////////////////////////////////// rasho

(
~rasho = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 9,
    \degree, Pwhite(4, 4, inf),
    \octave, 6,
    \dur, 0.25*Pbrown(1, 3, 2, inf),
    \amp, 0.8
).play;
b.sendMsg("/scene/goDream0", 1.0);
)

~rasho.stop;
/////////////////////////////////////////////////////////////////////////////////////keyboard mid
(
~kbMid = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,
    \degree, Pbrown(2, 7, 4, inf),
	\octave, 4,
    \cutoff, Pn(Pif(Ptime(inf) <= 2.0, Env(#[-1, 1, -1], #[2, 2], \sin)), inf),
    \dur, Pbrown(1, 2, 1, inf),
	\legato, 0.5
).play;
b.sendMsg("/scene/goDream2", 1.0);
)

~kbMid.stop();
/////////////////////////////////////////////////////////////////////////////////////keyboard bassline
(
~kbLow = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,
    \degree, Pbrown(2, 7, 4, inf),
	\octave, 2,
    //\cutoff, Pn(Pif(Ptime(inf) <= 2.0, Env(#[-1, 1, -1], #[2, 2], \sin)), inf),
    \dur, Pbrown(1, 3, 2, inf),//0.125*4.5,
	\legato, 1.5
).play;

)
~kbLow.stop;
///////////////////////////////////////////////////////////////////////////////////// bass
(
~strongBass = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,
    \degree, Pbrown(1, 1, 2, inf),
	\octave, 2,
    \cutoff, Pn(Pif(Ptime(inf) <= 2.0, Env(#[-1, 1, -1], #[2, 2], \sin)), inf),
    \dur, Pbrown(1, 2, 1, inf),
	\legato, 0.5
).play;
b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/lg", 0.0);
b.sendMsg("/process/rg", 0.75);
b.sendMsg("/process/sc", 0.0);
)
~strongBass.stop;
/////////////////////////////////////////////////////////////////////////////////////keyboard agudos
(
~kbHigh = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,
    \degree, Pbrown(2, 7, 4, inf),
	\octave, 7,
    //\cutoff, Pn(Pif(Ptime(inf) <= 2.0, Env(#[-1, 1, -1], #[2, 2], \sin)), inf),
    \dur, Pbrown(1, 2, 5, inf),
	\legato, 3.15
).play;
b.sendMsg("/scene/goDream0", 1.0);
)
(
~kbHigh.stop();
b.sendMsg("/scene/goDream2", 1.0);
)
/////////////////////////////////////////////////////////////////////////////////////
(
~kbHigh.stop();
b.sendMsg("/scene/goDream2", 1.0);
)

(
~kbMid.stop();
b.sendMsg("/scene/goDream0", 1.0);
)

(
~kbLow.stop();
b.sendMsg("/scene/goDream1", 1.0);
)

~bdPick.stop();
~rasho.stop();

~strongBass.stop();
/////////////////////////////////////////////////////////////////////////////////////
//noteOffes
(
m.allNotesOff(0);
m.allNotesOff(1);
n.allNotesOff(1);
b.sendMsg("/process/cop", 1.0);
)

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 02.- warpWidow      //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

w = Buffer.read(s,"/Users/coyarzun/ima/artProjects/2016_psyDreams/rsrcs/13_freshWidow_mixdown-7eqa_01x.wav")


// play with rnd, overlap + grainSize for taste
(
m.program(0, 5);

~granulator = { |bufnum, rate = 0.33, freqScale=1.33, grainSize=0.4, overlaps=4, rnd=0.3|
	Pan2.ar(
		Warp1.ar(
			bufnum.numChannels,
			bufnum,
			LFSaw.kr(BufDur.kr(bufnum).reciprocal * rate,1,0.5,0.5),
			freqScale,
			grainSize,
			-1, overlaps, rnd);
	)
}.play(args: [\bufnum, w]);

TempoClock.default.tempo = 94.5*2/60;//199.5/60;//95*2/60;//

~kk = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,\degree, Pwhite(0, 0, inf),\octave, 3,\dur, Pwhite(2, 2, inf),\legato, 0,\amp, 2).collect({ |event|~lastDrumEvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.2));


b.sendMsg("/scene/goDream3", 1.0);
b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/doh", 1.0);
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/process/lg", 0.25);
b.sendMsg("/process/rg", 0.75);

)
//~granulator.set(\rate, 3.15);
(
~granulator.set(\rate, 1.33);
b.sendMsg("/process/lg", 0.75);
)
(
~granulator.set(\rate
	 , 0.33);
b.sendMsg("/process/lg", 0.25);
b.sendMsg("/process/rg", 0.75);
)
~granulator.set(\rate, 9);
~granulator.set(\rate, 0.0033);
~granulator.set(\rate, 0.00000033);
w.stop;
(
~kk.stop;
w.stop;
)
//command dot!!
//then stop visuals-->
(
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/doh", 0.0);
b.sendMsg("/process/cop", 1.0);
)
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 03.- egg            //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
(
TempoClock.default.tempo = 5;

m.allNotesOff(0);
m.allNotesOff(1);
n.allNotesOff(1);


m.program(0, 32);

m.control(9,0,1);
m.program(9, 5);
b.sendMsg("/scene/goDream3", 1.0);
)

(
~bass = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\degree, Pwhite(5, 5+12, inf),\octave, 1,\dur, Pwhite(1, 3, inf),\legato, 1,\amp, 2).collect({ |event|~lastBassvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.1));
)
~bass.stop;

/////////////////////////////////////////////////////////////////////////////////////
(
n.control(1,0,1);
n.program(1, 47);

~bass2 = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,\degree, Pwhite(5, 5+12, inf),\octave, 2,\dur, Pwhite(1, 3, inf),\legato, 1,\amp, 0.2).collect({ |event|~lastBassvent = event;}).play(quant: Quant(quant: 1, timingOffset: 0.1));
b.sendMsg("/process/cop", 0.0);
)
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
TempoClock.default.tempo = 3.5;//<<--


b.sendMsg("/process/do", 1.00);
//b.sendMsg("/process/lg", 0.49);
b.sendMsg("/process/lg", 0.00);
b.sendMsg("/process/rg", 0.5);


TempoClock.default.tempo = 4.0;
TempoClock.default.tempo = 4.5;
TempoClock.default.tempo = 5;
(
~bass.stop;
//~bass2.stop;
~bass3.stop;
)

(
m.allNotesOff(0);
m.allNotesOff(1);
n.allNotesOff(1);
b.sendMsg("/scene/goDream1", 1.0);
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/doh", 0.0);
b.sendMsg("/process/cop", 1.0);

)
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 04.- cardioid       //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
(
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/doh", 0.0);
b.sendMsg("/process/cop", 1.0);
b.sendMsg("/scene/goDream5", 1.0);

m.program(0, 87);//B38 = 10*8+8-1

m.control(9,0,1);
m.program(9, 5);

n.control(1,0,0);
n.program(1, 2);

TempoClock.default.tempo = 2*157/120;
)
(
~chords1 = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 0,
    \degree, Pwhite(1, 4, inf),
    \octave, 6,
    \dur, Pwhite(4, 12, inf),
    \legato, 0.5,
    \amp, 0.2
).collect({ |event|
    ~lastBassEvent = event;
}).play(quant: Quant(quant: 1, timingOffset: 0.1));
b.sendMsg("/process/cop", 0.0);
)

(

~chords2 = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 0,
    \degree, Pwhite(1, 4, inf),
    \octave, 7,
    \dur, Pwhite(4, 12, inf),
    \legato, 0.5,
    \amp, 0.2
).collect({ |event|
    ~lastBassEvent = event;
}).play(quant: Quant(quant: 1, timingOffset: 0.2));
b.sendMsg("/model/cols", 0.5);
b.sendMsg("/model/rows", 0.5);
b.sendMsg("/model/r1", 0.1);
b.sendMsg("/model/r2", 0.0);

)





(
~hhat = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 9,
    \degree, 13,
    \octave, 3,
    \dur, 0.5,
    \amp, 0.8
).collect({ |event|
    ~lastBassEvent = event;
}).play(quant: Quant(quant: 1, timingOffset: 0.1));
)

(
~keys = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 9,
    \degree, Pwhite(8, 9, inf),
    \octave, 5,
    \dur, 0.5,
    \amp, 1.8
).collect({ |event|
    ~lastBassEvent = event;
}).play(quant: Quant(quant: 1, timingOffset: 0.6));
)

(
~kick = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 9,
    \degree, 0,
    \octave, 3,
    \dur, 2,
    \amp, 1
).collect({ |event|
    ~lastBassEvent = event;
}).play(quant: Quant(quant: 1, timingOffset: 0.1));
)

(
~bassJ = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, n,
    \chan, 1,
    \degree, Pwhite(1, 4, inf),
    \octave, 2,
    \dur, 0.5,//Pwhite(1, 4, inf),
    \legato, 1,
    \amp, 0.2
).collect({ |event|
    ~lastBassEvent = event;
}).play(quant: Quant(quant: 1, timingOffset: 0.1));
b.sendMsg("/model/cols", 0.1);
b.sendMsg("/model/rows", 0.1);
b.sendMsg("/model/r1", 0.1);
b.sendMsg("/model/r2", 0.0);
)

(
~chords3 = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 0,
    \degree, Pwhite(1, 4, inf),
    \octave, 8,
    \dur, Pwhite(0.125, 1, inf),
    \legato, 1.5,
    \amp, 0.2
).collect({ |event|
    ~lastBassEvent = event;
}).play(quant: Quant(quant: 1, timingOffset: 0.2));
)
~chords3.stop;
(
~bassK = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 1,
    \degree, Pwhite(1, 4, inf),
    \octave, 4,
    \dur, 0.5,
    \legato, 1,
    \amp, 0.5
).collect({ |event|
    ~lastBassEvent = event;
}).play(quant: Quant(quant: 1, timingOffset: 0.6));

)
//~bassk.stop;
////////////////////////
~hhat.stop;
~hhat.play(quant: Quant(quant: 1, timingOffset: 0.1));

~keys.play;
~keys.stop;

//~kick.stop;
~kick.play(quant: Quant(quant: 1, timingOffset: 0.1));

~chords1.play;
~chords1.stop;

~chords2.play;
~chords2.stop;

~chords3.stop;
~chords3.play(quant: Quant(quant: 1, timingOffset: 0.1));

~bassJ.stop;
//~bassK.stop;
~bassJ.play(quant: Quant(quant: 1, timingOffset: 0.1));


~bassK.stop;
~bassK.play(quant: Quant(quant: 1, timingOffset: 0.1));

(
~bassJ.stop;
//~kick.stop;
)

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 05.- toshimiYeah!   //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
(

t = Pfset({
	~buf = Buffer.read(s, "/Users/coyarzun/ima/artProjects/2016_psyDreams/rsrcs/toshimi.wav");//Platform.resourceDir +/+ "sounds/a11wlk01.wav");
    0.2.yield;    // sync seems to be incompatible with patterns
    ~bufFrames = ~buf.numFrames;
}, Pbind(
    \instrument, \playbuf,
        // access resources in the protoevent by Pkey
    \bufnum, Pkey(\buf),
    \dur, Pwhite(1, 4, inf) * 0.25,
        // upper bound of Pwhite is based on duration
        // so that start + (dur * samplerate) never goes past the buffer's end
    \start, Pwhite(0, Pkey(\bufFrames) - (Pkey(\dur) * 44100*1), inf)
), { defer(inEnvir { "freeing buffer".postln; ~buf.free }, 1.1) }).play;
)

// shows a buffer number allocated ('true' ContiguousBlock)
s.bufferAllocator.debug;


(
//t.stop;
~kick.stop;
m.allNotesOff(0);
m.allNotesOff(1);
n.allNotesOff(1);
b.sendMsg("/scene/goDream6", 1.0);
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/doh", 0.0);
b.sendMsg("/process/cop", 1.0);
)



/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 07.- karmaZqncer    //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
(
TempoClock.default.tempo = 1.9;

m.program(0, 16);
n.control(1,0,0);
n.program(1, 2);

m.control(9,0,1);
m.program(9, 5);

b.sendMsg("/scene/goDream4", 1.0);
b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/doh", 0.0);
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/process/lg", 0.25);
b.sendMsg("/process/rg", 0.9);


//
)
(
~bassdrum = EventPatternProxy(
	        Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,9,
	              \midinote, Pseq([36,36,36,36], inf),
                  \dur, 1,
                  \legato, 0.9,\amp, 1.0)
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

~someBass.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,\midinote, Pseq([38,50,50], inf),\dur, Pseq([0.25,0.25,0.25], inf),\legato, 0.9,\amp, 1.0);

~someBass.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,\midinote, Pseq([38,50,38+5,38+12,38+12+5], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~someBass.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,1,\midinote, Pseq([38,50,38+5,38+12,38+12+5], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~someBass2.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,1,\midinote, Pseq([38,50], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~someBass.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,\midinote, Pseq([38,50], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~someBass.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, n,\chan,1,\midinote, Pseq(12+[38,50,50], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~someKeys.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Pseq(2*12+[38,50,50], inf),\dur, 0.25,\legato, 0.9,\amp, 1.0);

~someKeys.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Pseq(31+12+[38,50,38+5,38+5+12,38-2], inf),\dur, 0.5,\legato, 0.8,\amp, 1.0);

~someKeys.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Pseq(31+12*2.0+[38,50,38+5,38+5+12,38-2], inf),\dur, 0.5,\legato, 0.8,\amp, 1.0);

~someKeys.source = Pbind(\type, \midi,\midicmd,\noteOn,\midiout, m,\chan,0,\midinote, Pseq(12+[38,50,38+5,38+5+12,38-2], inf),\dur, 0.5,\legato, 0.8,\amp, 1.0);


(
~someKeys.stop;
~bassdrum.stop;
~someBass.stop;
~someBass2.stop;
)
(
m.allNotesOff(0);
m.allNotesOff(1);
n.allNotesOff(1);
b.sendMsg("/scene/goDream6", 1.0);
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/doh", 0.0);
b.sendMsg("/process/cop", 1.0);
)
/////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////
b.sendMsg("/scene/goDream0", 1.0);
b.sendMsg("/scene/goDream1", 1.0);
b.sendMsg("/scene/goDream2", 1.0);
b.sendMsg("/scene/goDream3", 1.0);
b.sendMsg("/scene/goDream4", 1.0);
b.sendMsg("/scene/goDream5", 1.0);
b.sendMsg("/scene/goDream6", 1.0);

b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/doh", 1.0);
b.sendMsg("/process/doh", 0.0);
b.sendMsg("/process/cop", 1.0);
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/process/lg", 0.0);
b.sendMsg("/process/rg", 0.75);
b.sendMsg("/process/hc", 1.0);
b.sendMsg("/process/sc", 1.0);
b.sendMsg("/process/sc", 1.0);
b.sendMsg("/process/sc", 0.0);
b.sendMsg("/process/hsa", 1.0);
b.sendMsg("/process/vsa", 1.0);

b.sendMsg("/process/bgm", 1.0);

b.sendMsg("/model/cols", 1.0);
b.sendMsg("/model/rows", 1.0);
b.sendMsg("/model/r1", 0.0);
b.sendMsg("/model/r2", 1.75);

b.sendMsg("/model/scale", 0.0);
b.sendMsg("/model/rxs", 1.0);
b.sendMsg("/model/rxsm", 1.0);
b.sendMsg("/model/rysm", 1.0);
b.sendMsg("/model/asf", 1.0);
/////////////////////////////////////////////////////////////////////////////////////