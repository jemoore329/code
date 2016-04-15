

def bayes( pa,p_nota,bga,bg_nota ):
    
    num = bga * pa
    denom = (bga * pa + bg_nota * p_nota)
    return (num / denom) * 100


lw = 0.75
w = 0.5
lm = 0.15
m =0.5
print "long hair"
print bayes(w,m,lw,lm)


wc = 0.90
mc = 0.20
print "cosmo"
print bayes(w,m,wc,mc)


pea = 0.8
penota = 0.3
pa = .1
pnota = .9
print "date"
print bayes(pa, pnota,pea,penota)
