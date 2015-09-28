//VPS.me
const XMLHttpRequest = Components.Constructor("@mozilla.org/xmlextras/xmlhttprequest;1"); 
Chg_Title("Starting")
function Chg_Title(title) { window.document.title = title; }
//Lepas ip socks sebelumnya
var pref = Components.classes["@mozilla.org/preferences-service;1"].getService(Components.interfaces.nsIPrefService);
var b    = pref.getBranch("network.proxy.");
b.setIntPref("type", 0);
//Buat koneksi ke webserver
var tweak = new XMLHttpRequest();
tweak.open("GET", "https://raw.githubusercontent.com/zaq111/set_vps/master/config", false);
tweak.send();
var tmp = tweak.responseText;
//ambil semua line, masukin ke array [0]xxx.xxx.xx.xxx:80  [1] xxx.xxx.xx.xxx:8080   [2]xxx.xxx.xx.xxx:3128
var config = [];
config = tmp.split(/\r\n|\n/);
var x1    = pref.getBranch("browser.");
var x2    = pref.getBranch("javascript.");
var x3    = pref.getBranch("memory.");
x1.setIntPref("cache.disk.max_chunks_memory_usage", config[1]);
x1.setIntPref("cache.disk.max_priority_chunks_memory_usage",config[3]);
x1.setIntPref("cache.memory.max_entry_size",config[5]);
x1.setBoolPref("sessionstore.resume_from_crash", config[7]);
x1.setBoolPref("fullscreen.animate", config[9]);
x1.setBoolPref("fullscreen.autohide", config[11]);
x2.setBoolPref("options.gc_on_memory_pressure",config[13]);
x2.setIntPref("options.mem.max", config[15]);
x3.setBoolPref("free_dirty_pages", config[17]);
x3.setIntPref("ghost_window_timeout_seconds", config[19]);

//ambil job
var job = new XMLHttpRequest();
job.open("GET", "https://raw.githubusercontent.com/zaq111/bash/master/jobs", false);
job.send();
var now = job.responseText;
//ambil semua line, masukin ke array [0]xxx.xxx.xx.xxx:80  [1] xxx.xxx.xx.xxx:8080   [2]xxx.xxx.xx.xxx:3128
var jobdo = [];
jobdo = now.split(/\r\n|\n/);
//play macro
iimPlay(jobdo[5]);
