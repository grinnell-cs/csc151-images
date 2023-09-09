---
title: Transforming colors
summary: |
  We examine the building blocks of one of the common kinds of algorithms used for RGB colors: Generating new colors from existing colors.
---

<!-- 
  TODO: Students don't "get" that they can write their own transformation
  procedures.  We should add that here and in the lab.

  (Added.  However, the original design of this was that they could
  use this before they learned about writing procedures.)
 -->

Introduction
------------

We have just started to learn about RGB colors, and so the operations we might do on images and colors are somewhat basic.  How will we expand what we can do, and what we can write?  In part, we will learn new Scheme techniques, applicable not just to image computation, but to any computation.  In part, we will learn new functions in the MediaScript library that support more complex image computations.  In part, we will write our own more complex functions.

For now, we will focus on transforming color images.  One common algorithmic approach to images is the construction of <emphasis>filters</emphasis>, algorithms that systematically convert one image to another image.  Complex filters can do a wide variety of things to an image, from making it look like the work of an impressionist painter to making it look like the image has been painted onto a sphere.  However, it is possible to write simple filters with not much more Scheme than you know already.

In readings and labs, we will consider filters that are constructed by transforming each color in an image using an algorithm that converts one RGB color to another.  You might think about these as you compute the 

  url="../labs/raster-lab.html">the first RGB lab</ulink>, you began to
  think about such algorithms as you computed the pseudo-complement of
  an RGB color or varied the components of the color.  In this reading
  and the corresponding lab, we will consider the basic building blocks
  of filters: MediaScript's basic operations for transforming colors
  and the ways to combine them into more complex color transformations.
  In the lab, you will also explore how to write your own transformations.
  In the next reading, we will see how to use those transformations
  to transform whole images.  After that, we'll explore how you write
  new transformations.
</para>

</section> <!-- id="transform-rgb-intro" -->

<section id="basic-transformations"><title>Some Basic Transformations</title>

<para>
  Rather than writing every transformation from scratch, we will start
  with a few basic transformations that MediaScript includes.  
</para>

<section id="lighter-darker"><title>Making Colors Lighter and Darker</title>

<para>
  The simplest transformations are <function>irgb-darker</function>
  and <function>irgb-lighter</function>.  These operations make a color
  a little bit darker and a little bit lighter.  If you apply them
  repeatedly, you can darker and darker (or lighter and lighter) colors,
  eventually reaching black (or white).
</para>

<screen>
<prompt>&gt;</prompt> <userinput>(define sample (color-name-&gt;irgb "blueviolet"))</userinput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string sample)</userinput>
<computeroutput>"138/43/226"</computeroutput>
<prompt>&gt;</prompt> <userinput>(define darker-sample (irgb-darker sample))</userinput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string darker-sample)</userinput>
<computeroutput>"122/27/210"</computeroutput>
<prompt>&gt;</prompt> <userinput>(define lighter-sample (irgb-lighter sample))</userinput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string lighter-sample)</userinput>
<computeroutput>"154/59/242"</computeroutput>
<prompt>&gt;</prompt> <userinput>(define doubly-darker-sample (irgb-darker (irgb-darker sample)))</userinput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string doubly-darker-sample)</userinput>
<computeroutput>"106/11/194"</computeroutput>
</screen>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-sample.png" format="PNG"/>
  <code>sample</code>
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-darker-sample.png" format="PNG"/>
  <code>sample, darker-sample</code>
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-lighter-sample.png" format="PNG"/>
  <code>sample, lighter-sample</code>
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-doubly-darker-sample.png" format="PNG"/>
  <code>sample, doubly-darker-sample</code>
</para>

<para>
  Note that these are <emphasis>pure</emphasis>  procedures.  When you compute
  a darker or lighter version of a color, the purpose is to create a new
  color.  Hence, the original color is unchanged.
</para>

</section> <!-- id="lighter-darker" -->

<section id="transforming-components"><title>Transforming Components</title>

