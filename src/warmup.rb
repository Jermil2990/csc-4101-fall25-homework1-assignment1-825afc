def fib(n)
    if n == 0 then
            return []
    elsif n == 1 then
            return [0]
    elsif n == 2 then
            return [0, 1]
    end
        
    array = [0, 1]
    for i in 2..(n - 1)
        array[i] = array[i - 1] + array[i - 2]
    end
    return array
end

def isPalindrome(n)
    strN = n.to_s
    strN == strN.reverse
end

def nthmax(n, a)
    sorted = a.uniq.sort.reverse
    sorted[n] || nil
end

def freq(s)
    return "" if s.empty?
    count = s.chars.tally
    count.max_by { |k, v| v}[0]
end

def zipHash(arr1, arr2)
    return nil unless arr1.length == arr2.length
    Hash[arr1.zip(arr2)]
end

def hashToArray(hash)
    hash.keys.map { |k| [k, hash[k]] }
end
