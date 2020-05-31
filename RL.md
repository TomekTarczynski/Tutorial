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

There are 3 ways to create policy:

1. Model based - algorithm that tries to understand the world and create a model to represent it (approximation of transition model)
2. Model free -  algorithm that estimates the optimal policy without using or estimating the dynamics (transition and reward functions) of the environment.
3. Policy search

If an agent is making a prediction about the next state and the reward then this is model based.

### TD(<img src="https://render.githubusercontent.com/render/math?math=\lambda">) algorithm

Temporal difference is an agent learning from an environment through episodes with no prior knowledge of the environment. This means temporal difference takes a model-free or unsupervised learning approach. You can consider it learning from trial and error.

**TD(0) algorithm:**

- Agent was in state <img src="https://render.githubusercontent.com/render/math?math=s_{t-1}"> and moved to state <img src="https://render.githubusercontent.com/render/math?math=s_{t}"> and got reward <img src="https://render.githubusercontent.com/render/math?math=R(s_{t})">
- In TD(0) algorithm only the value of the state from which agent was moving will be updated (state <img src="https://render.githubusercontent.com/render/math?math=s_{t-1}">)
- Previous estimation of values of states <img src="https://render.githubusercontent.com/render/math?math=s_{t-1}"> and <img src="https://render.githubusercontent.com/render/math?math=s_{t}"> were <img src="https://render.githubusercontent.com/render/math?math=V_{t-1}(s_{t-1})"> and <img src="https://render.githubusercontent.com/render/math?math=V_{t-1}(s_{t})">
- <img src="https://render.githubusercontent.com/render/math?math=\alpha_{t}"> is the learning rate during step t
- The new estimation of the value of the state <img src="https://render.githubusercontent.com/render/math?math=s_{t-1}"> is <img src="https://render.githubusercontent.com/render/math?math=V_{t}(s_{t-1})"> and is calculate as:

<img src="https://render.githubusercontent.com/render/math?math=V_{t}(s_{t-1})=V_{t-1}(s_{t-1})%2B\alpha_{t}(R(s_{t})%2B\gamma *V_{t-1}(s_{t})-V_{t-1}(s_{t-1}))">

It can be interpreted as:

New value  = old value + learning rate * (reward + discounted value of new state - old value)

If we want to move quickly then we could do:

*New value = reward + discounted value of new state*

That would lead to very fast changes therefore similarly to neural networks we are moving slightly into this direction (slightly is represented by learning rate).

**TD(1) algorithm**

- This algorithm updates value of states after the episode is finished.
- Instead of looking at the immediate reward and the estimate of the value of next state it looks at all future rewards (of course they are discounted)

<img src="https://render.githubusercontent.com/render/math?math=V_{T}(s_{t})=V_{T-1}(s_{t})%2B\alpha_{t}(G_{t} - V_{T-1}(s_{t}))">

Where <img src="https://render.githubusercontent.com/render/math?math=G_{t}"> is sum of discounted all future rewards



TD(<img src="https://render.githubusercontent.com/render/math?math=\lambda">) is more generic case of this algorithm. When TD(<img src="https://render.githubusercontent.com/render/math?math=\lambda">) is 0 it gives TD(0) and when it is 1 it gives TD(1).

**Learning rate should be decreasing!**