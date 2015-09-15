var ip="84.199.86.195";

var port='24459';

var pref = Components.classes["@mozilla.org/preferences-service;1"].getService(Components.interfaces.nsIPrefService);

var a    = pref.getBranch("network.proxy.");

a.setCharPref("socks", ip);

a.setIntPref("socks_port", port);

a.setIntPref("type", 1);

iimPlay("alexamaster.iim");
