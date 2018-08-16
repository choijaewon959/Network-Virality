# Network-Virality
Simulation of how information spreads in network theories with different initial variables. This can be used to test which inputs have the most significant influence over the total number of people who would have seen the twitter post after a few time, regarding the fact that post normally would not spread after a long time.

# How to use
1. Go to link https://ccl.northwestern.edu/netlogo/
2. Download the netlogo for desktop
3. Copy and paste the code from network.nlogo in this repository
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

![screenshot](https://github.com/choijaewon959/Network-Virality/blob/master/Simulation_screenshot.PNG)
red: a person who has shared the post
green: a person who has seen the post, so already decided whether to share the post or not.
blue: a person who has not seen the post yet.
* different shapes of node represent the different topology.

# Flow of our model
1. Ath the beginning, people who have initially shared the post are red in color.
2. The neighbor nodes (friends) will see it.
3. They can choose to share the post or not.
4. Node that initially shared the post will turn into green because node already made the decesion.
5. Iterate until no more post is shared.

# default constants
* Number of node = 500
* Average Node Degree = 1%
* Initial outbreak size = 5%
* Probability of repost = 30%
* Probability of unpost = 70% (1 - probability of repost)

# Results
* Number of green Nodes at the end = the total number of people who have seen the post
* The most significant input = initial outbreak size
![results](https://github.com/choijaewon959/Network-Virality/blob/master/Simulation_result.PNG)

# Limitations
One is that the population is assumed to be a mere 500 in our simulation model. In reality, however, the total number of Twitter users have reached 330 million as of the third quarter of 2017. Similarly, the initial size and the probability of reposting in the model may deviate significantly from the real-world values, as they are chosen based on our subjective judgements. Another limitation is that, in our model, every node has the same number of node degree. On the contrary, the real world resembles a small-world network, where a few people are hugely influential while the majority have little influence. Also, as we all know, people are less likely to share a post as time elapses. The value we have chosen for this decrease in the probability of sharing may not correspond to the real-world value.

# References
The Structural Virality of Online Diffusion (Sharad Goel, Ashton Anderson, Jake Hofman, Duncan J. Watts, 2016)

McPherson, M., Lovin, L. & Cook, J. Birds of a feather: Homophily in social 􀀀networks. Annual Review of Sociology 27, 415–444 (2001)

Centola, D. An experimental study of homophily in the adoption of health 􀀀behavior. Science 334, 1269–1272 (2011)

Twitter-retweet-stats. (2017, February 09). Retrieved December 05, 2017, from https://sysomos.com/inside-twitter/twitter-retweet-stats/

Virality Prediction and Community Structure in Social Networks (Lilian Weng, Filippo Menczer & Yong-Yeol Ahn, 2013)

Statistica. 2017. Number of monthly active Twitter users worldwide from 1st quarter 2010 to 3rd quarter 2017 (in millions). Retrieved from https://www.statista.com/statistics/282087/number-of-monthly-active-twitter-users
