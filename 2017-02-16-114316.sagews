︠e89881b1-7ceb-48dc-9852-58217bd41366s︠

G = graphs.PetersenGraph()
n = G.order()

p = MixedIntegerLinearProgram(maximization = False)
y = p.new_variable(binary = True)
x = p.new_variable(binary = True)
p.set_objective(sum(y[k] for k in range(n)))
for i in G.vertices():
    p.add_constraint(sum(x[i,k] for k in range(n)) == 1)
for i in G.vertices():
    for k in range(n):
        p.add_constraint(x[i,k] - y[k] <= 0)
for i, j in G.edges(labels = False):
    for k in range(n):
        p.add_constraint(x[i,k] + x[j,k] <= 1)
p.solve()
︡21a9365a-8ce7-4766-a14c-8fbfd28778e9︡{"stdout":"3.0\n"}︡{"done":true}︡









