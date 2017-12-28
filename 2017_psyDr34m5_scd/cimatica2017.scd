////////////////////////////////////////
b = NetAddr.new("192.168.1.8", 12000);
////////////////////////////////////////
b.sendMsg("/pattern/zequencer", 0.0);
b.sendMsg("/pattern/zequencer", 1.0);
////////////////////////////////////////
b.sendMsg("/pattern/zqnceAll",  0.0);
b.sendMsg("/pattern/zqnceAll",  1.0);
b.sendMsg("/pattern/tempo",     1.5);
b.sendMsg("/pattern/tempo",     2.5);
b.sendMsg("/view/main",         3.1);
//b.sendMsg("/pico",1.0);

b.sendMsg("/ambient/winDir",  0.0);
b.sendMsg("/ambient/rain",  0.0);
b.sendMsg("/ambient/wind",  0.0);
b.sendMsg("/ambient/waterAmp",  0.0);
b.sendMsg("/ambient/helicoAmp",  0.50);
b.sendMsg("/ambient/cycles",  0.0);
b.sendMsg("/ambient/xtrangeF",  10.5);
b.sendMsg("/ambient/trailScale",  0.0);
b.sendMsg("/ambient/trails",  0.0);
b.sendMsg("/ambient/xcentricity",  2.5);
b.sendMsg("/ambient/noiseScale",  2.50);//<--
b.sendMsg("/ambient/perlinV1",  1.75);
b.sendMsg("/ambient/perlinV2",  0.5);
//b.sendMsg("/ambient/rec",1.0);
b.sendMsg("/ambient/halloes",0.0);
b.sendMsg("/ambient/inner",1.0);
b.sendMsg("/ambient/outline",1.0);
b.sendMsg("/ambient/vertex",1.0);
b.sendMsg("/ambient/cycle",1.0);
b.sendMsg("/ambient/scroll",1.0);
b.sendMsg("/ambient/threshold",1.0);
//global
b.sendMsg("/pattern/invert",1.0);
b.sendMsg("/pattern/invert",0.0);

