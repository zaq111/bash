const XMLHttpRequest = Components.Constructor("@mozilla.org/xmlextras/xmlhttprequest;1"); var request = XMLHttpRequest();

var txtFile = new XMLHttpRequest();
	        txtFile.open("GET", "file://D:/notices.txt", true);

allText = txtFile.responseText;

var allTextLines = [];
allTextLines = allText.split(/\r\n|\n/);

var fldData = []
fldData = allTextLines[0].split(':');


var pref = Components.classes["@mozilla.org/preferences-service;1"].getService(Components.interfaces.nsIPrefService);
var a    = pref.getBranch("network.proxy.");
a.setCharPref("socks", txtFile);
a.setIntPref("socks_port", '80');
a.setIntPref("type", 1);
