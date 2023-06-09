
"""
plotSolutionCluster

This function allow us to plot in the same color the clusters

# Parameters

*`graph` : the kep graph
*`clusterUsefull` : The cluster with |cluster|>=2
"""
function plotSolutionCluster(graph, clusterUsefull, list_uselessCycles=[])
    n_node = nv(graph)
    n_edge = ne(graph)

    len = length(Graphs.vertices(kep_graph)) + length(list_uselessCycles)
    nodelabel = [v for v in 1:1:len if v ∉ list_uselessCycles]
    
    membership_node = [1 for v in Graphs.vertices(kep_graph)]
    k = 2 
    for (keys, values) in clusterUsefull
        for value in values
            membership_node[value] = k
        end
        k += 1
    end
    # permet de définir une taille pour les noeuds


    nodecolor = [colorant"lightgrey", colorant"orange", colorant"red", colorant"yellow", colorant"black", colorant"pink", colorant"purple", colorant"brown"]
    nodefillc = nodecolor[membership_node]

    # edgestrokec = nodecolor[membership_edge]
    # edgestrokec=edgestrokec,

    # nodefillc=nodefillc,
    return gplot(kep_graph,
        nodelabel=nodelabel,
        nodefillc=nodefillc,
        nodelabeldist=1.5,
        nodelabelangleoffset=π/4,
        layout=circular_layout)
end
;

"""
plot_graph

This function allow us to plot a graph

# Parameters
*`kep_graph` : the kep graph
*`list_uselessCycles` : node deleted
"""
function plot_graph(kep_graph, list_uselessCycles=[])
    len = length(Graphs.vertices(kep_graph)) + length(list_uselessCycles)
    nodelabel = [v for v in 1:1:len if v ∉ list_uselessCycles]
    gplot(kep_graph,
    nodelabel=nodelabel,
    nodelabelangleoffset=π/4,
    layout=circular_layout)
end;