//special fx ???? /ON/OFF
b.sendMsg("/pattern/onOff/1/1", 1.0);//<..on off
b.sendMsg("/pattern/onOff/1/2", 1.0);//<..on off
b.sendMsg("/pattern/onOff/1/3", 1.0);//<..on off
b.sendMsg("/pattern/onOff/1/4", 1.0);//<..on off
b.sendMsg("/pattern/onOff/1/5", 1.0);//<..on off
b.sendMsg("/pattern/onOff/1/6", 1.0);//<..on off
b.sendMsg("/pattern/onOff/1/7", 1.0);//<..on off
b.sendMsg("/pattern/onOff/1/8", 1.0);//<..on off
//GLITCH
b.sendMsg("/pattern/glitch00", 1.0);
b.sendMsg("/pattern/glitch01", 1.0);
b.sendMsg("/pattern/glitch02", 1.0);
b.sendMsg("/pattern/glitch03", 0.0);
b.sendMsg("/pattern/glitch04", 1.0);
b.sendMsg("/pattern/glitch05", 1.0);
b.sendMsg("/pattern/glitch06", 1.0);
b.sendMsg("/pattern/glitch07", 1.0);
//HOLD
b.sendMsg("/pattern/hold/1/1", 1.0);
b.sendMsg("/pattern/hold/1/2", 1.0);
b.sendMsg("/pattern/hold/1/3", 1.0);
b.sendMsg("/pattern/hold/1/4", 1.0);
b.sendMsg("/pattern/hold/1/5", 0.0);
b.sendMsg("/pattern/hold/1/6", 1.0);
b.sendMsg("/pattern/hold/1/7", 1.0);
b.sendMsg("/pattern/hold/1/8", 1.0);
//FLIPH
b.sendMsg("/pattern/flipH/1/1", 1.0);
b.sendMsg("/pattern/flipH/1/2", 1.0);
b.sendMsg("/pattern/flipH/1/3", 0.0);
b.sendMsg("/pattern/flipH/1/4", 0.0);
b.sendMsg("/pattern/flipH/1/5", 0.0);
b.sendMsg("/pattern/flipH/1/6", 1.0);
b.sendMsg("/pattern/flipH/1/7", 0.0);
b.sendMsg("/pattern/flipH/1/8", 1.0);
//FLIPV
b.sendMsg("/pattern/flipV/1/1", 1.0);
b.sendMsg("/pattern/flipV/1/2", 1.0);
b.sendMsg("/pattern/flipV/1/3", 1.0);
b.sendMsg("/pattern/flipV/1/4", 0.0);
b.sendMsg("/pattern/flipV/1/5", 1.0);
b.sendMsg("/pattern/flipV/1/6", 0.0);
b.sendMsg("/pattern/flipV/1/7", 1.0);
b.sendMsg("/pattern/flipV/1/8", 0.0);
//ZOOM
b.sendMsg("/view/zoom00", 2.0);//0.81);
b.sendMsg("/view/zoom01", 2.1);
b.sendMsg("/view/zoom02", 0.1);
b.sendMsg("/view/zoom03", 0.1);
b.sendMsg("/view/zoom04", 0.1);
b.sendMsg("/view/zoom05", 0.1);
b.sendMsg("/view/zoom06", 1.1);
b.sendMsg("/view/zoom07", 0.1);
//rotX
b.sendMsg("/observer/rotX00", 0.0);
b.sendMsg("/observer/rotX01", 0.0);
b.sendMsg("/observer/rotX02", 0.0);
b.sendMsg("/observer/rotX03", 0.0);//1.75);
b.sendMsg("/observer/rotX04", 1.5);
b.sendMsg("/observer/rotX05", 1.0);
b.sendMsg("/observer/rotX06", 0.125);
b.sendMsg("/observer/rotX07", 0.0);
//rotY
b.sendMsg("/observer/rotY00", 0.20);
b.sendMsg("/observer/rotY01", 0.5);
b.sendMsg("/observer/rotY02", 0.5);
b.sendMsg("/observer/rotY03", 0.5);
b.sendMsg("/observer/rotY04", 0.5);
b.sendMsg("/observer/rotY05", 0.5);
b.sendMsg("/observer/rotY06", 0.5);
b.sendMsg("/observer/rotY07", 0.5);
//rotZ
b.sendMsg("/observer/rotZ00", 1.5);//25);//25);
b.sendMsg("/observer/rotZ01", 0.5);//25);
b.sendMsg("/observer/rotZ02", 0.5);
b.sendMsg("/observer/rotZ03", 0.0);
b.sendMsg("/observer/rotZ04", 0.0);
b.sendMsg("/observer/rotZ05", 0.0);
b.sendMsg("/observer/rotZ06", 0.0);
b.sendMsg("/observer/rotZ07", 0.0);
//yOff
b.sendMsg("/observer/yOff00", 0.5);
b.sendMsg("/observer/yOff01", 0.5);
b.sendMsg("/observer/yOff02", 0.25);
b.sendMsg("/observer/yOff03", 0.5);
b.sendMsg("/observer/yOff04", 0.5);
b.sendMsg("/observer/yOff05", 0.0);
b.sendMsg("/observer/yOff06", 0.5);
b.sendMsg("/observer/yOff07", 0.5);
//zOff
b.sendMsg("/observer/zOff00", 0.5);
b.sendMsg("/observer/zOff01", 0.5);
b.sendMsg("/observer/zOff02", 0.5);
b.sendMsg("/observer/zOff03", 0.75);
b.sendMsg("/observer/zOff04", 0.5);
b.sendMsg("/observer/zOff05", 0.5);
b.sendMsg("/observer/zOff06", 0.5);
b.sendMsg("/observer/zOff07", 0.5);
//dotSize
b.sendMsg("/graph/dotSize00", 0.2);//10.1);
b.sendMsg("/graph/dotSize02", 1.1);//10.1);
b.sendMsg("/graph/dotSize03", 10.1);//11.5);
b.sendMsg("/graph/dotSize04", 1.1);//10.2);
b.sendMsg("/graph/dotSize05", 1.1);//12.1);
b.sendMsg("/graph/dotSize06", 5.1);//11.8);
b.sendMsg("/graph/dotSize07", 4.1);//10.5);
//lineLength
b.sendMsg("/graph/lineLength00", 10.8);
b.sendMsg("/graph/lineLength01", 1.1);
b.sendMsg("/graph/lineLength02", 1.5);
b.sendMsg("/graph/lineLength03", 20.5);
b.sendMsg("/graph/lineLength04", 1.5);
b.sendMsg("/graph/lineLength05", 0.8);
b.sendMsg("/graph/lineLength06", 10.1);
b.sendMsg("/graph/lineLength07", 10.0);
//line
b.sendMsg("/graph/line00", 1.0);
b.sendMsg("/graph/line01", 1.0);
b.sendMsg("/graph/line02", 1.0);
b.sendMsg("/graph/line03", 1.0);
b.sendMsg("/graph/line04", 1.0);
b.sendMsg("/graph/line05", 1.0);
b.sendMsg("/graph/line06", 1.0);
b.sendMsg("/graph/line07", 1.0);
b.sendMsg("/graph/line08", 1.0);
//dot
b.sendMsg("/graph/dot00", 0.0);
b.sendMsg("/graph/dot01", 1.0);
b.sendMsg("/graph/dot02", 0.0);
b.sendMsg("/graph/dot03", 1.0);
b.sendMsg("/graph/dot04", 0.0);
b.sendMsg("/graph/dot05", 1.0);
b.sendMsg("/graph/dot06", 0.0);
b.sendMsg("/graph/dot07", 0.0);
//INVERT
b.sendMsg("/pattern/invert00", 0.0);
b.sendMsg("/pattern/invert01", 0.0);
b.sendMsg("/pattern/invert02", 0.0);
b.sendMsg("/pattern/invert03", 0.0);
b.sendMsg("/pattern/invert04", 0.0);
b.sendMsg("/pattern/invert05", 0.0);
b.sendMsg("/pattern/invert06", 0.0);
b.sendMsg("/pattern/invert07", 0.0);
//
b.sendMsg("/pattern/invert",1.0);
b.sendMsg("/pattern/invert",0.0);

