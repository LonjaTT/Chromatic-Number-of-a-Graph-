︠3c5bcf7a-0e10-4ccf-809a-4f114dea3e2d︠
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
        return self.__generate_edges()

    
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




graph = Graph({"1":["2", "3"], "2":["1","3"], "3":["1","2"], "4":["2","3"]})
print("Vertices of graph:")
print(graph.vertices())
print("Stevilo vozlisc")
print(graph.stevilo_v())
print("Edges of graph:")
print(graph.edges())


order
G = Graph({"1":["2", "3"], "2":["1","3"], "3":["1","2"], "4":["2", "3"]})
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
︡c6a22cd2-efa8-4c03-b801-59c409f2b9df︡{"stdout":"Vertices of graph:\n"}︡{"stdout":"['1', '3', '2', '4']\n"}︡{"stdout":"Stevilo vozlisc\n"}︡{"stdout":"4\n"}︡{"stdout":"Edges of graph:\n"}︡{"stdout":"[set(['1', '2']), set(['1', '3']), set(['3', '2']), set(['2', '4']), set(['3', '4'])]\n"}︡{"stdout":"<function order at 0x7f20f22a3aa0>\n"}︡{"stdout":"3.0\n"}︡{"done":true}︡









