/////////////////////////////////////////////////////////////////////////////////////
// ブードゥー教の子 ///////////////////////////////////////////////////////////////////
// PSY.DR34M5:    ///////////////////////////////////////////////////////////////////
// SCL20170114    ///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
b = NetAddr.new("192.168.1.8", 12000);
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
b.sendMsg("/process/hc", 0.0);
b.sendMsg("/process/sc", 0.0);
b.sendMsg("/process/hsa", 1.0);
b.sendMsg("/process/vsa", 1.0);

b.sendMsg("/process/bgm", 1.0);

b.sendMsg("/model/cols", 1.0);
b.sendMsg("/model/rows", 1.0);
b.sendMsg("/model/r1", 1.0);
b.sendMsg("/model/r2", 1.0);

b.sendMsg("/model/scale", 1.0);
b.sendMsg("/model/rxs", 1.0);
b.sendMsg("/model/rxsm", 1.0);
b.sendMsg("/model/rysm", 1.0);
b.sendMsg("/model/asf", 10.0);