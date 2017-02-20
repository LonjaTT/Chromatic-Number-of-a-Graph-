︠6227b770-f304-4deb-bf97-898ccc835a5es︠
#kombinacije vozlišč za k-obarvljiv graf z n vozlišči#

def kombinacije(k,n):
    z=n-k
    A=matrix(1,k)
    komb=[]
    for i in range(k):
        A[0,i]=1
    for j in range(z):
        x=matrix(1,k)
        for m in range(j+1):
            if m==0:
                x[0,m]=(z-j)
            else:
                x[0,m]=1
        komb.append(x+A)
        ali=True
        while ali:
            t=0
            desno=True
            while desno:
                if x[0,0]==x[0,t+1]:
                    t=t+1
                else:
                    desno=False
            spr2=False
            spr1=True
            for u in range(t+1,k):
                if (spr1)and not(spr2):
                    if x[0,u]==0:
                        ali=False
                        spr1=False
                    else:
                        if (x[0,u]+2)<=x[0,t]:
                            x[0,t]=x[0,t]-1
                            x[0,u]=x[0,u]+1
                            spr2=True
            if spr2:
                komb.append(x+A)
            else:
                ali=False
    return komb

kombinacije(4,5)
︡16d7da97-535d-4bf5-b89f-3ead9b2c0b60︡{"stdout":"[[2 1 1 1]]\n"}︡{"done":true}︡
︠b10607d7-856c-48db-ba6b-c6a72d304f21s︠
#M = množica velikosti množic točk n-obarvljivega grafa#
#npr. graf je 4 obarvljiv, M je lahko (1,1,1,3) kar pomeni, da ima graf 1 točko obarvano s 1. barvo, 1 točko z 2., 1 točko s 3. barvo in 3 točke s četrto barvo#
#M=(2,2,3,1)#

def pretvorivA(G):
    z = 1
    for P in G:
        for j in P:
            if j > z:
                z=j
    A=matrix(z)
    for (i,j) in G:
        A[(i-1),(j-1)]=1
        A[(j-1),(i-1)]=1
    return A

def pretvorivG(A):
    x=1
    G=[]
    for z in A:
        if x==1:
            m=len(z)
            x+=1
    for i in range(m):
        for j in range(i,m):
            if A[i,j]==1:
                G.append(((i+1),(j+1)))
    return G

def generiraj_polni(M):
    n=0
    k=0
    for i in M:
        k = k + 1
        n = n + i
    X=matrix(k,n)
    s=0
    for j in range(k):
        for z in range(M[j]):
            X[j,s]=1
            s=s+1
    G=[]
    for d in range(k):
        for e in range(n):
            if X[d,e]==1:
                for f in range(n):
                    if X[d,f]==0:
                        G=G+[((e+1),(f+1))]
    A=pretvorivA(G)
    return(A)

Z=kombinacije(4,6)
print Z

︡d363b621-efb0-463a-9971-b45824c31a9e︡{"stdout":"[[3 1 1 1], [2 2 1 1]]\n"}︡{"done":true}︡
︠060458c0-a4f0-4b57-9c69-479005bcc26fs︠

A=generiraj_polni([2,2,1,1])
G=Graph(A)
G.show()
︡51d79834-f38f-406b-85dc-9e74058fd422︡{"file":{"filename":"/projects/2092e14c-4655-4bee-abdd-9adeafacdd36/.sage/temp/compute0-us/20071/tmp_yXmIfJ.svg","show":true,"text":null,"uuid":"fb2b27da-fde6-4c61-815f-d44dcbc3659d"},"once":false}︡{"done":true}︡
︠f428a5b9-11ae-418d-97d0-a9293837da35s︠
G=((1,2),(2,4),(3,4))
Z=pretvorivA(G)
pretvorivG(Z)
︡3dc79446-3e8f-42e3-9fff-5dd402da75d1︡{"stdout":"[(1, 2), (2, 4), (3, 4)]\n"}︡{"done":true}︡










