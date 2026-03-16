Well, research day could've been a lot worse, I suppose.

Our Linux computer is running Ubuntu, version 16.04.6 LTS (Xenial Xerus).

...

Well, that's that, I suppose. No data, no problem.

We spent today working on our final paper, which you should take a moment to read if you can -- within is contained some valuable insight into what we have accomplished. (To a lesser extent, it may also document what we have not accomplished.)

To future groups reading this, I'd like to make a few things clear:
First of all: the SPCMs (single photon counting modules) are irreplaceable. I'm not aware of the policy surrounding equipment damaged via careless operation, if there is one. With luck and care, you all will remain as unaware of this as I. To do so, abide by the following precautions:
- While the SPCM is not connected to power, it is inert. It can be subject to the normal stresses of lab equipment, including light. Besides gentle handling, no outlandish precautions necessary in this state.
- While the SPCM is connected to power, all foreign light sources pose a serious danger to its continued operation. A few consequences of this are listed below:
	- The green light present in the room (the doofy looking thing with a headband) emits a frequency that is almost entirely blocked by the band-pass filters each receiver is equipped with. It will likely be safe to shine at the receivers, but it will influence photon counts slightly so try not to do this.
	- The blue laser this experiment uses is almost entirely blocked by the band-pass filters as well. However, it is strong enough that shining the laser into the receiver while it is connected to the SPCM, whether or not a band-pass filter is present, will probably compromise the SPCM.
	- The red laser available in this room emits a low enough frequency of light that the band pass filter does not provide perfect protection against it. Ensure that the red laser is unplugged before turning on any SPCMs; regardless of where it is aimed or what it is aimed at, the SPCMs will register abnormally high counts while it is on and may be destroyed.
	- The light of your phone or computer may increase photon counts or cause equipment damage. If these devices must be used, reduce your brightness to minimum, consider using an inverted colors setting for your display if most applications have white backgrounds, and *definitely* use a curtain to conceal the light output from the SPCMs.
	- The light of the FPGA is problematic and must be concealed from the SPCMs while in operation. Use a thick curtain to block light if placing it in another room proves infeasible.
	- The lights fitted onto the ceiling of this room and which are present in nearby rooms pose an unacceptable risk to the SPCMs regardless of band pass filtering; ensure the lights are off and the door is closed before SPCMs are attached to power.
	- There is a sign on the door which is sufficient to strongly suggest to even a casual and disinterested onlooker to "DO NOT OPEN" the door. Regardless, if the door makes a sound that suggests it is about to open when it absolutely should not be opened, it must be physically prevented from doing so, regardless of who the prospective intruder claims to be; remove all SPCMs from power before allowing light to enter the room.
- Do not turn on the SPCM if it is not properly attached to something which will manage its light collection.
	- The SPCM should be attached via fiber optic cable to a ThorLabs light-receiver-thingamajig, fitted with a lens and a band pass filter. Do not turn on the SPCM without verifying that it is properly attached to such a device.
		- To test if an unidentifiable black wafer in such a receiver is the band pass filter you desire, take it and view the sun through it, with a single eye. If you see a very faint red image, that is a band pass filter. Clean the filter before returning it to the receiver/collector/receptacle/whatever-it's-called.
	- Testing the alignment of the receivers involves routing a red laser backwards through them and aiming the beam at the BBO crystal, so making sure the right fiber-optics are socketed into place and the red laser is off is something you will have to keep in mind.
- Do not leave the SPCM running for an excessive period of time, as it generates a considerable amount of heat.
	- Aluminum blocks are provided to manage this heat output so it should be fine, but still; don't stack any pillows on top of them, no matter how much it could lighten the mood.
- Do not call this device an SPDM (single photon detector module), as this is too similar to SPDC (spontaneous parametric down-conversion). Absolutely do NOT call it an SPDC (single photon detection counter) or a SPDE (supreme physics department expense), regardless of how accurate these labels are.

Second of all: the FPGA *should* still have the code loaded onto it by the time you show up. (This wasn't the case for us, but hopefully it sticks around long enough for you folks.) You can verify this by supplying it with power. (The power cord is marked with yellow tape and labeled "FPGA" for your convenience. Yes, we messed this up before, but in my defense these cords all look so similar.) If it turns on and you see a bunch of red lights on switches telling which ones are flipped up or down, you're in good shape.
In any other case, my lab notebook should help out with that.

Third: wash your hands if you plan on touching the equipment. (In fact, you should probably wash the mirrors, lenses, and what have you before you try using them. That might have been our problem.)