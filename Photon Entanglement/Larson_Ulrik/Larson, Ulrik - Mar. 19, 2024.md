
**End-of-day summary:**
- Added Linux rules to make FPGA work\*
	- \*I don't know if this step was necessary since it alone wasn't enough to fix it, but I'm leaving it in just in case it is necessary.
- Fiddled with some command line stuff to get Quartus to detect the USB-Blaster as a USB-Blaster and not a USB-Blaster Variant.
	- This worked
	- Now the Quartus on this computer can upload to the FPGA
		- In JTAG mode
		- For this session
	* I made a shell script to apply my changes again. (Requires root privileges and root user to run.)
- We got an old but supposedly very high-quality oscilloscope.
	- Can't tell if it works or not though

*This reminder was written on 3/7/2024 and might not necessarily reflect my current understanding of the situation come 3/19/2024, at which time I may have a fresh perspective.*

We require a device capable of the following:
* Detecting 2.2V pulses that last 10ns
* Keeping time accurately enough to verify whether two different events happened at the exact same time (~10ns precision)
* Sending live data back to a computer
It doesn't matter how that device sends it back to a computer. Serial connection, USB connection, whatever -- as long as it can be harvested and processed with Python, we're golden.

Regardless of whether the rest of the team gets the FPGA working, by now Dr. Zimmerman and/or Dr. Patterson should be back. Ask one of them about nabbing an oscilloscope.

...

Well, it's Mar. 19, 2024 now, and I'm helping out with the FPGA.
Looks like our Error Code 89 when we attempt to shove our code from the Linux machine to the FPGA can be fixed with... Device rules?
I don't know what those are, but I found a couple helpful guides to the matter.
https://www.intel.com/content/www/us/en/support/programmable/support-resources/download/dri-usb-b-lnx.html?erpm_id=13746231_ts1710855665754
This one deals with our specific predicament.
https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux
This one speaks of linux rules in general. Theoretically I could read the whole thing and learn to write my own rules, but I read just enough to get the fundamental mechanics of rules and feel confident in what I was doing.

In any case-- accessing the folder required by command line is a bit of a tricky thing.
First, run the `dir` command.
For me, it shows:
`Desktop, Downloads, intelFPGA, Pictures, Templates, Documents, examples.desktop, Music, Public, Videos`
That is not what we're after. Use `cd ..` to reach the directory above this one, and then `dir` again to see what's inside.
`daniel, photanglement, roy, tanmaya`
Still not it. `cd ..` one more time. (Or as many times as you want. We want to go all the way to the top.)
`bin, dev, initrd.img, lib32, media...`
__That__ is what we're after.
We'll want to dive a bit further in.

`cd ..` + `cd ..` + `cd ..` + `dir` + `cd etc` + `cd udev` + `cd rules.d` + `dir`

You'll need root privileges to continue.
`su root` (comes with password authorization!)

And now, to create a file called `51-usbblaster.rules` and fill it with:
```
# Intel FPGA Download Cable
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"
# Intel FPGA Download Cable II
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"
```
I did so with `nano 51-usbblaster.rules` to open a text editor and create the file.
*To cut down on unnecessary typing, use Ctrl+K to cut a line, and Ctrl+U to paste it.*

When done, use `dir` to verify the file was actually created.

...Nevermind. That didn't fix it. Maybe if I try:
```
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6001", MODE="0666", SYMLINK+="usbblaster/%k" 
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6002", MODE="0666", SYMLINK+="usbblaster/%k" 
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6003", MODE="0666", SYMLINK+="usbblaster/%k" 
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6010", MODE="0666", SYMLINK+="usbblaster2/%k" 
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6810", MODE="0666", SYMLINK+="usbblaster2/%k"
```
Nope, nor did that. Perhaps a restart?

Nuh uh. Dang.

