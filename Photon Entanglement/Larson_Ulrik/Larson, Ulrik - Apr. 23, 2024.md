Looks like I missed a couple of entries. Most of it was spent trying (and failing) to get data.
...Aaaand now we've got a cardboard box we're punching holes into. Shit.
Okay-- before I get into some of the techniques we used to align our stuff, let me explain the cardboard box.
We got it because I said something that implied that light could leak in through the back of a fiber-optic cable's socket.
Here's a drawing.
[[Are we for real right now.png]]
I now believe this is totally ridiculous and we need to dispense with the box. It was a fine idea, but actually putting it in here is sucking up time we cannot really spare and is proving more of an inconvenience than a help.
See-- the box is huge. A lot bigger than what we need.
And punching holes into it takes time, and it's not really helping us sort our cables any better than the tags I've made out of yellow tape and a pen that refuses to work for two in every three letters I'm trying to write.
The box is being used to isolate light in what is already a closed system.
Fiber optic cables do not allow light to enter through the back of the connection ports. I refuse to believe it.
[[I can't believe we're doing this with a box.png]]
If that were true, we're doing the right thing here, saving our machine from our green flashlight.
I just don't think it could be.
Something else is the issue here and we are not going to find it in time if we keep up with this nonsense.

...

In other news, we've been realigning our equipment using a special technique called __Back-Alignment.__
# Back-Alignment

Certain optical components, such as lenses, half-waveplates, and BBO crystals, will produce a backwards reflection. (Mirrors and the like do not; they produce a reflection in a very different direction, in a very intentional manner.) Such optical components can usually be aligned with the aid of this backwards reflection.

[[Back Reflection.png]]
(The image depicts a mostly shut iris, plus a lens that is a bit lower than the beam. As a result, the back-reflection is bouncing upwards a bit.)

To do so, use an iris (or two) to constrict the beam to form a small point. (You have irises in your eyes. I'm not talking about those. Keep those FAR away from the laser beam.)
Then, take an index card and puncture a small hole in it -- a very wide needle, or a very thin screwdriver, will do wonderfully. (0.050 screwdriver is what I used; depending on what you're doing or how dim your laser is, you may want a larger or smaller hole.)

Place the index card in the path of the beam, behind the item you wish to back-align. Allow the beam to pass through the index card.
Assuming you have the device you're trying to align in a reasonably good spot (and the room is dim enough, and the device you're using reflects a small amount of light backwards rather than no light at all), you will see a small, extraneous light. If it reminds you a bit of a star, you're doing it right.

[[Back Reflection II.png]]
(As before, but an index card reveals the beam without any need for a smoke machine.)

Reminder to NOT, under ANY CIRCUMSTANCE, LOOK DIRECTLY AT THE BEAM.
I've almost done that a couple of times. Don't be stupid like me.
That's permanent eye damage.

In some cases, you will find two different reflections from a single optical device. You will want to align both of them by turning the lens left/right, tipping the lens up/down, raising/lowering the lens, or sliding the lens side/to/side.
https://www.youtube.com/watch?v=7w0SMQwrBzY
(This YouTube video explains what I'm talking about and more.)

In the case of the BBO crystal or a half-waveplate, the optical device's reflection does not come from a curved surface. Moving it horizontally or vertically without rotating it will not appreciably change where the back-reflection is aimed -- though moving it back-and-forth along the laser beam might cause some change, changing the optical device's rotation will be necessary.

# That time we might have gotten real counts

So...

...Yeah.

I believe it was 4/18/2023, but it may have been 4/16/2023 that this happened, but the closest we got to doing our experiment was when one of our detectors picked up on a few thousand photons. (I want to say it was 12,000 at its peak, but it might have just been 5,000.)

We got those good results, maybe, once.

The other detector only picked up 800 or 900, and we saw at most one coincidence.

My current hypothesis is that we're only picking up one beam coming from the BBO crystal. I believe downconversion is taking place, but we just can't prove it.

...

We've got some possibilities for where the problem here lies. I'll draw a picture:
[[find-the-issue.png]]
So we have, as possible problem components:
- blue laser (probably not faulty)
* an iris (only a problem if it's left at too constrictive a setting)
* a half waveplate (I don't think this is an issue?)
* a BBO crystal (I'm not seeing downconversion yet but I don't want to call this one broken)
* a beam block (definitely not the issue. It just absorbs the blue beam.)
* a receiver assembly containing a few components (pretty sure the problem is here somewhere):
	* alignment and angling (might be off)
	* positioning (might also be off)
	* touchy lens we have trouble focusing (probably the issue)
		* If the best way we have to tune the lens is to screw it or unscrew it until it wobbles, we might be cooked from the start, honestly
	* a band pass filter (which restricts the higher wavelengths from passing through. We tested if this was the issue, I think, and found it wasn't; both filters gave the same results.)
	* a socket to screw a fiber optic into (probs not the issue)
* a fiber optic cable (probably not the issue either)
* our SPCMs (i really hope this isn't where the problem is, pretty sure we tested these)
* our SPCM power cables (I haven't looked into this, but some of our power cables do look different...)
* cables from the SPCM to our voltage divider might have been plugged into the wrong port on the SPCM? (There are two ports on the SPCM. One of them is used to control the SPCM, I think. Somehow. I'd have to read the manual. ...The other one reports photon counts.)
* our voltage divider (this had better not be it)

As probable faulty components we should inspect and test later:
- BBO crystal (could be faulty, don't think we can really test it)
- Receiver alignment/positioning (definitely bad)
- One of our lenses (probably bad)
- Perhaps one of our receiver assemblies is shaped differently and needs some kind of special attention or replacement? (possibly bad?)
- SPCM-to-voltage-divider cable (check if they're plugged into the right port on the SPCM. The two ports are very different.)
- SPCM power cables (I don't know. We just haven't tested these.)

We're rapidly running out of time and we still don't have a lick of data.
It's kind of sad, honestly.