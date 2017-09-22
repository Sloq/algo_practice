#two sum
#will multiple indices sum to the target?
def two_sum(nums, target)
    (0..nums.length-2).each do |idx1|
        (idx1+1..nums.length-1).each do |idx2|
            if nums[idx1] + nums[idx2] == target
                return [idx1, idx2]
            end
        end
    end
end

#O(n^2)

#two sum in 2n or O(n) time using a hash
def hash_two_sum(nums, target)
    nums_hash = {}
    nums.each_with_index do |num, idx|
        paramore = target - num
        if nums_hash[paramore]
            return [nums_hash[paramore], idx]
        end
        nums_hash[num] = idx
    end
end

#O(n)

#add two numbers
#provided with two linked list
#sum each pair of nodes
#if a number exceeds 9 carry over the 1 to the next node
#value next
# def add_two_numbers(l1, l2)
#     l3 = {}
#     new_next = nil
#     roll_over = 0
#     current_a = l1
#     current_b = l2
#     until current_a == nil || current_b == nil
#         link_value = (current_a.val + current_b.val + roll_over) % 10
#         roll_over = (current_a.val + current_b.val)/10
#         new_node = ListNode.new(link_value)
#         new_node.next = new_next
#         new_next = new_node
#         current_a = current_a.next
#         current_b = current_b.next
#     end
#     new_next
#     flipped_link = nil
#     flipped_next = nil
#     until new_next == nil
#         flipped_link = ListNode.new(new_next.val)
#         flipped_link.next = flipped_next
#         flipped_next = flipped_link
#         new_next = new_next.next
#     end
#     flipped_link
# end

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def add_two_numbers(l1, l2)
    a_ended = false
    b_ended = false
    current_a = l1
    current_b = l2
    a_val = 0
    b_val = 0
    roll_over = 0
    sum_array = []
    until a_ended && b_ended && roll_over == 0
        if a_ended
            a_val = 0
        else
            a_val = current_a.val
            current_a = current_a.next
        end
        if b_ended
            b_val = 0
        else
            b_val = current_b.val
            current_b = current_b.next
        end
        sum_array.push((a_val + b_val + roll_over) % 10)
        roll_over = (a_val + b_val + roll_over)/10
        if !current_a
            a_ended = true
        end
        if !current_b
            b_ended = true
        end
    end
    sum_array.reverse!
    previous_node = nil
    node = nil
    sum_array.each do |val|
        node = ListNode.new(val)
        node.next = previous_node
        previous_node = node
    end
    node
end

a = ListNode.new(3)
b = ListNode.new(4)
b.next = a
c = ListNode.new(5)
c.next = b

p add_two_numbers(c, c)

#median of two sorted arrays

def find_median_sorted_arrays(nums1, nums2)
    small_length, large_length = nums1.length, nums2.length
    if small_length > large_length
        nums1, nums2, small_length, large_length = nums2, nums1, large_length, small_length
    end
    if large_length == 0
        raise ValueError
    end

    imin, imax, half_len = 0, small_length, (small_length + large_length + 1) / 2
    while imin <= imax
        i = (imin + imax) / 2
        j = half_len - i
        if i < small_length and nums2[j-1] > nums1[i]
            # i is too small, must increase it
            imin = i + 1
        elsif i > 0 and nums1[i-1] > nums2[j]
            # i is too big, must decrease it
            imax = i - 1
        else
            # i is perfect

            if i == 0
                max_of_left = nums2[j-1]
            elsif j == 0
                 max_of_left = nums1[i-1]
            else
                max_of_left = [nums1[i-1], nums2[j-1]].max
            end

            if (small_length + large_length) % 2 == 1
                return max_of_left
            end

            if i == small_length
                min_of_right = nums2[j]
            elsif j == large_length
                min_of_right = nums1[i]
            else
                min_of_right = [nums1[i], nums2[j]].min
            end

            return (max_of_left + min_of_right) / 2.0
        end
    end
end

# @return {String}
def longest_palindrome(s)
    longest = ""
    (s.length-1).downto(0) do |i|
        (0..i).each do |j|
            p i
            p j
            if s[j..i].reverse == s[j..i]
                if s[j..i].length > longest.length
                    longest = s[j..i]
                end
                if i+1-j >= (s.length/2 + 1)
                    return longest
                end
            end
        end
    end
    longest
end

# s = "hello"
# p longest_palindrome(s)

def convert(s, num_rows)
    return "" if num_rows == 0
    return s if num_rows == 1
    zigs = Array.new(num_rows) {Array.new}
    zig_row = 0
    i = 0
    while i < s.length
        p zigs
        if zig_row == num_rows
            zig_row -= 2
            while zig_row >= 0 && i < s.length
                zigs[zig_row] << s[i]
                zig_row -= 1
                i += 1
            end
            zig_row = 1
        end
        p zigs
        if i < s.length
            zigs[zig_row] << s[i]
        end
        zig_row += 1
        i += 1
    end
    p zigs
    zigs.join
end


convert("ABCDEF", 3)