//TEMPO
b.sendMsg("/pattern/tempo00", 1.1);
b.sendMsg("/pattern/tempo01", 1.0);
b.sendMsg("/pattern/tempo02", 1.1);
b.sendMsg("/pattern/tempo03", 1.0);
b.sendMsg("/pattern/tempo04", 1.0);
b.sendMsg("/pattern/tempo05", 1.0);
b.sendMsg("/pattern/tempo06", 1.0);
b.sendMsg("/pattern/tempo07", 1.0);
//GAIN
b.sendMsg("/input/gain00", 1.0);
b.sendMsg("/input/gain01", 1.0);
b.sendMsg("/input/gain02", 0.0);
b.sendMsg("/input/gain03", 1.0);
b.sendMsg("/input/gain04", 1.0);
b.sendMsg("/input/gain05", 0.0);
b.sendMsg("/input/gain06", 0.0);
b.sendMsg("/input/gain07", 1.0);
b.sendMsg("/input/gain08", 1.0);
//BEAT DETECT
b.sendMsg("/input/beatDetect/3/1", 1.0);
b.sendMsg("/input/beatDetect/2/1", 1.0);
b.sendMsg("/input/beatDetect/1/1", 1.0);
b.sendMsg("/input/hit/1/1", 0.0);

b.sendMsg("/input/beatDetect/3/2", 0.0);
b.sendMsg("/input/beatDetect/2/2", 0.0);
b.sendMsg("/input/beatDetect/1/2", 1.0);
b.sendMsg("/input/hit/1/2", 1.0);

b.sendMsg("/input/beatDetect/3/3", 0.0);
b.sendMsg("/input/beatDetect/2/3", 0.0);
b.sendMsg("/input/beatDetect/1/3", 0.0);
b.sendMsg("/input/hit/1/3", 0.0);

b.sendMsg("/input/beatDetect/3/4", 0.0);
b.sendMsg("/input/beatDetect/2/4", 0.0);
b.sendMsg("/input/beatDetect/1/4", 0.0);
b.sendMsg("/input/hit/1/4", 0.0);

b.sendMsg("/input/beatDetect/3/5", 0.0);
b.sendMsg("/input/beatDetect/2/5", 0.0);
b.sendMsg("/input/beatDetect/1/5", 0.0);
b.sendMsg("/input/hit/1/5", 0.0);

b.sendMsg("/input/beatDetect/3/6", 0.0);
b.sendMsg("/input/beatDetect/2/6", 0.0);
b.sendMsg("/input/beatDetect/1/6", 0.0);
b.sendMsg("/input/hit/1/6", 0.0);

b.sendMsg("/input/beatDetect/3/7", 0.0);
b.sendMsg("/input/beatDetect/2/7", 0.0);
b.sendMsg("/input/beatDetect/1/7", 0.0);
b.sendMsg("/input/hit/1/7", 0.0);

b.sendMsg("/input/beatDetect/3/8", 0.0);
b.sendMsg("/input/beatDetect/2/8", 0.0);
b.sendMsg("/input/beatDetect/1/8", 0.0);
b.sendMsg("/input/hit/1/8", 0.0);
//BRIGHTNESSS
b.sendMsg("/view/brightness00", 0.0);
b.sendMsg("/view/brightness01", 0.0);
b.sendMsg("/view/brightness02", 0.0);
b.sendMsg("/view/brightness03", 0.0);
b.sendMsg("/view/brightness04", 0.0);
b.sendMsg("/view/brightness05", 0.0);
b.sendMsg("/view/brightness06", 0.0);
b.sendMsg("/view/brightness07", 0.0);
