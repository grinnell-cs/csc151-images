---
title: Decomposing `word-cloud`
section: handouts
---
# {{ page.title }}

In [mini-project 8](../mps/mp08), you are asked to write a procedure, `(word-cloud fname)` that takes a file name as input and produces a word cloud for the image. One of your tasks for the project is to consider how you might decmopose the problem. Here are some of the ideas you provided.

_Answers have been edited for clarity._

Big picture
-----------

`(file->words fname)` - Turn a file into a list of words. _Fortunately, `file->words` is provided to you._

`(words->counts words)` - Build a hash table that counts the number of times each word appears. _Instructions for such a procedure appear in the lab on hash tables_.

`(remove-common-words! table)` - "Weed out" common words from the table. (Optional, only required for an E.)

`(compute-frequencies table)` - Convert the counts in the table to frequencies. _Some folks suggested making a new table; others wanted to change the existing table. Either should be fine._

`(most-frequent-words table)` - Grab the 50 most frequent words from the table. _Something similar might appear in the lab on hash tables._

`(words->images words)` - Given a list of word/frequency pairs, convert all of them to images.

`(word->image word frequency ...)` - A procedure to decide the font, color, size, rotation, weight, and style of the word. Some of these might be random.

`(combine-images word-images)` - Combine the images into a word cloud.

Other useful procedures
-----------------------

`(my-take lst num)` - Just like `take`, except it doesn't crash if there are fewer than `num` words in the list. (Useful for the E requirement that we handle files of fewer than fifty words.)

Fairly specialized procedures
-----------------------------

`(overlap? region1 region2)` - I think it will be useful to keep track of the region a word occupies in the image (e.g., left, top, right, and bottom edges of the word). When placing a new word, I want to make sure that it doesn't overlap other words. Something like `(ormap (cut (overlap? new-region <>)) used-regions)` will let me know if I can successfully place it.

`(add-word word img)` - Add one word to a compound image. I'm building my word cloud one word at a time, so I think it will be easier to test if I have such a procedure.

Other notes
-----------

Please review [the lab on hash tables](../labs/hash-tables) for some ideas.

Note that the `sort` procedure will help you sort the words by frequency and `take` (or your own variant of `take`) will grab the top 50 once you've sorted them.


