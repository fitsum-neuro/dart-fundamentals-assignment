# assignment reflections
**name:** fitsum yoseph
**id:** ate/5804/16

**qr1. which concept was hardest to understand: lists and loops, classes and methods, exception handling, or async/await? walk through the specific moment of confusion and explain how you eventually understood it.**
 async/await was definitely the hardest part for me. at first, i didn't understand why my program was printing "instance of future<double>" instead of the actual number. i was confused because i thought the function would just wait naturally. it clicked for me when i realized that a future is like a placeholder or a promise.



**qr2. look at your task 1 solution. if you had to change your code to analyze a list of floating-point numbers (list<double>) instead of integers, how many places in your code would need to change? what does this tell you about the importance of thinking about data types during design?**
 i would have to change about 6 or 7 places. i'd need to update the list type in main, the parameter types in all four calculation functions, and the return types for findmax, findmin, and calculatesum. 


**qr3. in task 2, you simulated a network delay using future.delayed(). describe a real flutter app feature where you would need to actually await a real asynchronous operation — not just a simulated delay. what would the future resolve to, and what would happen to the ui while the user was waiting?**
a in a real app like a transaction tracker, i would need to await an api call to fetch the user's bank history from a server. the future would resolve to a list of transaction objects. while the user is waiting, the ui should show a loading screen or somethng. this prevents the user from thinking the app is broken and keeps the interface responsive while the data is downloading in the background.

**qr4. if a colleague asked you: 'why not just use a single function that takes the operation name as a parameter, rather than writing separate add(), subtract(), multiply(), and divide() methods?' — what would you say? are there advantages to both approaches?**
i would tell them that separate methods are much safer because you get help from the compiler and autocomplete. if you use a single function with a string parameter like "add", it is very easy to make a typo like "ad" which would cause a bug that is hard to find. the advantage of separate methods is clarity and safety. 