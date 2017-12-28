// ブードゥー教の子
// PSY.DR34M5: karmaZqncer
//toroidalGridSeries Ed
// SCL20171013
/////////////////////
b = NetAddr.new("192.168.1.8", 12000);
/////////////////////
//tune
//G J desactivar
(
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/scene/goDream0", 1.0);
b.sendMsg("/process/lg", 0.375);
b.sendMsg("/process/rg", 1.0);
b.sendMsg("/process/hc", 0.5);
b.sendMsg("/process/sc",  1.0);
b.sendMsg("/process/vsa", 0.85);
b.sendMsg("/process/hsa", 0.05);
)
//Rec
//G J alternar
b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/do", 0.0);

b.sendMsg("/process/hc", 0.0);
b.sendMsg("/process/sc",  0.0);

b.sendMsg("/process/lg", 0.0);
b.sendMsg("/process/lg", 1.0);
b.sendMsg("/process/lg", 0.375);
b.sendMsg("/process/lg", 0.625);
// hacia l final su Q
/////////////////////
//brownie
b.sendMsg("/scene/goDream1", 1.0);
//Q
b.sendMsg("/scene/goDream0", 1.0);
b.sendMsg("/scene/goDream2", 1.0);
//guides off grid off
b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/lg", 0.0);
b.sendMsg("/process/lg", 0.375);
b.sendMsg("/process/rg", 0.375);
b.sendMsg("/process/rg", 0.625);
b.sendMsg("/process/rg", 1.0);
//b.sendMsg("/process/sc", 0.0);

b.sendMsg("/scene/goDream1", 1.0);
b.sendMsg("/scene/goDream2", 1.0);
b.sendMsg("/scene/goDream0", 1.0);
b.sendMsg("/scene/goDream1", 1.0);

b.sendMsg("/process/hc", 0.0);
b.sendMsg("/process/sc",  0.0);
b.sendMsg("/process/sc",  1.4);

//b.sendMsg("/process/do", 0.0);


/////////////////////
//warpWidow
(
b.sendMsg("/scene/goDream3", 1.0);
b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/doh", 1.0);
b.sendMsg("/process/cop", 0.0);
b.sendMsg("/process/lg", 0.0);//.375);
b.sendMsg("/process/rg", 0.625);
)
b.sendMsg("/scene/goDream3", 1.0);
b.sendMsg("/scene/goDream2", 1.0);
b.sendMsg("/scene/goDream1", 1.0);

b.sendMsg("/process/lg", 0.625);
b.sendMsg("/process/lg", 1.0);
b.sendMsg("/process/lg", 0.0);
b.sendMsg("/process/rg", 1.0);
b.sendMsg("/process/lg", 0.0);
b.sendMsg("/process/lg", 0.375);
b.sendMsg("/process/rg", 0.0);
b.sendMsg("/process/rg", 0.375);
b.sendMsg("/process/rg", 0.625);
b.sendMsg("/process/rg", 1.0);
//////////
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/do", 1.0);
///////////
b.sendMsg("/process/hc", 0.0);
b.sendMsg("/process/hc", 1.0);
b.sendMsg("/process/sc",  0.0);
b.sendMsg("/process/sc",  1.0);
b.sendMsg("/process/vsa", 0.5);
b.sendMsg("/process/hsa", 0.0);

b.sendMsg("/process/rg", 0.0);

b.sendMsg("/scene/goDream3", 1.0);
b.sendMsg("/scene/goDream4", 1.0);
/////////////////////
//egg
b.sendMsg("/process/doh", 0.0);
b.sendMsg("/process/rg", 1.0);
b.sendMsg("/scene/goDream3", 1.0);
b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/rg", 0.625);
b.sendMsg("/process/lg", 0.625);
b.sendMsg("/process/lg", 0.375);
//b.sendMsg("/process/rg", 0.625);

b.sendMsg("/process/hc", 0.0);
b.sendMsg("/process/sc",  0.0);;
b.sendMsg("/process/vsa", 1.0);
b.sendMsg("/process/hsa", 0.0);
//Q ?
/////////////////////
//cardioid

b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/doh", 0.0);
b.sendMsg("/scene/goDream5", 1.0);
// bajar audio quitar Q
b.sendMsg("/model/cols", 0.5);
b.sendMsg("/model/rows", 0.5);
b.sendMsg("/model/r1", 0.1);
b.sendMsg("/model/r2", 0.0);
b.sendMsg("/model/cols", 0.1);
b.sendMsg("/model/rows", 0.1);
b.sendMsg("/model/rows", 1.0);
b.sendMsg("/model/r1", 0.1);
b.sendMsg("/model/r1", 0.0);
b.sendMsg("/model/r2", 0.0);
//K
//Lights
b.sendMsg("/model/rows", 0.1);
//

b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/vsa", 1.0);
/////////////////////
//toshimiYeah! // subir vol
b.sendMsg("/model/r1", 0.1);
b.sendMsg("/model/r1", 0.0);
b.sendMsg("/model/r2", 0.0);
b.sendMsg("/process/sc",  1.0);
b.sendMsg("/process/lg", 0.0);
b.sendMsg("/process/lg", 0.325);
b.sendMsg("/process/rg", 0.625);
b.sendMsg("/process/rg", 1.0);

b.sendMsg("/process/sc",  1.0);
/////////////////////
//karmaZqncer
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/sc",  0.0);
b.sendMsg("/process/do", 1.0);
b.sendMsg("/scene/goDream4", 1.0);
b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/do", 0.0);
b.sendMsg("/process/lg", 0.0);
b.sendMsg("/process/lg", 0.325);
b.sendMsg("/process/rg", 0.625);
b.sendMsg("/process/rg", 1.0);
//Q


//////////////////////
//raw commands
//////////////////////
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
b.sendMsg("/process/lg", 0.375);
b.sendMsg("/process/rg", 0.625);
b.sendMsg("/process/hc", 1.0);
b.sendMsg("/process/sc", 1.0);
b.sendMsg("/process/sc", 0.0);
b.sendMsg("/process/sc", 1.0);
b.sendMsg("/process/hsa", 0.0);
b.sendMsg("/process/vsa", 0.0);

b.sendMsg("/process/bgm", 0.0);

b.sendMsg("/model/cols", 0.2);
b.sendMsg("/model/rows", 0.3);
b.sendMsg("/model/r1", 1.0);
b.sendMsg("/model/r2", 0.0);

b.sendMsg("/model/scale", 1.2);
b.sendMsg("/model/rxs", 0.5);
b.sendMsg("/model/rxsm", 0.0);
b.sendMsg("/model/rysm", 0.20);
b.sendMsg("/model/asf", 1.0);




b.sendMsg("/process/lg", 0.0);
b.sendMsg("/process/lg", 0.375);
b.sendMsg("/process/rg", 0.625);

b.sendMsg("/process/sc", 0.0);



b.sendMsg("/process/lg", 0.0);//88);
b.sendMsg("/process/rg", 1.0);//88);
(
b.sendMsg("/process/cop", 1.0);
b.sendMsg("/process/do", 0.0);
)
b.sendMsg("/process/do", 1.0);
b.sendMsg("/process/lg", 0.375);
b.sendMsg("/process/lg", 0.375);
b.sendMsg("/process/rg", 0.625);
b.sendMsg("/process/rg", 1.0);//0.625);
b.sendMsg("/process/hc", 1.0);
b.sendMsg("/process/sc", 1.0);


