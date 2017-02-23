︠3c5bcf7a-0e10-4ccf-809a-4f114dea3e2ds︠
B=[[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
[1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1],
[1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1],
[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1],
[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0]]
A2I = lambda A:{u: [v for v, i in enumerate(r, start = 1) if i==1] for u,r in enumerate(A, start = 1)}
print A2I(B)

︡cdf25c8f-133c-4b88-bb45-944d9901c6c7︡{"stdout":"{1: [10, 11, 12, 13], 2: [10, 11, 12, 13], 3: [10, 11, 12, 13], 4: [10, 11, 12, 13], 5: [10, 11, 12, 13], 6: [10, 11, 12, 13], 7: [10, 11, 12, 13], 8: [10, 11, 12, 13], 9: [10, 11, 12, 13], 10: [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13], 11: [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13], 12: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13], 13: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]}\n"}︡{"done":true}︡
︠072013e2-d4e9-41e3-bb97-efb289ff835fs︠

class Graph(object):

    def __init__(self, graph_dict=None):
        # inicializira graf podan kot slovar povezav; če ni nič podano uporabi prazen slovar
        if graph_dict == None:
            graph_dict = {}
        self.__graph_dict = graph_dict
        
    def stevilo_v(self):
        #vrne stevilo vozlisc
        return len(self.__graph_dict)
    
    def vertices(self):
        # vrne vozlisca grafa
        return list(self.__graph_dict.keys())

    def edges(self):
        # vrne povezave grafa
        return self.__naredi_edges()

    
    def __naredi_edges(self):
        edges = []
        for zanka in self.__graph_dict:
            for sosedi in self.__graph_dict[zanka]:
                if {sosedi, zanka} not in edges:
                    edges.append({zanka, sosedi})
        return edges

    def __str__(self):
        res = "vertices: "
        for k in self.__graph_dict:
            res += str(k) + " "
        res += "\nedges: "
        for edge in self.__naredi_edges():
            res += str(edge) + " "
        return res





graph = Graph({1: [10, 11, 12, 13], 2: [10, 11, 12, 13], 3: [10, 11, 12, 13], 4: [10, 11, 12, 13], 5: [10, 11, 12, 13], 6: [10, 11, 12, 13], 7: [10, 11, 12, 13], 8: [10, 11, 12, 13], 9: [10, 11, 12, 13], 10: [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13], 11: [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13], 12: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 13: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]})
print("Vertices of graph:")
print(graph.vertices())
print("Stevilo vozlisc")
print(graph.stevilo_v())
print("Edges of graph:")
print(graph.edges())

    

G = Graph({1: [10, 11, 12, 13], 2: [10, 11, 12, 13], 3: [10, 11, 12, 13], 4: [10, 11, 12, 13], 5: [10, 11, 12, 13], 6: [10, 11, 12, 13], 7: [10, 11, 12, 13], 8: [10, 11, 12, 13], 9: [10, 11, 12, 13], 10: [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13], 11: [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13], 12: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 13: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]})
n = G.stevilo_v()

p = MixedIntegerLinearProgram(maximization = False)
y = p.new_variable(binary = True)
x = p.new_variable(binary = True)
p.set_objective(sum(y[k] for k in range(n)))
for i in G.vertices():
    p.add_constraint(sum(x[i,k] for k in range(n)) == 1)
for i in G.vertices():
    for k in range(n):
        p.add_constraint(x[i,k] - y[k] <= 0)
for i, j in G.edges():
    for k in range(n):
        p.add_constraint(x[i,k] + x[j,k] <= 1)
p.solve()
︡208ab078-e485-4bad-b464-10af49015eee︡{"stdout":"Vertices of graph:\n"}︡{"stdout":"[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]\n"}︡{"stdout":"Stevilo vozlisc\n"}︡{"stdout":"13\n"}︡{"stdout":"Edges of graph:\n"}︡{"stdout":"[set([1, 10]), set([1, 11]), set([1, 12]), set([1, 13]), set([2, 10]), set([2, 11]), set([2, 12]), set([2, 13]), set([10, 3]), set([11, 3]), set([3, 12]), set([3, 13]), set([10, 4]), set([11, 4]), set([12, 4]), set([4, 13]), set([10, 5]), set([11, 5]), set([12, 5]), set([5, 13]), set([10, 6]), set([11, 6]), set([12, 6]), set([13, 6]), set([10, 7]), set([11, 7]), set([12, 7]), set([13, 7]), set([8, 10]), set([8, 11]), set([8, 12]), set([8, 13]), set([9, 10]), set([9, 11]), set([9, 12]), set([9, 13]), set([10, 12]), set([10, 13]), set([11, 12]), set([11, 13])]\n"}︡{"stdout":"3.0"}︡{"stdout":"\n"}︡{"done":true}︡









