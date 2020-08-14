# XY-Model
This repository contains codes for XY model in 2D lattice and Small World Network
### Build Watts-Strogatz Small World Graph Model
This function is already availible in MathWork. the link to this function is added below the description.
The Watts-Strogatz model is a random graph that has small-world network properties, such as clustering and short average path length.

Algorithm Description
Creating a Watts-Strogatz graph has two basic steps:
1. Create a ring lattice with N nodes of mean degree $2K$. Each node is connected to its K nearest neighbors on either side.

2. For each edge in the graph, rewire the target node with probability ß. The rewired edge cannot be a duplicate or self-loop.

After the first step the graph is a perfect ring lattice. So when ß = 0, no edges are rewired and the model returns a ring lattice. In contrast, when ß = 1, all of the edges are rewired and the ring lattice is transformed into a random graph.

The file WattsStrogatz.m implements this graph algorithm for undirected graphs. The input parameters are N, K, and beta according to the algorithm description above.
reference: 
[MathWorks_Watts-Strogatz Small World Graph Model](https://www.mathworks.com/help/matlab/math/build-watts-strogatz-small-world-graph-model.html)

The algorithm behind the model is the following: 
(1) Start with order: Start with a ring lattice with N nodes in which every node is connected to its first K neighbors (K/2 on either side). In order to have a sparse but connected network at all times, consider N >> K >> ln(N) >> 1.
(2) Randomize: Randomly rewire each edge of the lattice with probability p such that self-connections and duplicate edges are excluded. This process introduces pNK/2 long-range edges which connect nodes that otherwise would be part of different neighborhoods. By varying p one can closely monitor the transition between order (p50) and randomness (p51).

reference:
[Albert R, Barabási AL. Statistical mechanics of complex networks. Reviews of modern physics. 2002 Jan 30;74(1):47.](https://arxiv.org/pdf/cond-mat/0106096.pdf)

### XY Model
In the classical xy-model, the variables are two-dimensional unit vectors ~si on each lattice site, equivalent to an angle θ. This model is a limiting case of the Heisenberg spin model. The vectors correspond to the directions of spins (originally quantum mechanical) in a material in which the z-component of spins couples less than the x and y components. (The opposite case leads to the Ising model.)


reference
[XY Model](https://itp.tugraz.at/MML/isingxy/isingxy.pdf)


