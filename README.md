# Smartie Challange

![image of smarties arranged in columns](https://user-images.githubusercontent.com/4499581/53914116-cb139700-4054-11e9-8e9a-40e3fc1a1c9d.jpg)

The aim of this software challange is to understand your current level of expertise through a fun project.

We are going to do this in three ways. 

* You’ll be invited to show us what you can do by taking on our technical challenge
* A WhiteHat Coach will have a short conversation with you about your experience
* You’ll have the opportunity to present your work at the end of the main session to the rest of the group 

The day is not a test so please relax and enjoy yourself, we are really excited about spending the day with you and getting to know you.

## The Technical Challenge

Can you model an arrangement of smarties in software (see above)? You can use any language or framework you wish. We want you to show us what you can do using best practice as you understand it.

Below are a few specifications you must meet:

Our coach will want to eat one of your smarties, so please provide a way for him to “eat” any one of the smarties he chooses. If he "eats" a smartie it should no longer be counted, visible or eatable.

He will want to ask how many smarties of a particular colour there are?

Your code will be deployed. He will want to run your code on his computer, without you present, at some point in the future.

You will have at least 4 hours to work on your solutions. During that time our Software Engineering Coach will come and talk to you to each individually.

## Plenary Session

The day will conclude with each of you presenting your solution to the rest of the group. It does not matter if you do not finish the task. We are just trying to get a sense of your current level of expertise so we can tweak our programme to make it work for you! 

[![screen shot of my attempt at this](https://user-images.githubusercontent.com/4499581/53914952-b932f380-4056-11e9-88cc-df5c001501c4.jpg)](http://spiky-drop.surge.sh)

## Reflections

So I tacked this using Elm. The hardest thing to get right was the data model. I actually ended up with two different data structures. The first is a `Dict` which holds the number of visible smarties. This is the data structure from which the counts of the smartie colors are drawn. When you click on a smartie this number is decremented, only down to zero. The second structure is the arrays of smarties that you actually see in the browser. One thing I really wanted to capture was the smartie you click on disappears, but the others stay in place - like when I eat one off the table in 'the real'.

Thats quite hard. Think about it. I wanted to avoid clicking on a smartie, but then the one on the very end disappears. Elm is actaully fun. The feeling when your code compiles and runs is very satisfying. I find the restrictive Debug logging, compaired to javascript hard. I find I want to see everything, but you cant just console.log anything out.

[spiky-drop.surge.sh](http://spiky-drop.surge.sh)
