def my_reject(arr, &prc)
  rejected = []
  arr.each { |el| rejected << el unless prc.call(el) }
  rejected
end

def my_one?(arr, &prc)
  true_counts = arr.count { |el| prc.call(el) }
  true_counts == 1
end

def hash_select(hash, &prc)
  new_hash = {}
  hash.each { |k, v| new_hash[k] = v if prc.call(k, v) }
  new_hash
end

def xor_select(arr, prc_1, prc_2)
  xor_selected = []

  arr.each do |el|
    if (prc_1.call(el) || prc_2.call(el)) && 
      !(prc_1.call(el) && prc_2.call(el))
        xor_selected << el
    end
  end

  xor_selected
end

def proc_count(value, procs)
  procs.count { |prc| prc.call(value) }
end