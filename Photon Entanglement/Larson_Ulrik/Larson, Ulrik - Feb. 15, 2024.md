Good news is, we've gotten GitHub Desktop working. We now have a semi-streamlined way to beam our data back and forth to keep everything in sync.

The bad news: [[2-15-2024 Quartus-No-Work.png]]

The image name kind of says it all. Quartus II doesn't yet know how to handle the Cyclone-type device we're using. I'll look into solving this...

...I could not find a way with Quartus II. I'm installing the latest version of Quartus Prime, which really doesn't seem much more promising, but we'll see how it goes.

*The big question, as far as I can tell, is: "How can we demonstrate the existence of entanglement?"*

*Our little questions, then, would be a bit like:
"It looks like our FPGA isn't working right. Do we need to reupload the code?"
"How do we get the code from our computers to the Cyclone II FPGA if none of our programs are compatible with it anymore? Can we download the device compatibility files? Can we find an older version of Quartus to get this to work?"
"The Cyclone II FPGA should've come with a CD containing files we could use. Does UW-Stout still possess that CD, and if so does the library have a CD reader I can check out?"*

**Clearly, we suspect something is wrong with our FPGA and we believe it to be a software thing.**
The solution to this eludes me still.