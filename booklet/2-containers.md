# Practical Computer Science: Containers for Things

- [Memory Locations](#memory-locations)
- [Linked Lists](#linked-lists)
- [Arrays](#arrays)
- [Queues](#queues)
- [FIFO](#fifo)
- [LIFO](#lifo)
- [Priority](#priority)
- [Trees](#trees)
- [Binary](#binary)
- [Heaps](#heaps)
- [Graphs](#graphs)
- [Directed](#directed)
- [Neural Networks](#neural-networks)

Digital computing was invented in the 1940's, when physical computing devices (such as adding machines and simple calculators) were the state of the art.  

Those devices were pre-wired to perform their function.  A calculator built to add and subtract integers, which would then transform itself into a machine that could also multiply and divide, would have sounded like some sort of dark magic.

The invention of electronic programmability changed that worldview forever.  Computing machiens could be now pre-wired to follow instructions that would be provided later, electronically.

Electronic data storage pioneered the age of software.  The days of "unitasker" computing devices were immediately numbered and the realm of computing took a giant leap forward. But soon it became clear that the art of organizing electronic data was not at all obvious.  

How should data be organized?  Shoud all data be organized in the same way? Must the technique of storing data be connected to the manner in which that data will be used to perform the calculations?

Over 70 years of such questions - and answers - have defined the data structures we use today.  

A raw inventory of data structures is not helpful.  They can be found in any computer programming textbook worth it's weight in paper (or bandwidth).  

But to be able to glimpse the insights that produced such structures in the first place is priceless.  The dual dedication to laws of both simplicity and power is one of the best parts of the tradition of computer science.  

This chapter aims to illuminate the fundamental structures that we still use today, and to make clear the utmost importance these structures have on modern computational architectures today.

## Memory Locations

The most fundamental of all data containers is the _memory location_.  This usually refers to the kind of electronic memory that's built into the computer circuitry, as opposed to hard drive storage or flash storage.

A memory location was initially conceived by Alan Turing in his quest to invent a technique for computing devices to temporarily store certain numbers for a few moments, so that they could be retrieved later during a certain step of a process.

Today, modern computers use molecular substrates to reliable store and recall numerical data, but we still imagine them as mail slots, cubby holes, or other familiar physical metaphors.

Each memory location is associated with a specific _address_ that uniquely identifies that location.  Modern operating systems provide a layer of abstraction on top of the physical hardware by giving each process a "virtual" set of memory addresses, which are mappyed by the operating system to physical addresses.  This virtualization allows each process to access memory consistently, even though the underlying system may actually "page" the memory onto other storage devices (like the hard drive) as needed in order to maintain the illusion of multitasking in a shared memory space.

The size of a single memory location is measured in bits. The number of bits that can fit has increased over the years.  The personal computing era begin with 8-bit values per location.  Modern smartphones and tablets can now store an entire 64-bit value in a single location.  (For the remainder of this book, we will assume that a single memory location can store a 64-bit value.)

If we only used computer memory to represent numbers, computers wouldn't be very useful.  The breakthrough in computing came with the realization that numbers could represent other things.  

At first, certain numerical values were a shorthand to refer to a particular "instruction" which was a hardcoded built-in ability of the computer itself (for example, the ability to add two numbers together).  

Later, we extended this idea of interpretation to allow numbers to represent letters of the alphabet, custom instructions, color values, geolocation coordinates, and almost anything else we can imagine.

However, despite the infinite variety of possible interprations for any given memory address, a value stored in a given memory location is always approached in one of two ways:

1. as data: that is, a numerical value or equivalent interpretation of some real-world entity; or,
2. the address of another memory location

Those are our only two choices.  When we choose to interpret a location's value to be the address of another location, we call that value a "pointer," "memory pointer," or "reference."
The concept of pointers is one of the most bizarre and intimidating concepts that new programmers face.  But it represnets a breakthrough concept in computer science, and i still a fundamental particle in today's programming universe.

Pointers enable complex, heterogeneous structures to emerge from an otherwise linear slate of data buckets.

Some programming languages, like `C`, require the programmer to be quite preoccupied with the tasks of allocating memory locations as needed by the program, and then releasing them back to the operating system when they are no longer needed.  

A special syntax enables the programmer to designate certain values as pointers as opposed to scalar values.  This burden results in various headaches during programming, but offers speed and ultimate flexibility when writing algorithms.  

Other languages, like `Java`, `Ruby`, and `Python`, abstract the gory details of memory allocation away from the programmer, reducing complexity and removing a common source of errors.  

However, this convenience comes at the cost of efficiency and a (potentially) non-deterministic "garbage collector" to ensure that memory locations can be reused efficiently.


## Linked Lists

If we put together a simple series of memory locations, we can make them work together to form a _linked list_.  A linked list is the simplest possible container for a collection of data elements.

A linked list is a linear series of _nodes_.  Each node is constructed from a pair of memory locations. The first location is responsible for storing the desired data (a single 64-bit numerical value); the other location is responsible for storing the memory location of the next node.  

These memory locations are commonly referred to as the node "data" and "next pointer", respectively.

In order to represent a list, the following strategy is used.  One node is arbitrarily designated as the "head" node. Starting from the head, we attach subsequent nodes by using the "next pointer" as a way to refer to the next node in the list.  The ending node is therefore easily identified, as it will store a value of zero for it's "next" pointer.

Modern programming languages offer higher-level abstractions: strings, structures, and objects of arbitrary size and complexity.  So why are we talking about a linked list?

Every data structure described in the remainder of this book, and in fact that you will ever use in your software, can be defined in terms of linked lists.  It is the fundamental building block of all data structures.  

One nice thing about a linked list is that it's pretty easy to maintain a notion of _order_.  When adding new items, the "next" pointers can be easily rearranged to "insert" a new item in the midst of the existing chain.  Removing items is also simple.  Imagine a line of elephants, each connected trunk-to-tail.  Removing an elephant simply requires the elephant behind to let go for a moment while the elephant is led away; after which the chain can be reformed.

If you can solve the challenge of building a your own linked list to manage some data that's meaningful - your MP3 collection, for example - then your brain will come to understand the mindset and the patterns that have been most crucial for the endeavor of computer science to advance.  

1. a collection of things is made up of smaller, atomic containers
2. data has no intrinsic meaning - it's all about representation and interpretation
3. memory pointers represent the breakthrough concept of_indirection_, a powerful technique to build software artifacts
4. indirection is the core idea of all modern software architecture


## Arrays

For all the power provided by linked lists, they suffer from one crucial drawback: speed.  We do not create lists of items merely to contain a list of items.  The point of a list is do something creative with it.  And this is where the linked list structure is less than ideal.

Imagine that we used a linked list to keep track of a list of business contacts.  One day, you forget the phone number for your boss, Margaret Smith.  Fortunately, you wrote a program to retrieve a contact from the list given their name.  Unfortunately, you used a linked list.  Your program will need to search for Margaret's node by starting at the head node, and walking the chain one node at a time until it arrives at the right node.

If you're lucky, Margaret's node is stored at the near the front of the list, and it takes only a few hops down the chain to get to the right node.

But if you're unlucky, Margaret's information is further along, or worst case at the very end.  The more contacts you add to the list, the greater your chances of having to wait a long time to retrieve any given contact.

This dilemma gave rise to an improvement over the linked list: the _array_.  An array is a series of memory locations that guarantees access to any node in the same amount of time.

Even arrays are not panaceas.  Access to any random element can now happen in a predictable fashion, but for array sizes are traditionally fixed - you can't grow the array beyond the initial size.  Some languages allow you to bypass this requirement, at the cost of additional time and memory if you choose to grow the array after its initial construction.

Still, the advent of arrays made linked lists nearly obsolete for all but the lowest-level programming tasks.

## Queues

Now that we've seen linked lists and arrays, a simple twist yields a most useful invention, the _queue_.  A queue has the added characteristic that new elements are added at one end of the list, but removed from the other.   Consider a line in the grocery store.  Customers enter at the back of the line, and are serviced at the front.

A queue does not offer access to any random element, so it is unlike an array. But it is often implemented by using an array and keeping track of the "front" and "back" indices, avoiding the slowness associated with linked lists.

There are actually three common queue flavors, which we will now look at.

### FIFO

The _FIFO_ queue, short for "First In, First Out", is the kind of queue we typically find in the real world.  At the grocery store, boarding an airplane, driving to work - these are all FIFO queues in which the person to get in line first will be the first to be granted their freedom.

Like all queues, only two primary operations exist:

1. you can _push_ (i.e. add) a new element onto the end of the queue
2. you can _pop_ (i.e. remove) the front element from the queue

### LIFO

The _LIFO_ queue, or "Last In, First Out" queue, is more commonly called a _Stack_.  Stacks are extremely useful containers for many programming tasks, such as implementing calculators and expression evaluation.  We refer to a chained series of function calls a _stack_ because that's exactly how your favorite programming language keeps track of the execution point in your program.  Local variables are generally allocated in memory using a stack structure.  

### Priority

One of the most useful types of queues is the _priority_ queue.  In this kind of queue, the _push_ and _pop_ operations are still supported, but the elements being pushed have some kind of additional characteristic, generally called a priority value or priority level, that serves to modify the position of the item within the queue.  Higher-priority items are allowed to "jump" the queue and bypass lower-priority items that were added first.

<<Apollo 11 landing example here>>



## Trees

Let's go back to the design of a linked list: each node in the list consists of two parts: one part to store data, and the other to store a pointer.

Let's rename _pointer_ to _branch_ to help us visualize things a bit better. If we expand our definition of a node to allow more than just one branch, we end up with an entirely new kind of structure called a _tree_.  Trees have some amazing properties that open up all kinds of algorithmic possibilities.

Trees are used to implement database systems, solve complex routing problems, store ordered data efficiently, represent complicated heirarchical data, and more.

### Binary

We start with the original linked list node and modify it slightly by adding a second branch.  Now, each node can point at two neighbors instead of just one.  A tree in which each node contains two branches is called a _binary tree_.

By naming the two branches "left" and "right", we have devised a more efficient structure for holding data.   Consider the following two structures, one a linked list and the other a tree.

1. How many steps of operation would it require to navigate from the head of the linked list to the node containing the number 10?
2. How many steps of operation would it require to navigate from the root of the linked list to the node containing the number 10?
3. How many steps of operation would it require to insert the number 7 into the linked list?
4. How many steps of operation would it require to insert the number 7 into the binary tree?

It should be clear that using a tree can drastically reduce the number of steps required to store and retrieve data.

Nodes which have no branches are called _leaves_.  Leaf nodes end up with some startling properties, which we will examine further in the chapter on algorithms.

### Heaps

A _heap_ is a tree that follows the specific rule: parent node values are always  ordered with respected to their children.  If the parent value is always greater than the children, it is called a _max heap_.  If the parent value is always less than the children, it is a _min heap_.

Unlike a typical binary tree, it is not possible to traverse all of the nodes of the tree in order.  Although parent-child order is guaranteed, *sibling* order is not.  

If you can't traverse a heap in absolute sorted order, why use a heap?  There are actually several wonderful uses of heaps.  Perhaps the most famous is as a very efficient implementation of a priority queue.  Highest-priority nodes will sort ot the top (or vice-versa), make it very easy to consume the nodes in priority order.  Sibling nodes will have equal priority, and so by definition order doesn't matter.  

Therefore, traversing a heap in order is equivalent to popping items from a priority queue; and pushing new elements will update the queue while preserving priority order.

Using a heap is also amongst the fastest ways to sort a collection of data, using the so-called _heapsort algorithm_.

## Graphs

When I first encountered the term "graph" in computer programming, I thought it meant the kinds of graphs we learned to draw in school: bar graphs, pie charts, and so on.  In computer science, we use the term "graph" to mean something completely different.

Let us return to the concept of the binary tree.  Recall that the shape of a binary tree makes searching for a specific element easier than a linear linked list, and it's also easier to keep the container in a particular sorted order.  

If we enhance the tree by removing the only-up-to-two branch restriction, and allow each node to have an unlimited number of branches, certain remarkable consequences begin appear. We have now discovered a a new kind of container, the _graph_.

When we transition from a binary tree to a graph, we also shift our terminology: branches are now called _edges_.  Edges connect the nodes in the graph.  Every node must have at least one edge, otherwise it would become disconnected from the other nodes and no longer be part of the graph.

Graphs can be used to represent city streets, geographic systems, electrical grids, transportation systems, and social networks, to name a few.  The graph can represent real-world constructs and phenomena remarkably well.

There are some amazing algorithms that operate on graphs as we've described them, but there are a few important variations that can turn this container into a supercontainer.

### Directed

We can do amazing things with our graph if we enhance the edges with one additional aspect, _directionality_.  A _directed graph_ is one in which each edge is associated with one particular direction.  Imagine a city in which every street was a one-way street.  

It is also possible to have edges that can allow for movement in both directions, but this is much less common.

When we add the notion of direction to the graph, a number of interesting consequential properties can result:

1. An _directed acyclic graph_ is a directed graph in which no "loops" are possible.  Once you begin travelling from a particular node, you'll never get back to where you started.  Spreadsheets, source code version histories, certain types of electronic circuits, scheduling systems, and garbage collectors are examples of directed acyclic graphs.
2. A _weighted directed graph_ is a graph in which each edge is assigned a "weight" or value.  Weighted directed graphcs become very useful for real-time traffic analysis, transportation logistics planning, least-cost algorithms, and more.

### Neural Networks

Graphs are sometimes called _networks_ because they are often used to simulate the behavior of a flow network, whether it's a city's water pipe system, an electronic circuit, or a computer network.

One type of network that's often used as an introduction to the field of artificial intelligence is the _neural network_.  