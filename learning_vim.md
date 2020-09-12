# Learning Vim 

## Introduction
I've started to learn Vim in November 2019, as part of a larger interest in the world of programming. Learning Vim is first and foremost a personal journey, an expedition. As many users before me have pointed out, with Vim you can improve and optimize your personal workflow endlessly. There are new things to discover every day that will further enhance your personal life and work. This file will document on this journey.

I will keep track of my own learning and comment on my personal choices. At the same time I hope it will provide insights, not instructions, for generations Vim learners to come. It is a personal learning document, subjected to Git version control.
 
A copy of my .vimrc file as well as other relevant documents are included in the same 'learning Vim' repository on GitHub.

## First steps

### Muscle memory
Muscle memory is key to Vim. After completing the `vimtutor` multiple times, the first step, as recommended by many, was disabling the arrow keys in all three modes and moving around by `h, j, k, l`, i.e. the 'home row', only. My arrow keys now echoed to the terminal window: "Do not use the arrow keys anymore, OK?!". After getting used to not using the arrow keys anymore, I could choose other functions for the arrow keys. In Normal mode, I now use the arrow keys to switch between buffers, while in Insert mode I am using them for keyword completion.  

### Going mouseless
It is funny how muscle memory works. After enforcing myself to use `h, j, k, l` only, very soon I started to notice annoyance while working in the browser or other applications where I couldn't use these motion keys. Luckily, there is a solution for it. There is the great Chrome extension, called Vimium, to help me going mouseless also while browsing the internet. In the future I am hoping to go mouseless entirely.

### Motion commands
Vim is truly amazing for moving through your document. First, I used `h, j, k, l` a lot, but soon I used bigger steps to move around, by adding a count, jumping forward or back by word `w, b`, by sentence `),(`, by paragraph `},{`, by half a page down/up `<c-D>, <c-U>` or by whole page `<c-F>,<c-B>`. In the current screen you move to cursor easily to high `H`, middle `M` or low `L` and if your linenumbers are enabled you can jump immediately to a line in command mode `:`. The biggest win for me was getting myself used to find a specific location directly with regular expressions, `\` and `?`. 

### Different modes
In the beginning the idea of having different modes for working on files seems a little akward. But as soon as you get the hang of it, it is a real blessing. As LinkedIn Learning trainer Miki Tebeka pointed out, with Vim there is a clear divide between a creative phase, when you are in INSERT mode, and an editing phase. For a perfectionist like, who has the tendency to write and edit to perfection at the same time, this divide will be a true life saver.   

The first thing I did to fully take advantage of this idea was creating a mapping to make it easier to exit INSERT mode. A lot of users recommend to use `jj` or `jk` for this purpose, I chose `,.`. The reason for this choice is that the comma is my `<leader>`, and with the dot it still creates this nice rolling motion. Semantically, the dot is also nice to have finishing your 'creative work'.

Second, the very first autocommand I'd created, kicks me out of INSERT mode after 20 seconds of inactivity. Whenever I get distracted, I am sure to find myself in NORMAL mode first when I come back. 

Creating stronger visual cues in the status line (and beyond) was the last step I took to help me making optimal use of Vim's modal editing.

## My .vimrc settings
In my .vimrc (also shared on GitHub) I have three sections: general settings, mappings and temporary settings. The first section is for general options. There, my mapleader `,` is set, as well as some general behavior for tabs, mode switching and folding.

My mappings are to be found in the second section. Mappings for the functions keys are meant for programmatic behavior, like running code, the loading of specific configurations or executing Git commands. 

`<leader>[0-9]` are reserved for more basic toggling options, like the netrw project folder, the quickfix window, spellcheck, wrapping, linebreaks and more.  

The idea behind the temporary section is to provide a space for learning and experimentation. These are temporary settings until accepted as worthwhile or discarded. 

## Semantics
One of the best feature of Vim, comparing to other editors, is its use of logical semantics for keyboard shortcuts. Learning Vim is learning 'to talk Vim', like `viw` as 'visual inside word' or `gt(` as 'go till ('. And because of its different modes, you can just use the letters, like `u` for undo in Normal mode, so no annoying key combinations like in other editors.    
      
## Vimscript
After learning the basics of using the editor I dived into learning Vimscript through the website: Learn Vimscript the Hard Way by Steve Losh (2013). With this tutorial, I've created my first plugin for working with code Snippets in Vim. This repository will become public soon. 

## Plugins
As of now, I am using Tim Pope's [Pathogen](https://github.com/tpope/vim-pathogen) for managing my (future) plugins.   

