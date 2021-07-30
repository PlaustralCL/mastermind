# Mastermind

## Description
Mastermind is a code breaking game between two players. One player creates a
secret code and the second person attempts to find the code. After each guess,
clues will be provided to guide the code breaker.

The game is traditionally played with colored pegs used for the code and smaller
red/ white pegs used to provide the clues. Since this is a game for the command line
using numbers instead of color names felt more practical.

This project was developed as part of [The Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/mastermind).

You can see a live demo on [Replit.com](https://www.replit.com)

The [code repository is on github](https://github.com/PlaustralCL/mastermind)

## Reflection
* The algorithm for giving the proper clues was surprisingly tricky
* The algorithm for solving Mastermind is fairly well known, but the step that says
"r emove from S any code that would not give the same response if the current guess were the code."
took a while to figure out how to implement. In the end, I compared the clues from
the current guess to each of the remaining possibilities in the set and removed the
ones that did not give the same clues. It initially felt like cheating, but since
you are not comparing the numbers to the actual code you are just taking advantage
of the computers best skills, quickly ding repetitive tasks.
* Still trying to get the hang of OOP. The use of objects and classes to organize my code.

## Future opportunities
* Add color to enhance the experience (but keep the numbers for data entry)
