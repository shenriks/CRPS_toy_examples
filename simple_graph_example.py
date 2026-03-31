import numpy as np
import networkx as nx
import matplotlib.pyplot as plt

# Define adjacency matrix for 5 nodes
# Node indices: 0, 1, 2, 3, 4 (corresponding to 1-5)
adj_matrix = np.zeros((5, 5), dtype=int)
adj_matrix[0, 1] = 1  # 1 -> 2
adj_matrix[1, 2] = 1  # 2 -> 3
adj_matrix[2, 3] = 1  # 3 -> 4
adj_matrix[2, 4] = 1  # 3 -> 5

# Create directed graph from adjacency matrix
G = nx.from_numpy_array(adj_matrix, create_using=nx.DiGraph)

# Plot the graph
plt.figure(figsize=(5, 4))
pos = nx.spring_layout(G, seed=42)
nx.draw(G, pos, with_labels=True, node_color='lightblue', arrows=True, node_size=700)
plt.title('Simple Directed Graph (1→2→3→4, 3→5)')
plt.show() 