<para>
  In addition to making the color uniformly darker or lighter, we can also
  increase individual components using <function>irgb-redder</function>, 
  <function>irgb-greener</function>, and <function>irgb-bluer</function>.
</para>

<screen>
<prompt>&gt;</prompt> <userinput>(define sample (color-name-&gt;irgb "blueviolet"))</userinput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string sample)</userinput>
<computeroutput>"138/43/226"</computeroutput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string (irgb-redder sample))</userinput>
<computeroutput>"170/43/226"</computeroutput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string (irgb-greener sample))</userinput>
<computeroutput>"138/75/226"</computeroutput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string (irgb-bluer sample))</userinput>
<computeroutput>"138/43/255"</computeroutput>
</screen>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-redder-sample.png" format="PNG"/>
  <code>sample, (irgb-redder sample)</code>
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-greener-sample.png" format="PNG"/>
  <code>sample, (irgb-greener sample)</code>
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-bluer-sample.png" format="PNG"/>
  <code>sample, (irgb-bluer sample)</code>
</para>

<para>
  As the examples suggest, for some people, making a color slightly redder,
  greener, or bluer is hard to detect.  Sometimes it's easier to see the
  changes if we make the transformations a few times.  (Since the first
  call to <function>irgb-bluer</function> increases the blue component to
  its largest value, we won't see further increases.)
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-doubly-redder-sample.png" format="PNG"/>
  <code>sample, (irgb-redder (irgb-redder sample))</code>
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-doubly-greener-sample.png" format="PNG"/>
  <code>sample, (irgb-greener (irgb-greener sample))</code>
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-doubly-bluer-sample.png" format="PNG"/>
  <code>sample, (irgb-bluer (irgb-bluer sample))</code>
</para>

</section> <!-- id="transforming-components" -->

<section id="misc"><title>Other Simple Transformations</title>

<para>
  The <function>irgb-rotate</function> procedure rotates the red, green, 
  and blue components of a color, setting red to green, green to blue,
  and blue to red.  It is intended mostly for fun, but it can also
  help us think about the use of these components.
</para>

<para>
  The <function>irgb-phaseshift</function> procedure is another procedure
  with less clear uses.  It adds 128 to each component with a value
  less than 128 and subtracts 128 from each component with a value
  of 128 or more.  While this is somewhat like the computation of a
  pseudo-complement, it also differs in some ways.  Hence, MediaScript also
  provides an <function>irgb-complement</function> procedure that computes
  the pseudo-complement of an RGB color.
</para>

<screen>
<prompt>&gt;</prompt> <userinput>(define sample (color-name-&gt;irgb "blueviolet"))</userinput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string sample)</userinput>
<computeroutput>"138/43/226"</computeroutput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string (irgb-rotate sample))</userinput>
<computeroutput>"43/226/138"</computeroutput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string (irgb-phaseshift sample))</userinput>
<computeroutput>"10/171/98"</computeroutput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string (irgb-complement sample))</userinput>
<computeroutput>"117/212/29"</computeroutput>
</screen>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-rotate-sample.png" format="PNG"/>
  <code>sample, (irgb-rotate sample)</code>
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-phaseshift-sample.png" format="PNG"/>
  <code>sample, (irgb-phaseshift sample)</code>
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-complement-sample.png" format="PNG"/>
  <code>sample, (irgb-complement sample)</code>
</para>

</section> <!-- id="misc" -->

</section> <!-- id="basic-transformations" -->

<section id="colors-to-pixels"><title>From Transforming Colors to Transforming Pixels</title>

<para>
  Now that we know some basic transformations to apply to colors, we
  can use those transformations in a variety of ways.  First, we can
  use it to change one pixel in an image.  How?  We get the color of the
  pixel, transform it, and then set the color of the pixel.  For example,
  here's how we might phase shift the top-left pixel in the image called
  <code>landscape</code>.  
</para>

<screen>
<prompt>&gt;</prompt> <userinput>(image-set-pixel! landscape 0 0 
                    (irgb-phaseshift (image-get-pixel landscape 0 0)))</userinput> 
</screen>

