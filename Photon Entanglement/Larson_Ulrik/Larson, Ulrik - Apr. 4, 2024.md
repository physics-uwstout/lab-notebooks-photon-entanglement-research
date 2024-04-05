Apparently I've been slipping on my lab notebooks.
So unfortunate.

A summary of the accomplishments in our semi-recent days is as follows:
- Got the USB blaster working with fancy shell trickery
	- This got the FPGA working and running our code, too
- We determined our voltage divider was constructed wrong.
	- (It worked for the last group, somehow. We don't know how. We're fixing it.)
- We're doing stuff with lasers now

A summary of Thursday, Apr. 4, 2024:
* Ryan fixed the voltage divider
* Seth finalized the alignment of our red laser and demonstrated that one of our fiber optic cables and two of our fiber-optic-to-open-air receptacles work perfectly.
* Nobody but Seth can get the python code to work, apparently.
* The python code will not work on the Linux PC.

A summary of Tuesday, Apr. 2, 2024:
* We determined that our voltage divider's pin assignments were goofed up so we determined the proper pin assignments with a delicate re-reading of the readme files, and confirmed them with a function generator (and a lot of trial and error!)

A summary of Thursday, Mar. 28, 2024:
* Spent the entire time aligning lasers. We figured out our voltage divider was total bungus when it failed to register any counts (except occasionally when I jostled it around)
	* *Being in a dark room working with lasers for an extended period of time will make you tired, especially since this class starts at 8:00 and continues for three hours. Dr. Zimmerman suggests coffee and heavy metal to remedy this.*

A summary of Tuesday, Mar. 26, 2024:
* Spent essentially the entire time aligning lasers, but I must admit my memory is fuzzy on this day by now.

The way we got our FPGA loading the code was this (explained in the "Quartus-No-Work.txt" document)
1. All of the following steps in any order:
	- Acquire a Linux PC.
	- Install Quartus Prime, the single-photon folder, and my quartus-fixer shell script.
	- Hook up the FPGA and Linux PC via USB blaster cable
		- Your USB blaster cable is recognized as a USB blaster variant
			- Weep (optional; skip this step if you're in a rush)
	* Open the project
2. Unless your Quartus installation is stored in a very specific location you'll need to edit the shell script.
	- The shell script assumes that a command location of `"$PATH:/home/photanglement/intelFPGA/23.1std/quartus/linux64"` will yield the desired results -- it will not, unless your username is "photanglement". You will therefore want to change the file path.
	- The shell script also has an argument of `do_configure_library = 0` -- you might want to set it to 1 if you're out of ideas for fixing this. (If it wasn't necessary sometimes I don't know why I'd include it, but I don't remember what this would be used for.)
1. Open the programmer view and hit "device setup"
	- Verify that your USB blaster cable is, in fact, a USB blaster variant
		- If it shows up as a regular USB blaster cable, good for you! It's already working.
1. Run the ulrik-quartus-fixer.sh with root privileges via:
	* `su root`
		* Type in your root password
	* *Navigate to wherever the script is via `cd <whatever-directory-you-used>`*
	* `./ulrik-quartus-fixer.sh` will run the shell script
	* (If the script detects something goes wrong it should tell you)
		* If you are root but the script disagrees, you probably are not root.
			* If you are root but the problem persists, you can manually remove the rootness check by editing the shell script.
			* You might also want to try `chmod +x ulrik-quartus-fixer.sh` to make it executable, but my previous notes don't mention that being necessary.
2. Close hardware setup. Open hardware setup again.
	- If your device setup shows a USB blaster variant, close it and open it again.
		- If the problem persists, contact your local wizard or try running the script again.
	- If your device setup shows nothing, close it and open it again.
		- This is the expected state of things.
	- If your device setup shows a USB blaster (NOT a variant!!!) you're golden!
Note that the "quartus-no-work?.txt" assumes you are trying to run demo code using JTAG-run-mode rather than active serial programming, and thus recommends you have your FPGA switched to RUN mode.
Ignore this directive when attempting to use our project.



A quick rehearsal of the Python stuff (your commands might be different depending on where it's saved)
```
cd weirdness
cd single-photon
cd PythonCode
cd fpga_ccu
pip install -e .
cd ..
python ccu_log.py
# I'm informed that serial has no such item "Serial" -- possibly because I'm not plugged into the FPGA.
```
Well, this is a problem. I don't have anything written about how to solve this.