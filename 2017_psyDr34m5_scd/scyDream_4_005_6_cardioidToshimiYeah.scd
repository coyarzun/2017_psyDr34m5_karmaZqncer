/////////////////////////////////////////////////////////////////////////////////////
// ブードゥー教の子 ///////////////////////////////////////////////////////////////////
// PSY.DR34M5:    ///////////////////////////////////////////////////////////////////
// SCL20170114    ///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 05.- cardioid       //////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

m.allNotesOff(0);
m.allNotesOff(1);
n.allNotesOff(1);

m.program(0, 87);//B38 = 10*8+8-1

m.control(9,0,1);
m.program(9, 5);

n.control(1,0,0);
n.program(1, 2);

TempoClock.default.tempo = 2*157/120;

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
~bassk.stop;

~hhat.stop;
~hhat.play(quant: Quant(quant: 1, timingOffset: 0.1));

~keys.play;
~keys.stop;

~kick.stop;
~kick.play(quant: Quant(quant: 1, timingOffset: 0.1));

~chords1.play;
~chords1.stop;

~chords2.play;
~chords2.stop;

~chords3.stop;
~chords3.play(quant: Quant(quant: 1, timingOffset: 0.1));;

~bassJ.stop;
~bassJ.play(quant: Quant(quant: 1, timingOffset: 0.1));


~bassK.stop;
~bassK.play(quant: Quant(quant: 1, timingOffset: 0.1));

(
~bassJ.stop;
~kick.stop;
)

/////////////////////////////////////////////////////////////////////////////////////
// ブードゥー教の子 ///////////////////////////////////////////////////////////////////
// PSY.DR34M5:    ///////////////////////////////////////////////////////////////////
// SCL20170114    ///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 06.- toshimiYeah!   //////////////////////////////////////////////////////////////
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


t.stop;