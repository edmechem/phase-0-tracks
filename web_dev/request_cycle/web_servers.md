###2. What are some of the key design philosophies of the Linux operating system?

[Linux](https://en.wikipedia.org/wiki/Linux), being based on [Unix](https://en.wikipedia.org/wiki/Unix), follows the Unix philosophy. One of the main tenets of the Unix [philosophy](http://www.faqs.org/docs/artu/ch01s06.html) is:
>"Make each program do one thing well. To do a new job, build afresh rather than complicate old programs by adding new features."


I did find an apparently very old [article](http://www.eg.bucknell.edu/~whutchis/linux_install/node22.html) about Linux - written, most likely, from way back in the day. For example:
>"With Linux, you can throw out the entire concept of organized development, source control systems, structured bug reporting, or statistical analysis. Linux is, and more than likely always will be, a hacker's operating system."

This is laughably out-of-date in today's world of multiple professionally-maintained & packaged distros, such as the very user-friendly [Ubuntu for desktops](http://www.ubuntu.com/desktop).

The main thing that distinguishes Linux from earlier/other variants of Unix, is that it's [open-source](https://en.wikipedia.org/wiki/Open-source_software#Widely_used_open-source_software). Because all the source-code is peer-reviewable, Linux actually has [far fewer bugs](https://en.wikipedia.org/wiki/Open-source_software#Closed_source_.2F_proprietary_software) per 1000 lines of code, than most proprietery closed source software.

Notably, the International Space Station [switched from Windows to Linux](http://www.telegraph.co.uk/technology/news/10049444/International-Space-Station-to-boldly-go-with-Linux-over-Windows.html), to improve stability & reliability.


###3. In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?

A **VPS** is a service you can purchase, and run on the internet, which is effectively, your own internet-connected server machine. You can make copies of it, try out weird things, mess things up, revert to a previous snapshot - it's very flexible. And quite cheap, at about $0.03 / hour (more or less, for more or less power) paying only for the length of time it's running. Thus it's an ideal way to experiment with things without having to worry about messing up one's own primary workstation.


###4. Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?

The root user has full power to modify system files, kill processes, delete the whole drive! Etc. If a malicious user or script gained access to the root login credentials, **game over**. So... it's far safer - safer from malicious users, or our own clumsy typing mistakes - to be logged in as some normal user account, not the root account.