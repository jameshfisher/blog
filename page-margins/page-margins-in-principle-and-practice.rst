Imagine a book with no page margins.
The text runs right to the edge of the paper.
You'll have to crack the spine to gain access to characters in the gutter.
To access the text at the bottom, you have to move your thumbs our of the way.
If the book is a little old, the characters on the outside may be worn off entirely.
No header or footer is present, so navigation is a task.
To make a note on something you find, you'll have to write it between the lines.
We haven't even mentioned the fact that the book looks horrible,
or has forced the publisher through hoops to produce the book in full bleed.

The margin, then, is an essential element of all paged media.
It solves all the horrors above: spinal injuries are greatly reduced;
the closed book when dropped has its content protected by a chunk of wood;
you can hold it comfortably;
page numbers and section titles guide you around;
you have space for marginalian comments;
the composition is pleasing;
and 'printing on the edge' is technically difficult (you can't do this with your home printer).

----

So margins are a Good Thing.
In implementing them, though, we'll have to be more specific:
how big should the four margins (top, bottom, inside, outside) be,
given the size of the book?

This simple question doesn't have a simple answer.
The big reason for this is *competing rationales*:
for each design consideration there is a different optimum:

======================================  ====================================================================
Goal                                    Ideal margin appearance
======================================  ====================================================================
**Save the book's spine**               Give precedence to the inside margin, especially in fat books.
**Blank space for holding the book**    Precedence to the bottom and outside margins.
**Wear does not affect book content**   Precedence equally to all but the inside margin, which doesn't wear.
**Navigation is easy**                  Precedence to the top and bottom margins.
**Ample space for reader's notes**      Precedence to outside margin.
**Pleasing composition**                Printed area vertices lie on page "ley lines"; geometrical ratios.
**Don't require print bleed**           At least 5mm on all margins.
**Minimal paper use**                   Reduce all margins.
======================================  ====================================================================

So different goals are pushing in different, sometimes opposite, directions.
Some goals are independent of the page *area*; some are not.
Some are independent of page *ratio*, others not.
Some are dependent on book length.

----

Let's begin with the most complex of the design goals: **pleasing composition**.
Wikipedia calls these considerations the `canons of page construction <http://en.wikipedia.org/wiki/Canons_of_page_construction>`_.
The geometrical means of constructing an ideal page seem surprisingly long-standing and agreed upon.
Surprisingly, though, I couldn't find implemented algorithms online, so
over at github I'm hosting `a small library <http://github.com/eegg/vandegraaf>`_.

First to note is that some ratios are *better than others*.
These ratios should be applied both to the page and to the printable area.
The less ratios in the composition, the letter.
They are:

- 2 : 3
- 1 : *phi* (the *golden ratio)
- 1 : √2 (the ratio governing A3, A4, A5 paper, *etc.*)

Second to note is that the rectangle defining the printable area
should have vertices that lie on
what I would call "ley lines".
If you have a two-page spread in front of you,
these lines are those you can draw between five vertices:
the four corners of the book plus the top of the gutter.

A third principle, not always applied, is that
the *print width* should be the same as the *page height*.

A few different methods exist over at Wikipedia,
aiming for the above goals.
Most actually boil down to the same result:
the Van de Graaf canon is the most general,
of which two other methods obtain the same result
when the page ratio is 2 : 3.

I'll let you judge for yourself whether the results are pleasing.
These are outputs from my above script:



----

How do today's word processors implement page margins?
The first thing to note is that, by default, all pages are the same:
there's no such thing as left and right pages.
Considering that its output will most likely be unbound A4 from a home printer,
this makes sense.

Specifically, the following margins are set by default:

======================  ======  ========  ========  =======
Processor               Top     Bottom    Inside    Outside
======================  ======  ========  ========  =======
**Microsoft Word**      1"      1"        1.25"     1.25"
**OpenOffice Writer**   20mm    20mm      20mm      20mm
======================  ======  ========  ========  =======
