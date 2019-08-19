module Chop
    class V1
        def chop(target, sorted_array)
            return -1 if sorted_array.length == 0
            lower_index = 0
            upper_index = sorted_array.length - 1
            sub_array = sorted_array[lower_index..upper_index]
            max_iters = Math::log(sorted_array.length, 2).ceil + 1
            max_iters.times do
                midpoint = (sub_array.length / 2.0).ceil - 1
                return lower_index + midpoint if sub_array[midpoint] == target
                target < sorted_array[midpoint] ? upper_index -= midpoint : lower_index += midpoint + 1
                sub_array = sorted_array[lower_index..upper_index]
            end
            -1
        end
    end
end
