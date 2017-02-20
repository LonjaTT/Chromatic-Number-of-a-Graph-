︠6227b770-f304-4deb-bf97-898ccc835a5es︠
#kombinacije vozlišč za k-obarvljiv graf z n vozlišči#

def kombinacije(k,n):
    z=n-k
    A=matrix(k,1)
    komb=()
    for i in range(k):
        A[i,0]=1
    for j in range(z):
        x=matrix(k,1)
        for m in range(j+1):
            if m==0:
                x[m,0]=(z-j)
            else:
                x[m,0]=1
        komb=komb+(x+A)
        ali=True
        while ali:
            t=0
            desno=True
            while desno:
                if x[0,0]==x[t+1,0]:
                    t=t+1
                else:
                    desno=False
            spr2=False
            spr1=True
            for u in range(t+1,k):
                if (spr1)and not(spr2):
                    if x[u,0]==0:
                        ali=False
                        spr1=False
                    else:
                        if (x[u,0]+2)<=x[t,0]:
                            x[t,0]=x[t,0]-1
                            x[u,0]=x[u,0]+1
                            spr2=True
            if spr2:
                komb=komb+(x+A)
            else:
                ali=False
    return komb

kombinacije(4,5)
︡2ce87745-a801-47a6-bada-1430d60d61e1︡{"stderr":"Error in lines 41-41\nTraceback (most recent call last):\n  File \"/projects/sage/sage-7.5/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 982, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 14, in kombinacije\nTypeError: can only concatenate tuple (not \"sage.matrix.matrix_integer_dense.Matrix_integer_dense\") to tuple\n"}︡{"stderr":"*** WARNING: Code contains non-ascii characters ***\n"}︡{"done":true}︡
︠b10607d7-856c-48db-ba6b-c6a72d304f21s︠
kombinacije(4,7)

︡0379b1b8-63c9-4cdf-a4ab-bf22ea1242e4︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/sage/sage-7.5/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 982, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 14, in kombinacije\nTypeError: can only concatenate tuple (not \"sage.matrix.matrix_integer_dense.Matrix_integer_dense\") to tuple\n"}︡{"done":true}︡









