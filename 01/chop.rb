module Chop
    class V1
        attr_accessor :target, :sorted_array, :lower_index, :upper_index

        def initialize(target, sorted_array)
            @target = target
            @sorted_array = sorted_array
            @lower_index = 0
            @upper_index = sorted_array.length - 1
        end

        def chop
            return -1 if sorted_array.length == 0
            sub_array = sorted_array[lower_index..upper_index]
            max_iters = Math::log(sorted_array.length, 2).ceil + 1 # It shouldn't need more than this to complete if it's constantly halving the array
            max_iters.times do
                midpoint = (sub_array.length / 2.0).ceil - 1
                return self.lower_index + midpoint if sub_array[midpoint] == target
                self.target < self.sorted_array[midpoint] ? self.upper_index -= midpoint : self.lower_index += midpoint + 1
                sub_array = self.sorted_array[self.lower_index..self.upper_index]
            end
            -1
        end
    end

    class V2
        attr_accessor :target, :sorted_array, :lower_index, :upper_index

        def initialize(target, sorted_array)
            @target = target
            @sorted_array = sorted_array
            @lower_index = 0
            @upper_index = sorted_array.length - 1
        end

        def chop
            return -1 if sorted_array[lower_index..upper_index].length == 0
            midpoint = lower_index + (sorted_array[lower_index..upper_index].length / 2.0).ceil - 1
            return midpoint if target == sorted_array[midpoint]
            return -1 if sorted_array[lower_index..upper_index].length == 1
            target < sorted_array[midpoint] ? self.upper_index = midpoint - 1 : self.lower_index = midpoint + 1
            chop
        end
    end
end
