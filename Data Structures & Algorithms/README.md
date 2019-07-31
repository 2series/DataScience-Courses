## Data structures & algorithms
RIHAD VARIAWA, Data Scientist - Who has fun LEARNING, EXPLORING & GROWING

![](https://media.giphy.com/media/bIhA1ZazTlWI8/giphy.gif)

### Lesson 1 - Introduction and Efficiency
  * Efficiency:
      * How well you're using your computer's resources to get a particular job's done.
      * both in  time and space terms.
      * Get the most done with minimal resources.
  * Big O Notation:
      * O(n), where n represents the lenght of an input to your function.
      * O(1) = O(0n + 1)
      * Think about best, worst and average scenario (e.g. for iterating through an alphabet, the average scenario would be 13 times)
      * In the end, what it matters is "the relationship": O(16n + 2) or O(29n + 2) means O(n))
      * Always specify your interviewr which case you're talking about (best, average, worst)
  * Algorithms usually fall into the following performance classes:
      * constant-time, e.g. O(1)
      * logarithmic, e.g. O(log(n))
      * linear, e.g. O(n)
      * polynomial, e.g. O(n^2 + n)
      * exponential, e.g. O(2^n)
      * factorial, e.g. O(n!)

### Lesson 2 - List-based collections
  * **Collections** don't have a particular order.
      * They don't need to have the same type of objects.
  * **Arrays** are the most common implementation of **Lists**.
      * It differs in different programming languages (some allow different types of elements, some don't, etc.)
      * An **Array** is a List with some added rules: e.g. each Array has a location called an "index".
      * Inserting it at the end is usually easy (unless it has a specific size). But, doing it in the middle, means to move up to n elements (O(n))
      * Deleting an element in the middles can also be inefficient.
      * List time complexity in Python: https://wiki.python.org/moin/TimeComplexity
      * Behind the scenes **a Python list is built as an array**.
          * Internally, a list is represented as an array; the largest costs come from growing beyond the current allocation size (because everything must move), or from inserting or deleting somewhere near the beginning (because everything after that must move).
      * Use arrays if you need fast element access, use lists if you need fast element insertion/deletion.
  * **Linked Lists**:
      * It's an extension of a List, but it's not an Array.
      * Each elements has a reference to the next element in the list (a pointer to the memory address).
      * Adding and removing elements from a Linked list is easy: you just need to change a couple of references. It takes constant time (you change pointers, you don't iterate)
      * There isn't a built-in data structure in Python that looks like a linked list.
      * **Doubly Linked Lists**: you have pointers to both the next and previous elements.
  * **Stacks**
      * Stacks are also list-based data structures.
      * You can only access what it is on the top of the stack.
      * Stacks are useful when you only care about the most recent elements.
      * push and pop: both operations are O(1)
      * LIFO
      * Stack practice: Here's an alternative solution to delete_first() - https://gist.github.com/adarsh0806/02d8e1d54d510294e75dfbc0d9bd7059
  * **Queues**
      * FIFO
      * The opposite to a Stack
      * head and tail
      * enqueue: adding an element to the tail
      * dequeue: deleting an element from the head
      * peek: look at the head element, but you don't remove it
      * **Dequeue = Double ended queue**: it's a queue that goes in both ways. You can enqueue and dequeue from either end.
          * A **deck** is kind of a generalized version of both stacks and queues.
      * **Priority queue**: you include a priority to every element that you insert in the queue.
          * When you dequeue, you remove the element with the highest priority.
          * If the elements have the same priority, the oldest element is the one that gets dequeued first.

### Lesson 3 - Searching and Sorting
  * **Binary search**
      * If the array is sorted, you start in the middle.
      * Efficiency: when I double the elements, I need one more iteration.
          * 2^n = y >>> log(y) = n >> The log would be "base 2". The logarithm is the inverse operation to the power.
          * O(log(n))
      * If you don't know or see the efficiency of an algorithm, create a table in order to extract: "Array size" vs "Iterations"
      * Visualization: http://www.cs.armstrong.edu/liang/animation/web/BinarySearch.html
      * Searching Sorted List Visualization: https://www.cs.usfca.edu/~galles/visualization/Search.html
  * **Recursion**:
      * A recursion function needs:
          * to call itself at some point
          * a base case: it's like an exit condition
          * Alter the input parameter at some point
  * **Intro to sorting**
      * "In place sorting algorithms" just rearrange the elements inside the same data structure.
  * **Bubble sort**
      * aka "sinking sort", it's a naive approach
      * In each iteration, the highest value pops up.
      * In-place algorithm
      * Efficiency:
          * Worst case: O(n^2)
          * Average case: O(n^2)
          * Best case: O(n)
      * Space = O(1) (in-place algorithm)
      * https://en.wikipedia.org/wiki/Bubble_sort
  * **Merge sort**:
       * Split and sort: First divide the list into the smallest unit (1 element), then compare each element with the adjacent list to sort and merge the two adjacent lists. Finally, all the elements are sorted and merged.
       * Divide and conquer
       * At the beginning, we leave an array of size 1 at the start, and all the rest take size 2.
       * Number of iterations x Number of comparisions in each iteration
       * Efficiency:  O(n*log(n))   >> we do log(n) iterations, and n comparisons in each iteration.
       * The time efficiency is better than Bubble sort, but the space efficiency is worse >> auxilliary space = O(n)
          * But indeed, we can remove the "old arrays" each time, so we only need 2 arrays: the one where our numbers were, and the new array that we're copying the values into.
      * https://xkcd.com/1185/
      * https://algs4.cs.princeton.edu/22mergesort/
  * **Quick sort**
      * Divide and conquer
      * In-place sort. Space = O(1)
      * Steps:
          1. Choose a pivot (the convention is to pick the last element)
          2. Iterate from the first value, moving all values larger to the right of the pivot: move the pivot to its position-1, the value in index-1 to position 0 and the one in position 0 to the pivot position
          3. Continue doing step 2
          4. When the pivot is at its right (all the values on the left are smaller), we repeat the algorithm for both parts (the part on the left of the pivot and the part on the right), starting from step 1
      * Efficiency:
          * Worst case O(n^2): the pivots are already the biggest elements (so we need to compare with all the rest all the time)
          * Average and best case: O(n*log(n))
      * If we know we're getting an almost sorted array, we don't want to use Quick sort, since we would get O(n^2)
      * Improvements:
          * We can have two independent processes running each half sorting in parallel
          * Instead of selecting the last element as pivot, select the median of the last three (better sense of the values, more probability of moving to the middle)
      * https://en.wikipedia.org/wiki/Quicksort
  * **Heapsort**
      * https://en.wikipedia.org/wiki/Heapsort
      * Although somewhat slower in practice on most machines than a well-implemented quicksort, it has the advantage of a more favorable worst-case O(n log n) runtime. Heapsort is an in-place algorithm.

### Lesson 4 - Maps and Hashing
  * **Sets**
      * Sets don't have any specific order, but it doesn't allow repeated elements
      * A Map is a set-based structure (<Key, Value>)
      * A group of keys is a set: the keys of map need to be unique (like in a dictionary)
  * **Hashing**
      * Data structures that use hashing allow look-ups in constant time
      * Value -- (hash function) --> Hash value
      * You usually use the hash value as the index to store the value
      * One common pattern is to take the last digits of a big number, divide it by some consistent number and using the reminder of the division to find a space where to store the value
      * If we get the same hash value for two values, that's a collision:
          * you can change your hash function
          * or you can store several values in the index: we would call that space a "bucket"
      * Originally we would have O(1), but with the bucket approach, we would have O(m) for the worst case (m=size of the bucket)
      * When we're talking about hash tables, we can define a **load factor**:
          * Load Factor = Number of Entries / Number of Buckets
          * The purpose of a load factor is to give us a sense of how "full" a hash table is, e.g, if we're trying to store 10 values in a hash table with 1000 buckets, the load factor would be 0.01, and the majority of buckets in the table will be empty. We end up wasting memory by having so many empty buckets, so we may want to rehash, or come up with a new hash function with less buckets. We can use our load factor as an indicator for when to rehash—as the load factor approaches 0, the more empty, or sparse, our hash table is
          * On the flip side, the closer our load factor is to 1 (meaning the number of values equals the number of buckets), the better it would be for us to rehash and add more buckets Any table with a load value greater than 1 is guaranteed to have collisions
  * **Hash Maps**
      * See exercise
      * https://stackoverflow.com/questions/299304/why-does-javas-hashcode-in-string-use-31-as-a-multiplier

### Lesson 5 - Trees
  * Root, branches, leaves, forest...
  * A tree is an extension of a Linked List.
  * Root: the first element.
  * Node: an individual element of a tree.
  * A tree must be completely connected.
  * There must be no cycles. It counts as a cycle if there is connection, no matter the sense of the arrows.
      - Children are only allowed to have one parent.
  * Levels: the root is level 1.
  * Parent-child relationships: ancestor-descendant.
  * Siblings: children from a same parent.
  * No children: leaves or "external nodes".
  * Parent notde = internal node.
  * Connections = edges.
  * Path = group of connections taken together.
  * Height of a node: number of edges between it and the furthest leaf of the tree.
  * A leaf has a heigth of zero. The parent of a leaf has a heigth of one.
  * Depth of a node: number of edges to the root.
  * Tree traversal:
      - DFS: depth-first search.
           - The priority is to traverse/visit the children left
           - Pre-order traversal: we check off the nodes explored as soon as we pass through it.
           - In order: we only check off a node after having explored its left wing. We move from left to right (in that order)
           - Post order: we only check off a node after having visited all of its descendants.
      - BFS: breadth-first search. Level order traversal
          - The priority is to traverse/visit the siblings left
  * Perfect tree: every node (except leaves) has 2 children
  * Binary trees:
      - Parents have at most 2 children.
      - Search: O(n), linear time search, we need to go through all the nodes, because the is no ordering.
      - Deleting: O(n)
      - Inserting: O(log(n)) it's easy, you find an open spot. The worst case: the heigth of the tree.
  * **Binary Search Tree (BST)**:
      - It's a type of Binary Tree.
      - BSTs are sorted so every value on the left of a particular node is smaller than it and every value on the right of a particular node is larger than it.
      - We can do operations like search, insert or delete pretty quickly.
      - Search: the heighth of the tree, O(log(n))
      - Insert: O(log(n))
      - Unbalanced binary tree.
      - Worst case: e.g. only nodes on the left or on the right (O(n))
  * Heaps:
      * "heap" means "apilar, pila, montón".
      * Trees (it doesn't have to be a binary tree, it could have more than 2 children) where the elements are sorted in increasing or decreasing order.
      * A binary heap can be represented with an Array.
      * The root is either the maximum or the minimum value.
      * Max heap: a parent must always have a higher value than its children.
          - A function for getting the peek (max value) has O(1) complexity.
      * Min heap: a parent must always have a lower value than its children.
      * A heap tree must be a "complete" tree: all levels, except the last one, must be full. The right most leaf will be empty until the whole row has been filled (it's filled from left to right).
      * Search: O(n) there is no guarentee that the left branch will be higher or lower than the number searched. The cost is linear.
      * Insert: we just insert the element in a free spot, and then we heapify:
          - Heapify: it's the operation where we reorder the tree based on the heap property. We compare the element with its parent: if the parent is lower, then we just swap the elements.
      * Extract (delete):
          * Similar to heapify.
          * Take a leaf and move it to the deleted element.
          * Then compare with its children and swap when necessary.
      * Worst case for insert and delete: O(log(n)) >> height of the tree
      * Usually represented as Arrays.
          - Not every array can be represented as a Tree.
          - Storing in an Array saves space: we only require the value and index. In a tree-node-like element, we would need left, right, etc.
  * Self-balancing trees:
      * A balanced tree has nodes condensed only to a few levels.
      * The most unbalanced tree is a linked list.
      * A **self-balancing binary search tree** is one which tries to minimize the number of levels that it uses.
      * It runs some algorithms during insert and delete to keep itself balanced; it also might store some additional property.
      * **Red-black treee*:
          - It's an extension of a Balanced Binary Tree.
          * TreeSet (Java) is a red-black tree
          - Nodes have an additional property (one bit): a color (black or red)
          - Rules:
              - It exists null leaf nodes (which are drawed as black).
              - The root node must be black.
              - If a node is red, the children must be black (only its children, not necessarily its grandchildren).
              - Every path from a node to its descendeant null nodes must contain the same number of black nodes.
          - Search, Insert and Remove = O(log(n))
          - Space complexity = O(n)
          - Search is not different to a BST
          - Insert and Remove implies rotation, in order to keep the rules.
          - Insert:
              - There are 5 cases, review the video!
              - If your parent and sibling are both red, transform them to black, and the grandparent becomes red (unless the grandparent is the root).
              - Average and worst cases: O(log(n))
          - More:
              - Shortest path: all black nodes
              - Longest path: alternate red and black nodes.

### Lesson 6 - Graphs
  * https://medium.freecodecamp.org/i-dont-understand-graph-theory-1c96572a1401
  * Data structure designed to show relationships between objects.
  * ~ a network
  * There isn’t a fixed and “de jure” structure for graph representation.
  * Whenever you see a tree, you can be sure that it is also a graph.
  * Nodes or "vertex"
  * Connections = edges
  * Degree of a vertex: the number of edges incident connected to the vertex.
  * A Tree is a type of Graph
  * The is no "root" node.
  * Edges can contain information too, not only the Nodes.
  * Edges can have a Direction: "directed graph".
  * Facebook: undirected. Twitter: directed.
  * Graphs can have cycles.
  * DAG: Directed Acyclic Graph >> directed graph with no cycles.
  * "Disconnected Graph": there is some vertex which can not be reached by other vertices
  * Connectivity: minimum number of elements that need to be removed for a graph to become disconnected.
  * **Disconnected**
      * Disconnected graphs are very similar whether the graph's directed or undirected—there is some vertex or group of vertices that have no connection with the rest of the graph.
  * **Weakly Connected**
      * A directed graph is weakly connected when only replacing all of the directed edges with undirected edges can cause it to be connected. Imagine that your graph has several vertices with one outbound edge, meaning an edge that points from it to some other vertex in the graph. There's no way to reach all of those vertices from any other vertex in the graph, but if those edges were changed to be undirected all vertices would be easily accessible.
  * **Connected**
      * Here we only use "connected graph" to refer to undirected graphs. In a connected graph, there is some path between one vertex and every other vertex.
  * **Strongly Connected**
      * Strongly connected directed graphs must have a path from every node and every other node. So, there must be a path from A to B AND B to A.
  * **Representation**
      * OOP: You could have Node (with vertices properties) and Vertex(with nodes properties)
      * Edge List: list of edges; an edge is represented by two elements (id numbers for the vertices). It's a list of other lists (2D list).
      * Adjacency List: your indices have an id number which corresponds to the index in the array. It's a 2D list.
     * Adjacency Matrix: 2D array where the lists inside have all the same length. It's also called a rectangular array.
          - The indexes represent nodes with those ids
          - The lists inside represent which nodes are adjacent
          - Instead of storing ones and zeroes in an adjacency matrix, we can store something “more useful”, like edge weights.
          - It might take too much space, and it stores both the existence and non existence of "links".
  * Graph traversal:
      * **DFS (depth-first search)**
          - A common implementation uses a Stack, so we can store the node visited in the Stack.
          - Then, you pick an edge, follow it, and mark that node as seen (and add it to the Stack).
          - If you have already visited the node, go back to the last node and pick another edge.
          - If you run out of edges with new nodes, you pop the current node from the stack and go back to the one before it (which is just the next one on the stack).
          - O(|E| + |V|) >> the number of edges plus the number of vertices
          - Each edge is visited twice
          - there is another implementation using recursion
      * **BFS (breadth-first search)**
          - You visit every edge of one node before continuing with the graph.
          - We use a Queue.
          - It's kinda creating a Tree from a Graph (the root is the node with which we start)
          - O(|E| + |V|) >> the number of edges plus the number of vertices
      * For the iterative implementation of BFS we used a queue, for DFS you will need a stack.
  * Path: a specific route you take in a graph
  * Notable paths:
      * Eulerian path: it travels through every edge at least once. You can finish on a different node to the initial one.
          - It's OK to have two nodes with an odd degree as long as they're the start and end of the path.
          - There is a method (see the video): O(|E|)
          - Theorem. A finite undirected connected graph is an Euler graph if and only if exactly two vertices are of odd degree or all vertices are of even degree.
      * Eulerian cycle: you traverse every edge only once and you must end at the same node where you started.
          - A graph can only have Eulerian cycle if all vertices have an even degree or an even number of edges connected to them.
      * Hamiltonian path: it must go through every vertex once. It starts and ends within the same vertex.
  * **Bipartite graph** or just bigraph is a graph whose vertices can be divided into two disjoint and independent sets such that every edge connects a vertex in one set to one in other set.

### Lesson 7 - Case studies in algorithms
  * Shortest Path Problem
      * unweighted graph: the one with less edges >> it's a BFS
      * Posible solution for weighted undirected grpahs: Dijkstra's algorithm
          - typical implementation: a min priority queue
          - we always pick the node with smallest minimum distance
          - Greedy algorithm
          - O(|V|^2)
  * Knapsack Problem
      * How to optimize what it can fit (the value) in a knapsack taking into account the weight of the items?
      * * It's an NP-Hard problem
      * Brute force solution: try every combination and choose the best one >> O(2^n) >> exponential time algorithm
      * Faster solution: using a lookup table. O(nW), n=number of elements, W=weight limit >> pseudo-polynomial time
  * Polynomial time algorithms are much faster than exponential time algorithms for big numbers.
  * **Dynamic programming**: break a complicated problem into subproblems
      * you start by solving a base case, a case which is so simple that the solution is trivial.
      * Use of lookup tables (like the "faster solution" in knapsack): it stores solutions to subproblems.
      * **Memoization**: storing precomputed values.
  * **Traveling Salesman Problem** (TSP)
      * What's the fastest way to travel between every city and return home?
      * It's an NP-Hard problem: it doesn't have a known algorithm that can solve it in polynomial time.
      * Two types of algorithms are known:
          - Exact algorithms: it finds the optimal solution.
          - Approximation algorithms: it doesn't always find the optimal solution, but if finds a near optimal solution.
              - Christofides algorithm: transform the graph into a tree. It guarantees the path found will be at most 50% longer than the shortest route.
      * Brute-force solution: O(n!)
      * Dynamic solutions: Held-Karp algorithm >> O(n^2 * 2^n)

### Lesson 8 - Technical Interviewing Techniques
  * Clarify the question!
  * Confirm the input and expected output of the algorithm.
  * Think about edge cases?
  * Think out loud while reasoning.
  * Brainstorm about different data structures and algorithms.
  * Debugging
  * Possible solution for islands problem: use of deck (double-ended queue), marking each element already explored.

### General 
  * Complexity for finding an element:
      * hashtable is usually constant-time
      * balanced binary tree is O(log(n))
          * Guaranteed height of O(log(n))
      * linked list is order N
      * sorted array is order log(n)
  * Data structures:
      * **arrays** - I'm talking about C-language and Java-language arrays: fixed-sized, indexed, contiguous structures whose elements are all of the same type, and whose elements can be accessed in constant time given their indices.
      * **vectors** - also known as "growable arrays" or ArrayLists. Need to know that they're objects that are backed by a fixed-size array, and that they resize themselves as necessary.
      * **linked lists** - lists made of nodes that contain a data item and a pointer/reference to the next (and possibly previous) node.
      * **hashtables** - amortized constant-time access data structures that map keys to values, and are backed by a real array in memory, with some form of collision handling for values that hash to the same location.
      * **trees** - data structures that consist of nodes with optional data elements and one or more child pointers/references, and possibly parent pointers, representing a heirarchical or ordered set of data elements.
      * **graphs** - data structures that represent arbitrary relationships between members of any data set, represented as networks of nodes and edges.

### "I don't understand graph theory" notes
  * Recursive functions look very elegant though they are so expensive. Each time we call a function recursively, it means we call a completely “new” function (see the illustration above). And by “new” we mean that another stack memory space should be “allocated” for the function arguments and local variables. That’s why recursive calls are expensive (the extra stack space allocations and the many function calls) and dangerous (mind the stack overflow) and it is obviously suggested to use iterative implementations. In mission critical systems programming (aircraft, NASA rovers and so on) a recursion is completely prohibited (no stats, no experience, just telling you the rumors).

### Interesting links
  * Watch all kind of sorting algorithms in action:  https://visualgo.net/en/sorting?slide=1
  * http://btechsmartclass.com/DS/U3_T1.html
  * Live mock interview:
      * https://www.pramp.com/#/
      * https://www.pramp.com/tryout
      * Pramp is a peer-to-peer mock interview platform for coding interviews, focused on questions regarding algorithms and data structures. It pairs software developers together for a practice interview, based on their background, availability and practicing needs. Pramp automates the whole process and takes care of scheduling, peer matching and interview prep content (i.e. interview questions and answers). A live practice session includes integrated HD video chat, collaborative code and support for 17 different programming languages.
  * Books
      * Cracking the Coding Interview by Gayle Laakmann McDowell
      * Introduction to Algorithms by Charles E. Leiserson, Clifford Stein, Ronald Rivest, and Thomas H. Cormen  
      * Programming Interviews Exposed by John Morgan, Noah Kindler, and Eric Giguere
      * Algorithms, 4th Edition by Robert Sedgewick and Kevin Wayne
      * Elements of Programming Interviews by Adnan Aziz
  * Websites:
      * HackerRank: Website and community with programming challeges that you can go through for additional practice.
          - https://www.hackerrank.com/
      * Project Euler: This website has a ton of logic problems that you can practice writing coded solutions to.
          - https://projecteuler.net/
      * Interview Cake: Practice questions and some tutorials available.
          - https://www.interviewcake.com/
      * Interactive Python: Loads of tutorials on pretty much every topic covered here and many more, along with Python examples and concept questions.
          - http://interactivepython.org/runestone/static/pythonds/index.html
      * Topcoder: New practice problems every day, and some tech companies use answers to those problems to find new potential hires.
          - https://www.topcoder.com/
      * LeetCode: Practice problems, mock interviews, and articles about problems.
          - https://leetcode.com/
      * BigO Cheat Sheet: Summary of efficiencies for most common algorithms and data structures.
          - http://bigocheatsheet.com/
  * Github Repository (Collections of Problems)
      * The Coding Interview
          - https://github.com/mre/the-coding-interview
      * HTML5 Boilerplate Interview Questions
          - https://github.com/h5bp/Front-end-Developer-Interview-Questions
  * Blog Posts
      * Five Essential Phone Screen Questions: https://sites.google.com/site/steveyegge2/five-essential-phone-screen-questions
