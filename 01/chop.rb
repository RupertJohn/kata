module Chop
    class V1
        def chop(target, sorted_array)
            return -1 if sorted_array.length == 0
            lower_index = 0
            upper_index = sorted_array.length - 1
            sub_array = sorted_array[lower_index..upper_index]
            max_iters = Math::log(sorted_array.length, 2).ceil + 1 # It shouldn't need more than this to complete if it's constantly halving the array
            max_iters.times do
                midpoint = (sub_array.length / 2.0).ceil - 1
                return lower_index + midpoint if sub_array[midpoint] == target
                target < sorted_array[midpoint] ? upper_index -= midpoint : lower_index += midpoint + 1
                sub_array = sorted_array[lower_index..upper_index]
            end
            -1
        end
    end

    class V2
        def chop(target, sorted_array)
            return -1 if sorted_array.length == 0
            midpoint = (sorted_array.length / 2.0).ceil - 1
            return midpoint if target == sorted_array[midpoint]
            return 0 if sorted_array.length == 1
            index = target < sorted_array[midpoint] ? chop(target, sorted_array[0..midpoint - 1]) : midpoint + 1 + chop(target, sorted_array[midpoint + 1..-1])
            sorted_array[index] == target ? index : -1
        end
    end
end
