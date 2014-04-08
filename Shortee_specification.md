# Shortee Specification

*Shortee* is a simple syntax for logging events,
you can see it in action over at http://firework.com

If you wish to parse Shortee messages for your application using ruby then you can use the Shortee gem at https://github.com/JeremyNevill/shortee

A javascript parser is in the making at https://github.com/JeremyNevill/shortee.js

If runnerboy had just run 3 miles then a shortee message for that could be:

    @runnerboy ran 5miles 01/jan/2012

The design aims for the Shortee syntax are: 

* *Readable* by a human
* *Parseable* by a computer
* *Memorable* by it's simplicity 
* *Concise* enough to work everywhere (email, sms, twitter, on a postit)
* *Fast* enough to create on a mobile device one handed


## Examples

Shortee was bourne out of my need to record stuff on the go that I would later want to recall and review.

This could include my business mileage, what my dog had eaten, when I had paid tax etc.

For example, to record that you have driven 200 miles on New Year's Day 2012:

    @JeremyNevill drove 100miles 01/jan/2012

Or if you have just paid your road tax:

    @JeremyNevill paidcartax 249ukp 03/sep/2010

Or fed the dog:

    @master fed @fido 1bowl 01/oct/2012

Or if you website has registered had a new user:

    @shortee.org newuser 05/nov/2012


## Syntax

The original condensed syntax is as follows:

    @mainactor action 999units dd/mmm/yyyy

    e.g. @JeremyNevill coded 50lines 26/oct/2012
    
### Where...

#### @mainactor
is the main actor of the shortee message, usually a person or a system.  
e.g. @fredflintstone, @hyperlite - as we are using the Twitter convention for referring to the main actor you can take advantage of this also linking to your Twitter identity.

#### action
is for logging a verb in past tense. e.g. coded.   
You are at liberty to invent any action, using your own language, poor spelling or combinations, it's your message after all.
Note: If you wish to create a message showing intent to do something use a future tense e.g. needstobuy


#### 999
is the number of things you have acted on. e.g. 100


#### units
is the units that go with the number of things to log.  e.g. lines


#### dd/mmm/yyy
is the date that you wish to store the action as occuring.


### Extending

This syntax is expected to be expanded upon.  
Feel free to fork, modify for your own use and get in touch if you want to add something new using a pull request.

## Software

As shortee is a technology independent syntax your free to use it with anything that can store a string, see the list of systems
you can use to store messages below.  As you will notice the @user string is insipired by the way twitter users reference each
other, if you use your twitter id for the actor field you can tie your messages to your online id.

### Email Friendly

I use shortee comprehensively with my email account..  I email myself a shortee message using the subject field.  
To recall and view my messages I simply search for what I want... e.g. every shortee message involving me is a search for '@JeremyNevill'

### Storing Messages

* Any system that can record a single string should be able to store a Shortee message:
  * Email (inlcuding gmail, hotmail, outlook, etc)
  * SMS
  * Twitter
  * Notepad
  * iMessage
  * Postit notes or other bits of paper

### Searching Messages

Searching for messages are easy in most applications that can store them.

For example if you store your shortee messages in gmail, you could search for all your messages with '@JeremyNevill drove' in them.

### Shortee App?

An online home for your Shortees has recently been launched and is located at http://firework.com  , this site allows the storing, browsing and searching of
Shortee messages in a mobile and desktop friendly way.

Remember you can store your Shortees wherever you can store a line of text, e.g. in email, on twitter, as a Facebook update etc so you don't need a Shortee specific app for your messages.

## Common Uses

As shortee allows you to invent your own actors and actions you can create a way to log almost anything, 
from geeky authentication system stuff to real world coffee drinking habits... here are some common uses:

* Logging things that you need to recall in the future - e.g. your business mileage over a month
* Reviewing things that you have done - e.g. when were my last three runs?
* Extracting trends on things that you have done - e.g. has the dog got his appetite back?
* Logging actions a system has done - e.g. how many people registered on the website today?

## License

Copyright (c) 2012-2014, Jeremy Nevill
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
  * Neither the name of the Shortee nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL JEREMY NEVILL BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.





