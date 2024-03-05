
End-of-day summary:
- A viable but inferior alternative to an FPGA may be possible to obtain. (Oscilloscope; tune for 10ns pulses of 2.2V magnitude)
- FPGA has yet to behave to our satisfaction, but I haven't proven it is broken or unusable.
- A 64-bit Linux machine has been obtained and has opened Quartus Prime Lite. Whether or not the proper drivers for the serial adapter or the Altera blaster are installed is currently unknown, but the Linux machine has identified both devices.
- Should a way to attenuate the laser be necessary, a neutral density filter is recommended.
- A method of controlling ambient light is currently pending, though we still possess a curtain. ...I think? (I'm writing this after I locked the door to the lab behind me, so I can't check.)

*Ryan has been absent for a long while now, but he doesn't seem to have dropped the course. If I messaged him over Teams, he'd probably get back to me.*
*That said, I know the importance of rest during illness. In the case of Covid, it can help reduce the risk of Covid-induced strokes in otherwise healthy individuals. (Or maybe rest helps reduce the risk of long Covid according to anecdotal evidence, and Tylenol reduces the risk of brain damage? I don't remember; I read about it a while ago and my memory is fuzzy now.)*
*They didn't specify Covid, of course, but rest is good for any illness and increases long-term health outcomes.*
*Regardless, we may soon desire Ryan's assistance.*

I'm missing a couple lab book entries, you may have noticed.
I assure you, not much important has happened during that time.
You are hardly missing anything but the dead ends along the way.

It's been a lot of "thing no work, what do?" on my end. Our 32-bit Linux machine can't handle any still-available version of Quartus. (Sinkovits did drop by to pass us a computer. It looks to be 64-bit Linux, and I've installed Quartus Prime.)

I'm pretty certain the FPGA is kaput, so let me outline the plan I've devised. It's a bit rough around the edges since I haven't yet read the manual for the single-photon detectors, but here it is:
[[Going Without the FPGA.png]]

That image should explain all of it.
...In case you do not possess the image anymore when reading this notebook or it got lost somehow, it depicts an idea for an experimental setup without an FPGA.
The reason we are using an FPGA is for its high-speed computation and data collection. This is because the experiment we are performing is extremely fast and requires nanosecond precision.
However, if it could be slowed down, any computer could be made to work if it can accept data input from the Excelitas Technologies Photon Counting Modules (SPCM-EDU-CD3375H) and it can process it with respect to time.

With the FPGA, the laser's output is sufficiently reduced by the downconversion crystal -- or something. The downconverted beams hit the detectors, the detections are quickly registered by the FPGA, and then they are read by the Python code.

Without the FPGA, something needs to dim our laser before it reaches the downconversion crystal. Anything that doesn't seriously alter the properties of the "surviving" laser light should work, so something like food coloring, purified water, and a square glass vessel - plus a pinhole to prevent diffused light from reaching the detectors - might be good enough, but in the image I have two sheets of dark glass.
This will reduce the number of photons that reach the downconversion crystal, and thus how many photons will reach the detectors.
With a sufficient reduction of light, it will then be possible to determine whether a coincidence of detections occurs with even the slowest hardware.

...

We got on a Teams call with Grayson, someone who'd worked on this project before and who is currently off in grad school. Nice fellow.
He's helping us out with the FPGA a bit, but it's likely our problem is something he hasn't dealt with before. (Perhaps a software/driver issue?)
...The display on our FPGA shows black blocks instead of letters, but Grayson assures us that's normal. Seth's notebook has more on the matter of what's wrong and what isn't.

Grayson suggested that hooking the photon counters to a computer directly would be challenging or impossible, and that an oscilloscope should be used as an intermediary. Data sheets suggest that our photon counters, upon registering a detection, fire a 2.2V pulse 10ns long. An oscilloscope could hypothetically be obtained from the electrical engineering fellows, if I can talk my way in there somehow, and that could be used to beam the data to a computer.

Grayson also suggested that we *not* attenuate our data with a glass of colored water (or with anything, really), but that if we must weaken our laser we should use something called a neutral density filter -- essentially just dark glass with extra quality control and a spec sheet. More data is almost always better data -- and as long as we use error bars and take control measurements and the like, we should be able to tell how many false detections are made from things like ambient light that makes it into the room.

This seems doable, for the first time in a while.