Alright-- someone else had a workaround. With root permissions:
https://community.intel.com/t5/Intel-Quartus-Prime-Software/Trouble-with-programming-device-under-Linux/td-p/129420
```
root# killall jtagd
root# jtagconfig -n
```
...Well, the first half worked, but...
`jtagconfig: command not found`
Well, drat. Okay, maybe if I...
`export PATH="/home/photanglement/intelFPGA/23.1std/quartus/linux64"`
`echo $PATH`
Okay, so far so good.
`killall jtagd`
```
Command 'killall' is available in '/usr/bin/killall'
The command could not be located because '/usr/bin' is not included in the PATH environment variable.
killall: command not found
```
...At least my path changes were temporary. Alright; restarting terminal.
Perhaps, with the gentle addition of...
`export PATH="/home/photanglement/intelFPGA/23.1std/quartus/linux64:$PATH"`
`echo $PATH` now shows something much longer.
`killall jtagd`
`jtagconfig -n`
```
jtagconfig: error while loading shared libraries: libjtag_client.so: cannot open shared object file: No such file or directory
```
Well, what if I just `ldconfig` about it?
Nothing. Hm.
Well, that's a problem. I'm out of ideas.
But it did mention a libjtag_client.so file, so maybe if I can find that...
`export PATH="/home/photanglement/intelFPGA/23.1std/qprogrammer/linux64:$PATH"`
`echo $PATH`
Longer again. Good. Okay.
`killall jtagd`
`jtagconfig -n`
Same error.
`ldconfig`
`jtagconfig`
Okay, maybe adding it to the path isn't enough. Why don't I just:
`export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/photanglement/23.1std/qprogrammer/linux64/libtag_client.so`
`jtagconfig`
Same error. Probably did this a bit wrong.
`sudo find / -iname libjtag_client.so`


Okay, I messed it up a bit. Lemme restart the shell and try again.
Let's see here...

`su root`
`export PATH="$PATH:/home/photanglement/intelFPGA/23.1std/quartus/linux64"`
`echo $PATH`
`export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/photanglement/23.1std/quartus/linux64"`
`echo $LD_LIBRARY_PATH`
uhh wait a minute, i expected that to be longer...
`exit`
`echo $LD_LIBRARY_PATH`
...Nope, it was blank to start with. Maybe if I restart and...

`su root`
`export PATH="$PATH:/home/photanglement/intelFPGA/23.1std/quartus/linux64"`
`export LD_LIBRARY_PATH="$PATH"`
`echo $LD_LIBRARY_PATH`
Good, good.
`ldconfig`
`jtagconfig`
Holy smokes, did that just work?
`killall jtagd`
`jtagconfig -n`
```
1) USB-Blaster [3-8]
  020F70DD   10CL120(Y|Z)/EP3C120/..
  
```
It worked.



---

We received a Tektronix 7854 Oscilloscope. I found some documentation on the scope itself. ...Like, not on the internet. Just in a set of plastic cards that are fixed into the device itself.
The digital processor operates with reverse polish notation -- unsurprisingly, it's stack-based.
Perhaps it would be a fun exercise to run simple calculations on this thing? ...Though it's not designed for that, maybe. Maybe I can't use this as a calculator.

In any case, the wiki (https://w140.com/tekwiki/wiki/7854) goes into more relevant details.
"The waveform processor can be programmed using a detachable calculator-style keyboard, using postfix operators (reverse Polish notation like HP calculators) that operate on entire waveforms, not just individual numbers."
Interesting.

The device features attachment sites on the back for a GPIB connector, and its companion keyboard (which is currently detached).

To use this effectively, we need a few things:
1. A GPIB that costs less than a hundred dollars (seriously, what the fuck? It's a bunch of metal wires wrapped in plastic. It can't possibly be worth that much.)
2. The detachable keyboard. (That thing seems so darn cool; if Stout has that lying around I want it.)

But since my time here is technically over, that'll be something to ask for next time.
But before I go, lemme just try turning it on. See if I can get it to cough up some smoke or twinkle a couple lights.
...
Nope. Nothing. Might be kaput, or maybe I didn't get the power cord in right.

---

I might end up being late again next time, so I might as well get that quick patch rolled into a shell script of some kind before I dip on out of here.
...Well, that took a while, but it should save us all some time later down the line.