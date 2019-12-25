# Learning Vim 

## Introduction
I've started to learn Vim in November 2019, as part of a larger interest in the world of programming. For me, Learning Vim is first and foremost a personal journey, an expedition. As many users before me have pointed out, with Vim you can improve and optimize your personal workflow endlessly. There are new things to discover every single day and most of it will further enhance your life and work. This file documents this journey as I travelled through the vimtutor, Miki Tebeka's course on LinkedIn and the many (video) tutorials and other material that are to be found online. You will find my notes, discoveries, useful advice I've picked up along the way and above all a summary of my learning process.   
&nbsp;&nbsp;&nbsp;With this document I will keep track of my own learning and justify my personal choices. At the same time I hope it will provide insights, not instructions, for generations Vim learners to come. As it is a personal learning document I've subjected it to Git Version Control (shared on GitHub) so one can follow my learning history, revisit past versions of my cheat sheet and relive past clumsiness. Keeping track of personal learning through a version control system like Git should be a part of any academic program, but that is a whole other topic that I will save for somewhere else.   
&nbsp;&nbsp;&nbsp;The ideas and advice that are to be found in this document are of course anything but mine. It is impossible to do justice to all the contributors to my learning, because there are simply too many out there, also implicit. Wherever possible I do provide references to external sources, while trying to explain why that source of information or advice was so valuable to my learning. I have also included a section on valuable resources for information or tutorials on Vim and Vimscript.
&nbsp;&nbsp;&nbsp; A copy of my .vimrc file as well as other relevant documents are included in the same 'Learning Vim' repository on GitHub.

## First steps
### Muscle memory
Muscle memory is key to Vim. After completing the `vimtutor` multiple times, the first step, as recommended by many, was disabling the arrow keys in all three modes to enforce placing my fingers on the home row and moving around by `h, j, k, l` only. My arrow keys from now on echoed to the terminal window: "Do not use the arrow keys anymore, OK?!".
### Going mouseless
It is funny how muscle memory works. After enforcing myself to use `h, j, k, l`, very soon I started to notice annoyance while working in the browser or other applications where I couldn't use these motion keys. Luckily, there is a solution for it. There is this great extension for Chrome, called Vimium, and for my windows operating system there is a possibility to mimic Vim with AutoHotkey, which is worth finding out about more.
### Motion commands
Vim is truly amazing for moving through your document. First, I used `h, j, k, l` a lot, but soon I used bigger steps to move around, by adding a count, jumping forward or back by word `w, b`, by sentence `),(`, by paragraph `},{`, by half a page down/up `<c-D>, <c-U>` or by whole page `<c-F>,<c-B>`. In the current screen you move to cursor easily to high `H`, middle `M` or low `L` and if your linenumbers are enabled you can jump immediately to a line in command mode `:`. The biggest win for me was getting myself used to find a specific location directly through regular expressions, with `\` and `?`. 
### Leaving INSERT mode
In the beginning the idea of having different modes for working on files seems a little akward. But as soon as you get the hang of it, it is a real blessing. As LinkedIn Learning trainer Miki Tebeka pointed out, with Vim there is a clear divide between a creative phase, when you are in INSERT mode, and a more editing phase. For a perfectionist, who has the tendency to write and edit to perfection at the same time, this enforced divide will be a true life saver.   
&nbsp;&nbsp;&nbsp;The first thing I did to fully take advantage of this idea was creating a mapping to make it easier to exit INSERT mode. A lot of users recommend to use `jj` or `jk` for this purpose, I chose `,.`. The reason for this choice is that the comma is my `<leader>`, and with the dot it still creates a nice rolling motion. Semantically, the dot is also nice to have finishing your creative work.
&nbsp;&nbsp;&nbsp;Second, the very first autocommand I'd created, kicks me out of INSERT mode after 20 seconds of inactivity. Whenever I get distracted, I am sure to find myself in NORMAL mode first when I come back. Creating stronger visual cues in the status line (and beyond) was the last step I took to help me making optimal use of Vim's modal editing.

## My .vimrc settings
In my .vimrc (also shared on GitHub) I have three sections: general settings, my mappings and temporary settings. The first section is for setting general options. There my mapleader `,` is set, as well as some general behavior for tabs, mode switching and folding.
&nbsp;&nbsp;&nbsp;My mappings are to be found in the second section. Mappings for the functions keys are meant for programmatic behavior, like running code, the loading of filetype specific configurations or executing Git commands. `<leader>[0-9]` are reserved for more basic toggling options, like the netrw project folder, the quickfix window, spellcheck, wrapping, linebreaks and more.  
&nbsp;&nbsp;&nbsp;The idea behind the last section is to provide a space for learning and experimentation. These are temporary settings until accepted or discarded. 
      
## Vimscript
After learning the basics of using the editor I dived into learning Vimscript through the website: Learn Vimscript the Hard Way by Steve Losh (2013).

## Plugins

## References and resources
