def fib(n)
    # (Integer) -> Array
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2

    seq = fib(n - 1)
    fib_Nums = seq[-2] + seq[-1]
    seq << fib_Nums
    return seq
end

def isPalindrome(n)
    # (Integer) -> Bool
    n_str = n.to_s
    return n_str == n_str.reverse
end

def nthmax(n, a)
    # (Integer, Array) -> Integer or nil
    if n < 0 || n >= a.length
        return nil
    end

    sorted_array = a.sort.reverse
    return sorted_array[n]
end

def freq(s)
    # (String) -> String
    return '' if s.empty?

    max_char = ''
    max_count = 0
  
    s.each_char do |char|
      count = s.count(char)
      if count > max_count
        max_char = char
        max_count = count
      end
    end

    return max_char
end

def zipHash(arr1, arr2)
    # (Array, Array) -> Hash or nil
    if arr1.length != arr2.length
        return nil
    end
    
    result_hash = {}
    arr1.each_index do |i|
        result_hash[arr1[i]] = arr2[i]
    end
    
    return result_hash
end

def hashToArray(hash)
    # (Hash) -> Array
    keys = hash.keys
    result_array = []
  
    keys.each do |key|
      result_array << [key, hash[key]]
    end
  
    return result_array
end
