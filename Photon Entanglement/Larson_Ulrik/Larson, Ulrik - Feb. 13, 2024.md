Ryan's out sick today. Big oof.

Seth is busy reading through old documents and papers, so I'll try to get the hang of Quartus II 13.1 (64-bit) Web Edition. The read-me-first document should help out.

So, buried in that single photon folder, there's something called "config.py" -- this is important, because the __USB port used by the program is hard-coded and should be changed.__ Let me walk through how to change it:
- First, you'll need to figure out which port to change it to. Open device manager, and select under the view menu "devices by type" if it isn't already selected. This is the default view, as far as I'm aware, so if you've never used device manager this shouldn't be an issue.
- Scroll down to the device-category "Ports (COM & LPT)". If it is already present, open the drop-down to see what's already in this category. Take note of anything already in here, and ignore it.
- Plug in the USB adapter for our FPGA. Device manager will update to include the new device in its compendium of everything jacked into your computer -- this means a new entry should be in the "Ports (COM & LPT)" category.
- When I do this, something called "Prolific USB-to-Serial Comm Port (COM3)" showed up. If it's anything like this, remember which COM_ port was given in the name.
- C:\\weirdness\\single-photon\\PythonCode\\fpga_ccu\\fpga_ccu\\config.py is the file path for me, and leads to the file that must be reconfigured.
- There is a field for "DEFAULTS" under which 'port' is an entry. The value here might be something like COM4, but last time I checked this HP-"Elitebook"-whatever-UW-Stout-spent-too-much-on-for-how-long-it-lasts doesn't have a COM4. (Not that I checked.) Change this entry to the appropriate COM port; in my case, that would be COM3. (I used a python IDLE to edit the file, but a text editor would probably work about as well.)
- Save your changes.
Do not use a different port for this device again if you complete this process successfully, or you will have to reconfigure config.py again.

...I'm now being told that Quartus is only required if I want to alter the code in the FPGA. Since the previous group uploaded some code there already, I might not have to use Quartus.
We're leaning one way, then the other, then the first, ...
We can't make up our minds on this one.

The __single-photon detectors are damaged when exposed to excessive light__, so I verified they were unplugged. They were.
Our laser was not. Don't be like me.

It was recommended I run the following commands, after changing the working directory to C:\\weirdness\\single-photon\\PythonCode\\fpga_ccu\\fpga_ccu :
`pip install -e .`
Once that's done, plug the FPGA into the proper port and change the working directory to PythonCode, then run `python ccu_log.py` in the command prompt.
If all goes well, something will happen.
It might also show something like "no module named 'numpy'". Use `pip install whateveryouaremissingpy` as needed to resolve this issue.
*If you accidentally open Windows PowerShell like I did, some commands might not work. Use `cmd` to rectify this issue.*

The INSTRUCTIONS file was useful here.



...What's a USB blaster?