<para>
  What if we instead wanted to make pixel at (2,3) a bit redder?  We'd write
  something like the following.
</para>

<screen>
<prompt>&gt;</prompt> <userinput>(image-set-pixel! landscape 2 3 
                    (irgb-redder (image-get-pixel landscape 2 3)))</userinput>
</screen>

<para>
  How about if we wanted to darken the top-left pixel of a different image,
  one called <code>portrait</code>?  The instruction would be much the same.
</para>

<screen>
<prompt>&gt;</prompt> <userinput>(image-set-pixel! portrait 0 0 
                    (irgb-darker (image-get-pixel portrait 0 0)))</userinput>
</screen>

<para>
  As we just noted, each of these examples is quite similar.  The examples
  differ in the image, the position, and the transformation,
  but the rest of the code is the same.  (For example, we
  need to call both <function>image-set-pixel!</function> and
  <function>image-get-pixel</function> in the same way.)  We also see
  ourselves duplicating a lot.  In each case, we need to write the name
  of the image twice and the position twice.  As you might guess, having
  to repeat the same information again and again often leads to errors.
</para>

<para>
  When computer programmers realize that they are writing nearly
  identical expressions again and again and again, they tend to write
  new functions that encapsulate the common portions.  Many call
  this process <emphasis>refactoring</emphasis>.  The designers
  of MediaScript certainly expected people to change pixels, and did
  so themselves.  To help programmers, they refactored the code
  and devised a more concise way to change a pixel, which they
  called <code>(<function>image-transform-pixel!</function>
  <parameter>image</parameter>
  <parameter>column</parameter> <parameter>row</parameter>
  <parameter>transformation</parameter>)</code>.  Hence, to do the same
  three operations given above, using <function>image-transform-pixel!</function>,
  we would write the following.
</para>

<screen>
<prompt>&gt;</prompt> <userinput>(image-transform-pixel! landscape 0 0 irgb-phaseshift)</userinput>
<prompt>&gt;</prompt> <userinput>(image-transform-pixel! landscape 2 3 irgb-redder)</userinput>
<prompt>&gt;</prompt> <userinput>(image-transform-pixel! portrait 0 0 irgb-darker)</userinput>
</screen>

<para>
  This code is certainly a bit more concise, and perhaps even easier to
  understand.  However, behind the scenes, it does exactly the same thing
  that the previous code.  How is <function>image-transform-pixel!</function>
  implemented?  Let's look at the code from the MediaScript library.
</para>

<programlisting>
<xi:include href="../procs/image-transform-pixel!.scm" parse="text" xmlns:xi="http://www.w3.org/2001/XInclude"
/></programlisting>

<para>
  Is there anything surprising about the
  <function>image-transform-pixel!</function> procedure?  We hope
  you won't find it surprising, but some of you who have programmed
  before may note something a bit puzzling - We've made one procedure
  (<function>irgb-phaseshift</function>, <function>irgb-redder</function>,
  or <function>irgb-darker</function>) a parameter to another procedure
  (<function>image-transform-pixel!</function>).  Not all programming
  languages permit you to make procedures parameters, but those that do
  can help you write more clearly and concisely, as in this example.
</para>

<para>
  <emphasis>Using procedures as parameters adds a slight complexity
  to the language.  When you want to call a procedure directly, you
  need to precede it with an open parenthesis.  However, when you want
  to pass it as a parameter to another procedure, you do not 
  precede it with a parenthesis.</emphasis>
</para>

</section> <!-- id="colors-to-pixels" -->

<section id="pixels-to-images"><title>From Transforming Pixels to Transforming Images</title>

<para>
  If you think back to the beginning of this reading, you may recall that we
  suggested that one reason to learn to transform colors is that by transforming
  colors, you can also build filters.  Do we have enough information to write
  a filter for a four-by-three image?  Certainly.  Suppose we wanted to compute
  the complement of this image.  We could write a sequence of calls to
  the <function>image-transform-pixel!</function> procedure.
</para>

