void oscSetup(){
  oscP5 = new OscP5(this, 12000);
  String ip = "192.168.1.8";//"169.254.198.15";//169.254.61.66";//192.168.0.71";//"192.168.0.183";//"170.20.10.3";//
  myRemoteLocation = new NetAddress(ip, 12000);//
  oscP5.plug(environment, "setDo", "/process/do");
  oscP5.plug(environment, "setDoH", "/process/doh");
  oscP5.plug(environment, "setCop", "/process/cop");
  oscP5.plug(environment, "setLG", "/process/lg");
  oscP5.plug(environment, "setRG", "/process/rg");
  oscP5.plug(environment, "setHC", "/process/hc");
  oscP5.plug(environment, "setInter", "/process/sc");//<--corregir
  oscP5.plug(environment, "setHSA", "/process/hsa");
  oscP5.plug(environment, "setVSA", "/process/vsa");

  oscP5.plug(environment, "setBgm", "/process/bgm");

  oscP5.plug(environment, "setCols", "/model/cols");
  oscP5.plug(environment, "setRoWs", "/model/rows");
  oscP5.plug(environment, "setR1", "/model/r1");
  oscP5.plug(environment, "setR2", "/model/r2");

  oscP5.plug(environment, "setSCL", "/model/scale");
  oscP5.plug(environment, "setRXS", "/model/rxs");
  oscP5.plug(environment, "setRXSM", "/model/rxsm");
  oscP5.plug(environment, "setRYSM", "/model/rysm");
  oscP5.plug(environment, "setASF", "/model/asf");
  
  
  oscP5.plug(psydreams, "goDream0", "/scene/goDream0");
  oscP5.plug(psydreams, "goDream1", "/scene/goDream1");
  oscP5.plug(psydreams, "goDream2", "/scene/goDream2");
  oscP5.plug(psydreams, "goDream3", "/scene/goDream3");
  oscP5.plug(psydreams, "goDream4", "/scene/goDream4");
  oscP5.plug(psydreams, "goDream5", "/scene/goDream5");
  oscP5.plug(psydreams, "goDream6", "/scene/goDream6");
  
}
void oscEvent(OscMessage theOscMessage) {
  /* with theOscMessage.isPlugged() you check if the osc message has already been
   * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
   * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
   * be used for double posting but is not required.
   */
  if (theOscMessage.isPlugged()==false) {
    /* print the address pattern and the typetag of the received OscMessage */
    println("### received an osc message.");
    println("### addrpattern\t"+theOscMessage.addrPattern());
    println("### typetag\t"+theOscMessage.typetag());
  }
}
