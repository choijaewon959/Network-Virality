# Network-Virality
Simulation of how information spreads with different initial variables. 



# How to use
1. Go to link https://ccl.northwestern.edu/netlogo/
2. Download the netlogo for desktop
3. Copy and paste the code from network.netlogo
4. Test the outcomes with different inputs of number of nodes in different topology of the information network, average node degree that represents the average number of neighbors of each node, initial outbreak size that represents the initial number of nodes(people) who have exposed to the information, probability of repost represents that estimated number value of willingness of people to repost the information.

# Inputs
To test the simulation reasonably similar to the real world, we used the numbers from statistics about people reading Donald Trump's twitter post.

1. Initial number of people reading Donald Trump's post.
2. Number of friends that each person has.
3. Probability that individuals would share it.
4. Totla number of people in the system.

# Expected Outcomes
1. Total Number of people that Donald Trump's post reaches(in addition to proportion of the population).
2. Finding out the factor the most influential variable that affects the total number of people who would have seen the post.

![screenshot](https://github.com/choijaewon959/Network-Viralityhttps://github.com/choijaewon959/Network-Virality

# Flow of our model
1. Ath the beginning, people who have initially shared the post are red in color.
2. The neighbor nodes (friends) will see it.
3. They can choose to share the post or not.
4. Node that initially shared the post will turn into green because node already made the decesion.
5. Iterate until no more post is shared.
