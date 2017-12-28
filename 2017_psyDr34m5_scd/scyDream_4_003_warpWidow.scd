/////////////////////////////////////////////////////////////////////////////////////
// ブードゥー教の子 ///////////////////////////////////////////////////////////////////
// PSY.DR34M5:    ///////////////////////////////////////////////////////////////////
// SCL20170114    ///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
// 03.- warpWidow      //////////////////////////////////////////////////////////////
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

)

//~granulator.set(\rate, 3.15);
~granulator.set(\rate, 1.33);
~granulator.set(\rate, 0.33);
~granulator.set(\rate, 9);
~granulator.set(\rate, 0.0033);
~granulator.set(\rate, 0.00000033);
w.stop;

~kk.stop;
w.stop;

/////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////

(
var w,f;

w = Window("warp", Rect(400,400,300,125));
w.view.background_(Color.rand);
f = w.addFlowLayout;

EZSlider(w, 280@20, "rate", [0.1,4],  {|sl| ~granulator.set(\rate, sl.value) }, 1);
EZSlider(w, 280@20, "freqScale", [0.1,4],  {|sl| ~granulator.set(\freqScale, sl.value) }, 1);
EZSlider(w, 280@20, "grainSize", [0.01,1],  {|sl| ~granulator.set(\grainSize, sl.value) }, 0.2);
EZSlider(w, 280@20, "overlaps", [1,8,\lin,1],  {|sl| ~granulator.set(\overlaps, sl.value) }, 4);
EZSlider(w, 280@20, "rnd", \unipolar,  {|sl| ~granulator.set(\rnd, sl.value) }, 0.1);

w.front;
)
/////////////////////////////////////////////////////////////////////////////////////