<screen>
(image-transform-pixel! canvas 0 0 irgb-complement)
(image-transform-pixel! canvas 0 1 irgb-complement)
(image-transform-pixel! canvas 0 2 irgb-complement)
(image-transform-pixel! canvas 0 3 irgb-complement)
(image-transform-pixel! canvas 1 0 irgb-complement)
(image-transform-pixel! canvas 1 1 irgb-complement)
(image-transform-pixel! canvas 1 2 irgb-complement)
(image-transform-pixel! canvas 1 3 irgb-complement)
(image-transform-pixel! canvas 2 0 irgb-complement)
(image-transform-pixel! canvas 2 1 irgb-complement)
(image-transform-pixel! canvas 2 2 irgb-complement)
(image-transform-pixel! canvas 2 3 irgb-complement)
</screen>

<para>
  That's certainly an awful lot of typing, even for a small image.
  <!-- We could probably find a more concise way of writing the
  same commands using <function>map</function>, but that would
  still require us to create a list of positions.  --> In <ulink
  url="../readings/transforming-images-reading.html">the next
  reading</ulink>, we'll consider some disadvantages of this technique
  and learn how to get MediaScript to automatically figure out all 
  of the calls for an image.
</para>

</section> <!-- id="pixels-to-images" -->

<section id="writing-transformations"><title>Writing Your Own Color Transformations</title>

<para>
  At the beginning of this reading, you learned a few basic procedures for
  transforming colors.  Are these the only ways that you can transform
  colors?  <emphasis>Certainly not!</emphasis>  You are free to write your
  own color transformations.  For example, you might decide that
  <function>irgb-greener</function> does not make colors sufficiently
  greener, since it only affects the green component.  (Arguably, to make
  something look greener, we might not only increase the green component,
  but also decrease the red and blue components.)  Hence, you could write
  your own version as follows:
</para>

<programlisting>
<xi:include href="../procs/greener.scm" parse="text" xmlns:xi="http://www.w3.org/2001/XInclude"
/></programlisting>

<screen>
<prompt>&gt;</prompt> <userinput>(define sample (color-name-&gt;irgb "blueviolet"))</userinput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string sample)</userinput>
<computeroutput>"138/43/226"</computeroutput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string (greener sample))</userinput>
<computeroutput>"106/107/194"</computeroutput>
</screen>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-my-greener-sample.png" format="PNG"/>
  <code>sample, (greener sample)</code>
</para>

<para>
  Of course, this is not the only way to define a procedure like
  <function>greener</function>.  We could also define it in terms
  of the existing procedures.  For example, since 
  <function>irgb-greener</function> seems to increment the green
  component by 32 and <function>irgb-darker</function> seems to
  decrement all three components by 16, we could try something like
</para>

<programlisting>
<xi:include href="../procs/greener2.rkt" parse="text" xmlns:xi="http://www.w3.org/2001/XInclude"
/></programlisting>

<screen>
<prompt>&gt;</prompt> <userinput>(define sample (color-name-&gt;irgb "blueviolet"))</userinput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string sample)</userinput>
<computeroutput>"138/43/226"</computeroutput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string (greener2 sample))</userinput>
<computeroutput>"106/107/194"</computeroutput>
</screen>

<para>
  There are also color transformations you cannot build (at least not
  easily) from the basic transformation.  For example, suppose you
  want to eliminate extreme colors.  You might choose to bound each
  component so that it is at least 64 and no more than 192.  If we
  rely on the <function>bound</function> procedure from <ulink
  url="../labs/procedures-lab.html">the lab on writing
  procedures</ulink>, we can write something like
</para>

<programlisting>
<xi:include href="../procs/irgb-bound.scm" parse="text" xmlns:xi="http://www.w3.org/2001/XInclude"
/></programlisting>

