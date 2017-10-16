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
    first_ended = false
    b_ended = false
    current_a = l1
    current_b = l2
    a_val = 0
    b_val = 0
    roll_over = 0
    sum_array = []
    until first_ended && b_ended && roll_over == 0
        if first_ended
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
            first_ended = true
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


# @param {String} s
# @return {Integer}
def roman_to_int(s)
    roman_hash = {
        I => 1,
        V => 5,
        X => 10,
        L => 50,
        C => 100,
        D => 500,
        M => 1000
    }
    partial_sum = 0
    sum = 0
    romans = s.chars
    # (0...romans.length).each do |idx|
    #     partial_sum += roman_hash[romans[idx]]
    #     if roman_hash[romans[idx+1]]
    i = 0
    while i < romans.length
        j = i + 1
        partial_sum += roman_hash[romans[i]]
        if j >= romans.length || roman_hash[romans[j]] < roman_hash[romans[i]]
            sum += partial_sum
            partial_sum = 0 
        else 
            sum -= partial_sum
            partial_sum = 0 
        end 
    end
    sum 
end

# find longest prefix

def longest_prefix(strs)
    return "" if strs.empty?
    return strs[0] if strs.count == 1
    return "" if strs.any? {|str| str == ""}
    idx = 0 
    prefix = ""
    while strs[0].length > idx
        possible = prefix + strs[0][x]
        if strs.all? {|str| str[idx] == strs[0][idx]}
            prefix = possible
            idx += 1
        else
            break
        end
    end
    prefix
end

# Given an array S of n integers, are there elements a, b, c in S
#  such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

# Note: The solution set must not contain duplicate triplets.

# very slow
def three_sum(arr)
   sums = arr.combination(3).select{|x,y,z| x+y+z==0}
    sums.map! {|arr| arr.sort!}
    uniq_sums = []
    sums.each {|arr| uniq_sums << arr unless uniq_sums.include?(arr)}
    uniq_sums
end

S = [0, 0, 0, 0, 0]
# p three_sum(S)

def valid_parens(str)
    stack = []
    parens = {"}" => "{", "]" => "[", ")" => "("}
    str.each_char do |chr|
        if parens.values.include?(chr)
            stack.push(chr)
        elsif parens.keys.include?(chr)
            if stack == [] || stack.pop != parens[chr]
                return false
            end 
        else 
            return false 
        end
    end
    stack == []
end

# p valid_parens("(({}))")
# p valid_parens("[(])")


    # def threeSum(self, nums):
    #     if len(nums) <3: # deal with special input
    #         return []
    #     elif len(nums) == 3:
    #         if sum(nums) == 0:
    #             return [sorted(nums)]


    #     nums = sorted(nums) # sorted, O(nlgn)
    #     ans = []

    #     for i in range(len(nums) -2):
    #         j = i+1
    #         k = len(nums) -1 # hence i < j < k

    #         while j<k: # if not cross line
    #             temp_sum = nums[i] + nums[j] + nums[k]
    #             if temp_sum == 0:
    #                 ans.append((nums[i], nums[j], nums[k]))

    #             if temp_sum > 0: # which means we need smaller sum, move k backward, remember we sort the array
    #                 k -= 1
    #             else:
    #                 j += 1

    #     return list(set(tuple(ans))) # I bet this is not the best way to eliminate duplicate solutions

def threesum(arr)
    return [] if arr.length < 3
    if arr.inject(:+) == 0 
        return [arr.sort!]
    end 
    arr = arr.sort!
    result = []
    (0..arr.length-3).each do |i|
        if i > 0 && nums[i] == nums[i-1] # avoid duplication
            continue
        end
        j = i + 1
        k = arr.length-1
        while j < k
            temp_sum = arr[i] + arr[j] + arr[k]
            if temp_sum == 0 
                result << [arr[i], arr[j], arr[k]]
            end
            if temp_sum > 0 
                k -= 1
            else
                j += 1
            end
        end
    end
    result.uniq
end

# p threesum([-1,0,1,2,-1,-4])

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
    return nil unless l1 || l2
    return l1 unless l2
    return l2 unless l1
    if l1.val > l2.val
        first, second = l2, l1
    else 
        first, second = l1, l2
    end
    new_head = ListNode.new(first.val)
    first = first.next
    mid_node = new_head
    while first || second
        if first && second && first.val && second.val
            if first.val > second.val
                temp_node = ListNode.new(second.val)
                second = second.next
                mid_node.next = temp_node
                mid_node = temp_node
            else
                temp_node = ListNode.new(first.val)
                first = first.next
                mid_node.next = temp_node
                mid_node = temp_node
            end
        elsif first
            temp_node = ListNode.new(first.val)
            first = first.next
            mid_node.next = temp_node
            mid_node = temp_node
        else
            temp_node = ListNode.new(second.val)
            second = second.next
            mid_node.next = temp_node
            mid_node = temp_node
        end
    end
    new_head
end

# p merge_two_lists(ListNode.new(1), ListNode.new(2))

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    return 0 if needle == ""
    (0..((haystack.length-1)-(needle.length-1))).each do |idx|
        if haystack[idx..idx+needle.length-1] == needle
            return idx
        end
    end
    -1
end