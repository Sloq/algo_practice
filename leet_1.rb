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