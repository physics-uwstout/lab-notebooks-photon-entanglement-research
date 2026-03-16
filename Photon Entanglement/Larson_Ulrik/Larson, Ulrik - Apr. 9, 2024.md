Well, we're finishing up the voltage divider. The end of the semester is getting closer and closer.

...Aaaand it's smoking. Great. Alright-- autopsy time.
So turns out, we miscounted and hooked pin 29 to ground instead of pin 30.
Pin 30 would have been a ground. Pin 29 is a 3.3V supply. Low voltage across extremely low resistance is very high current and a lot more power than the 12 and 29 wires are designed to carry. (Well, more than their insulation is designed to survive, anyways. The 12 wire still works fine; the 29 wire we decided to cut.) Thankfully we didn't have any SPCMs plugged in, so the only thing we lost was our clean aesthetic, the luxury of clean air in our lab space for an hour or so, a resistor, and some time spent fixing it and cleaning the black char powder from inside the voltage divider.

Had we plugged the SPCM in, we'd maybe get our names mentioned the next time the physics department's budget is being discussed. I could pawn my everlasting soul off to the devil and maybe cover two of them if he felt generous. Those things cost an arm and a leg *each.*

After some fixing and cleaning, though, everything on the voltage divider works perfectly now. It just has some character to it now.
We established that one of our SPCMs registers 500 photons per second or so when the black rubber cap is placed over its receptacle, and that it works in the A, A', B, and B' ports of the voltage divider -- another SPCM gave similar results in the B' port, so we can establish that at least two of our SPCMs are functional.

So-- let's walk through our setup at the moment, and our progress to getting data:
- The FPGA is working perfectly now. We have what I believe to be a reproducible way to load the programs onto the FPGA, documented within my lab notebook. This will not be a (huge) problem for other lab groups, provided our process still works. (Maybe to be safe I should leave an installation of Quartus Prime on a flash drive? I don't know. I wonder how charitable I'm feeling come the end of the semester.)
- The SPCMs are functioning perfectly and haven't been destroyed yet.
- At least one of our fiber optic cables and two of our photon receptacles are functioning perfectly, which we've tested with our red laser, two mirrors, and possibly also a lens somewhere in there.
- The Python code is running on Seth's computer only. ...I don't know why, but we somehow got it working there and we can't get it working anywhere else. ...Problem for another day.
- We are currently aligning and placing elements to test our down-conversion crystal and run our first experiment.

As I understand it, our experiments are going to be as follows (given via simplified drawings)
[[Larson_Ulrik/Images/Experiment #1 Plan.png]]
First, we will simply demonstrate that our equipment works as intended and that we are picking up both photons in each produced entangled pair.

A violet laser --> down-conversion crystal --> beam 1 --> photon detector A
... --> ... --> beam 2 --> photon detector B

If coincidences are counted very frequently between A and B in this case, our equipment works. Otherwise, we have a problem -- perhaps a timing issue of some kind.


[[Larson_Ulrik/Images/Experiment #2 Plan.png]]
Our second experiment will demonstrate the indivisibility of photons -- that is, without reducing their energy, they cannot be split in half, such as by a half-silvered mirror.

A violet laser --> down-conversion crystal --> beam 1 --> half-silvered mirror --> photon detector A
... --> ... --> beam 1 --> ... --> photon detector A'
... --> ... --> beam 2 --> photon detector B

Coincidences will be registered by B and A', and by B and A, but B and A and A' cannot all activate at once. (We already know from the first experiment that if B activates, A or A' should be in a coincidence with it, so we can possibly look at extraneous coincidences of A and A' without B to carve out any noise we encounter...?)



[[Larson_Ulrik/Images/Experiment #3 Plan.png]]
Our third experiment will demonstrate the entanglement of the photons.
By trying to split both of the post-split beams using half-silvered mirrors that are oriented in the same way, we will end up with correlations between A and B, A' and B, A' and B', and A and B'.
An entanglement-free explanation would suggest all of those coincidences would have the same probability.
However, our photons are very entangled -- if one is polarized vertically, say, then the other one must be polarized horizontally.
Depending on polarization, they interact with partially silvered mirrors differently.
Provided our mirrors are oriented properly, I predict we will find a disproportionate number of coincidences between detectors that suggest one photon bounced off of the mirror and the other passed through.

That last hypothesis is what we aim to prove with this project.