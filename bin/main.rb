#!/usr/bin/env ruby

#ruby 2.5.1

def isPrime(n, prime, id, result)
    if (n >= 4)
        return result;
    end
    r = result | (id == prime[n] ? 1 : 0);
    return isPrime(n+1, prime, id, r);
end

def isPrimeFactor(n, prime, id, result)
    if (n >= 4)
        return result;
    end
    r = result & (id % prime[n] != 0 ? 1 : 0);
    return isPrimeFactor(n+1, prime, id, r);
end


def mapPrime(id)
    result = 1
    prime = [2,3,5,7];
    if (isPrime(0, prime, id, 0) == 1)
        return result == 1 ? id : 0;
    end
    b = Math.sqrt(id)
    c = b.floor()
    r = isPrimeFactor(0, prime, id, 1);
    r &= (b - c != 0 ? 1 : 0);
    return r == 1 ? id : 0;
end

def main()
    i = 10
    puts "[INPUT] %d" % i

    o = Array.new(i-1, 0)
    .map.with_index(){ |v,k| mapPrime k }
    .select{ |v| v > 0 }
    puts "[OUTPUT] %s" % o.join(", ")

end

main
