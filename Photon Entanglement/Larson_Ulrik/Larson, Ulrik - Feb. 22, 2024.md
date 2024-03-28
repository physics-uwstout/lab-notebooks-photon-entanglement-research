Note: Turns out we weren't using the proper power cord. Our FPGA board is now a bit more alive, and the USB blaster is registered as something by our devices.
However, we're still stuck; the FPGA isn't running our code, despite an apparently successful attempt to upload via Quartus Prime.

...

We received a Linux computer that most likely runs on cuneiform tablets and dinosaur blood as a possible solution to our previous woes, as its installation dates back to Oct. 23, 2013.
However, without a password the best access we can achieve is a guest session, which isn't allowed to make lasting changes, or mount the 250GB memory device within the computer. We've transferred over the single-photon folder of mine, but a restart changed our guest session -- it is no longer accessible, if it still exists on that computer.
Zimmerman is sick, and returned home after getting us into our labs. I've sent an email requesting a password (and noting a preference for a root password), but no response. I'm sure he'll get back to me when he's feeling slightly better.
In the meantime, I attempted a few privilege escalation attacks that were described as working for Linux 12.04 -- which is what the CD or DVD found in the computer, from where I imagine the installation of Linux came from, said -- but to no avail.
Something more privileged than a guest session is probably required to mount an attack.

In any case, while the "web browser" in the taskbar is inert and does nothing when attempting to open it, using the "application finder" to open "Firefox" works as expected. The device does not have the ability to access WiFi, so an ethernet cord was run from the computer to another room with a working ethernet outlet to gain access to the internet.

Oh-- and I tried running a Linux installer for Quartus Prime on the machine. It didn't work, since that machine is 32-bit. I'll have to try something else later.
When we get that password.

...

Ah, I just had the most wonderful idea. Maybe we were just missing the USB-Blaster drivers? Let me see what device manager has to say about our equipment...
...Nope. Gizmo is recognized as an Altera USB-Blaster, with a driver provided by Altera for 8/16/2017 at version 2.12.28.0, with a digital signature by Intel Corporation.
Device is categorized as a Universal Serial Bus Controller by Device Manager, and is listed as an Altera USB-Blaster under this category, when <u>view</u>ing <u>devices by type</u>.

Everything should be in order when it comes to uploading, and yet it's still not running.

To summarize: we're a lot closer now than we've ever been, but there's still some more IT work to be done.

...

I'll see about returning the flash drive we borrowed for file transferal.