<screen>
<prompt>&gt;</prompt> <userinput>(define sample (color-name-&gt;irgb "blueviolet"))</userinput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string sample)</userinput>
<computeroutput>"138/43/226"</computeroutput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string (irgb-bound sample))</userinput>
<computeroutput>"138/64/192"</computeroutput>
<prompt>&gt;</prompt> <userinput>(define black (color-name-&gt;irgb "black"))</userinput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string black)</userinput>
<computeroutput>"0/0/0"</computeroutput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string (irgb-bound black))</userinput>
<computeroutput>"64/64/64"</computeroutput>
<prompt>&gt;</prompt> <userinput>(context-list-colors "smoke")</userinput>
<computeroutput>("whitesmoke")</computeroutput>
<prompt>&gt;</prompt> <userinput>(define smoke (color-name-&gt;irgb "whitesmoke"))</userinput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string smoke)</userinput>
<computeroutput>"245/245/245"</computeroutput>
<prompt>&gt;</prompt> <userinput>(irgb-&gt;string (irgb-bound smoke))</userinput>
<computeroutput>"192/192/192"</computeroutput>
</screen>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-bound-sample.png" format="PNG"/>
  <code>sample, (irgb-bound sample)</code>
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-bound-black.png" format="PNG"/>
  <code>black, (irgb-bound black)</code>
</para>

<para>
  <imagedata fileref="../images/transforming-rgb/swatch-bound-smoke.png" format="PNG"/>
  <code>smoke, (irgb-bound smoke)</code>
</para>

</section> <!-- id="writing-transformations" -->

<section id="key-concepts"><title>Reviewing Key Concepts</title>

<para>
  So, what should you take away from what we've just learned?  You now
  know a few new functions in MediaScript, particularly functions that transform
  colors.  You've now learned about a technique that computer scientists
  use, refactoring, which involves writing new functions that encapsulate
  common code. You've seen that Scheme permits procedures to take other
  procedures as parameters, and that this permission supports refactoring.
  You've also learned how to write your own transformations.
</para>

<para>
  For the immediate future, knowing the particular transformations will
  be helpful.  Over the longer term, knowing about refactoring and knowing how
  to use procedures as parameters will be even more helpful (just as 
  knowing how to write your own procedures is more helpful than knowing
  any particular procedure).
</para>

</section> <!-- id="key-concepts" -->

<section id="transform-rgb-reference"><title>Reference</title>

<variablelist>
  <xi:include href="../reference/irgb-lighter.short" xmlns:xi="http://www.w3.org/2001/XInclude"/>
  <xi:include href="../reference/irgb-darker.short" xmlns:xi="http://www.w3.org/2001/XInclude"/>
  <xi:include href="../reference/irgb-redder.short" xmlns:xi="http://www.w3.org/2001/XInclude"/>
  <xi:include href="../reference/irgb-greener.short" xmlns:xi="http://www.w3.org/2001/XInclude"/>
  <xi:include href="../reference/irgb-bluer.short" xmlns:xi="http://www.w3.org/2001/XInclude"/>
  <xi:include href="../reference/irgb-rotate.short" xmlns:xi="http://www.w3.org/2001/XInclude"/>
  <xi:include href="../reference/irgb-phaseshift.short" xmlns:xi="http://www.w3.org/2001/XInclude"/>
  <xi:include href="../reference/irgb-complement.short" xmlns:xi="http://www.w3.org/2001/XInclude"/>

  <xi:include href="../reference/image-transform-pixel.short" xmlns:xi="http://www.w3.org/2001/XInclude"/>
</variablelist>

</section> <!-- id="transform-rgb-reference" -->

<section id="transform-rgb-self-check"><title>Self Checks</title>

<section id="transform-rgb-check-01"><title>Check 1: Procedures as Parameters</title>

<para>
  Suppose we want to use
  <code><function>image-transform!-pixel!</function></code> to make a
  pixel in <code>canvas</code> lighter. What is wrong with the
  following expression? Why? What should the expression say?
</para>

<programlisting>(image-transform-pixel! canvas 0 0 (irgb-lighter))</programlisting>

</section> <!-- id="transform-rgb-check-01" -->

</section> <!-- id="transform-rgb-self-check" -->

</section> <!-- id="transform-rgb-reading" -->

