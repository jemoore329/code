#require 'statistics2'

def ci_lower_bound(pos, n, confidence)
    if n==0
       return 0
    end

    z = 1.96 #Statistics2.pnormaldist(1-(1-confidence)/2)
    phat = 1.0*pos/n
    (phat + z*z/(2*n) - z * Math.sqrt((phat*(1-phat)+z*z/(4*n))/n))/(1+z*z/n)
end


puts ci_lower_bound(10,13,0.95)
puts ci_lower_bound(30,130,0.95)

