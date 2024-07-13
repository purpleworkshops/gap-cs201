# Practical Computer Science: How To Think

- [Breaking Things Into Pieces](#breaking-things-into-pieces)
- [Finding the Boundaries Within](#finding-the-boundaries-within)
- [Example: Alan Turing's Instruction - Tables](#example-alan-turings-instruction-tables)
- [Cause and Effect](#cause-and-effect)

Let's get right to the best part of computer science: _computational thinking_.  This is the name often given to the particular way of reasoning about the world that has punctuated the entire history of computer science.  It is a manner of approaching every problem we need to solve, and it is rooted in the long, arduous evolution of the scientific method.

In some ways it would be proper to say that the inventors of computer science came well before Ada Lovelace and Charles Babbage; we must go back to the beginning of the Enlightenment, when evidence, proof, and logical reasoning came to be understood as the best path of progress.  When scientific progress bloomed into the industrial revolution, we inherited not only locomotives and factories, but also a new way of reasoning about the things we are trying to build.

Schools in the US have historically limited their teaching of the scientific method and outcomes-based reasoning skills to the science and mathematics classrooms.   The more recent push toward computer science in the early grades will hopefully be transformed into a push toward computational thinking skills, rather than specific programming language requirements.  Not everyone wants to grow up to be a software engineer; but everyone should learn how to think; how to investigate claims based on data; how to discern the difference between correlation and causation; and how to detect assumptions and falacies in rhetorical argument.

Computational thinking is, therefore, not limited to the endeavor of computer science or programming, but a skill with a wide range of applicability regardless of vocation.  It is therefore, arguable, the _best_ part of computer science, and it manifests itself in many different ways.  This chapter will highlight the best ways to put computational thinking into practice.

## Breaking Things Into Pieces

There's an old joke that goes, "How do you eat an elephant?  One piece at a time."

There are a few principles that run through every branch of computer science, but perhaps none are as pervasive or fundamental as the concept of divide-and-conquer.  When a large problem can be decomposed into a set of smaller ones, it is already on its way to being solved.  

If the set of small problems can, in turn, be divided into even smaller problems, each tiny problem can often be solved trivially.  When all of the tiny problems have been solved, the large problem has been solved as well.

### Finding the Boundaries Within

However, knowing how to break a problem into pieces can be a problem unto itself.  The insight required to split a problem into pieces can be more art than science.  

Imagine a very large boulder that has just rolled down a cliff, and is now blocking the road.  Moving the boulder would be nearly impossible without very large equipment.  But after some experience with large boulders, natural fault lines can quickly be recognized.  It is along these lines that the boulder can be split apart; and after repeating this process a few times, the small chunks of leftover rock are easily removed.

Finding the natural fault lines of an intractable bug or complex feature implementation is an essential practice of applied software engineering.  Much of the rest of this chapter, and indeed the rest of this book, is devoted to offering a wealth of strategies and techniques for breaking problems down to size.

### Example: Alan Turing's Instruction Tables

At the close of World War II, Alan Turing was itching to build the first manifestation of his imagined "universal computing machine."  His unique perspective enabled him to recognize that a machine's ability to follow instructions of a logical sort was far superior to one that was restricted to numbers and brute calculations.  Coming from a pencil-and-paper world, he envisioned his machine as reading an "instruction table" for the machine to follow.  These tables would describe the microsteps necessary to accomplish a certain task, like adding two numbers together, storing a number in memory, or retrieving a stored value.

But almost as soon as he'd begin sketching out his plans, way before he had a chance to build the machine itself, he realized that developing one giant instruction table was neither practical nor intelligent. Finally, in a flash of insight, his imagination revealed to him that any section of instructions could be made into its own table. If the machine could remember where it left off, it could switch to the another table of instructions when needed, later to resume from where it originally left off.  

These subtables provided a way to store a reusable set of instructions which could be called upon as needed.  

He took this idea one step further, imagining an entire "heirarchy of tables," with the first "main" table loading the other tables based on conditionals or some other manner.  Alan Turing had used pure imagination to invent the concept of _subroutines._

In one broad stroke, Turing had invented both a practical solution to a complex problem (maintaining long lists of instructions) and a novel way of thinking that has endured for 75 years.  



## Cause and Effect

One of the first scientific principles that we learn in school is that of _cause and effect_.  But we also know this from everyday experience.  If I hit a tennis ball with my racquet, the ball will be propelled forward  (hopefully!) through the air.  If I drink water, I'll be less thirsty.  If I put on a coat, I'll be warmer.  If I plug my phone into the wall, it will recharge.

Computer programming is just as predictable, or _deterministic_ as people like to say.  The computer operates by strictly following a set of instructions, and the instructions are written by us.  It cannot make things up.  It cannot even ignore the instructions that have been given to it.  The computer is completely incapable of improvising on its own. Even so-called "artificial intelligence" still requires the computer to follow a set of predefined rules (see the chapter on Neural Networks for more).

Yet, modern software has become so complex, and consist of so many possible instruction paths, that it may feel non-deterministic.  Bugs reported by customers often seem unreproducible.  Confidence in our ability to deliver code that works exactly as intended can be shaky at best.

We must take heart: things are not random.  Bugs do not happen by chance.  Adding that next feature need not be daunting.

We have many tools at our fingertips to help us cope with complexity.  The proper tool, wielded with skill, should make the code seem so simple as to immediately reveal the direct cause and effect.  

All programming languages are abstractions. The only "real" computer language is the long stream of ones and zeros, which are themselves just representations for certain instructions belonging to a finite set.  

When was say that a section of code is "hard to read", we mean that it the connection between the code and its effect is unclear.  This is why so many languages exist: there is no single programming language abstraction that will fit everyone's brain in the same way.  To some, Java is easy to read and well-written Java code exhibits behaviors that are obvious from its source code.  For others, Ruby provides the clear cause-and-effect relationship.  For still others, functional languages that do not maintain state seem best.

Whatever your choice, remember that everything you do is just a virtual billiard table: the number of balls and angles of the rails are determined by your progamming language, but the fundamental laws remain the same.  What goes up must come down. A line of code must execute, and it must do exactly what it says it will do.