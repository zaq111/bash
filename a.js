var ip="59.19.6.79";
var port='1337';
var pref = Components.classes["@mozilla.org/preferences-service;1"].getService(Components.interfaces.nsIPrefService);
var a    = pref.getBranch("network.proxy.");
a.setCharPref("socks", ip);
a.setIntPref("socks_port", port);
a.setIntPref("type", 1);
iimPlay("alexamaster.iim");
