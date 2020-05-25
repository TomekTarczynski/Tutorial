Reinforcement learning (RL) is an area of machine learning concerned with how agents ought to take actions in an environment in order to maximize the notion of cumulative reward. 

Typical reinforcement learning scenario is as follows:
- An agent takes an action
- Environment returns to the agent the new state and the immediate reward

Reinforcement learning problems are often modeled by Markov Decision Process (MDP).
MDP consists of 4-tuple:
- S : Set of possible states (ex. all possible situation on board)
- A : Set of actions (ex. all possible moves that agent can make)
- M : Transition model T(s, a, s') = P(s'|s,a) which returns what is the probability that the state will change to s' if current state is s and action a was made.
- R(s, a, s') - the immediate reward after transition from state s into s' due to action a. Reward can be also modeled by R(s) and R(s, a)




Agent not necessarily receives full information about the state, sometimes he can observe only part of the state (for example: in poker you don't know the cards that your opponent holds). In such situation we will say that agent receives observation which is a subset of the state.

The purpose of RL is to find policy which is a function that for every state returns what action should be taken: <img src="https://render.githubusercontent.com/render/math?math=\pi(s)
\rightarrow a">
If the policy leads to maximum long term reward we will call it the optimal policy and it will be denoted by <img src="https://render.githubusercontent.com/render/math?math=\pi^{*}">.

Bellman equation:


 <img src="https://miro.medium.com/max/5032/1*CiDCpUjj_3mGm3vdGrxu4g.png" width="300px">

v(s) - value of a state


 <img src="https://miro.medium.com/max/1400/1*l8ZP4tTFqDGyezwJ8jR8eA.png" width = "800px"><p></p>
 
 Q(s, a) - quality of a an action

Plan - fixed sequence of actions
Return is discounted sum of future reward (geometric series)

Delayed rewards - often an agent is not receiving rewards after every action, but rather one reward at the end.

Temporal Credit assignment problem - It's the problem of figuring out which action in the history of actions is responsible for a particular reward.

Evaluation a learner:
- Value of returned policy
- Computation complexity
- sample complexity (how many interaction with environment learner needs)
- space complexity (how much space does the learner need)