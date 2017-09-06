#  Alice and Bob each created one problem for HackerRank. A reviewer rates the two challenges, awarding points on a scale from  to  for three categories: problem clarity, originality, and difficulty.

# We define the rating for Alice's challenge to be the triplet , and the rating for Bob's challenge to be the triplet .

# Your task is to find their comparison points by comparing  with ,  with , and  with .

# If , then Alice is awarded  point.
# If , then Bob is awarded  point.
# If , then neither person receives a point.
# Comparison points is the total points a person earned.

# Given  and , can you compare the two challenges and print their respective comparison points?

# Input Format

# The first line contains  space-separated integers, , , and , describing the respective values in triplet . 
# The second line contains  space-separated integers, , , and , describing the respective values in triplet .

# Constraints

# Output Format

# Print two space-separated integers denoting the respective comparison points earned by Alice and Bob.


 
 def solve(a0, a1, a2, b0, b1, b2)
    # Complete this function
    a = 0
    b = 0 
    alice_score = [a0, a1, a2]
    bob_score = [b0, b1, b2]
    alice_score.each_index do |idx|
        if alice_score[idx] > bob_score[idx]
            a += 1
        elsif bob_score[idx] > alice_score[idx]
            b += 1
        end
    end
    [a, b]
end

def diag_diff(n, arr)
    left_diag = 0
    right_diag = 0 
    (0..n-1).each do |idx|
        p (idx*n) + idx
        left_diag += arr[(idx*n) + idx]
        p ((idx+1)*n) - idx
        right_diag += arr[((idx+1)*n) - (idx+1)]
    end
    (left_diag - right_diag).abs
end

def new_diag(n, arr)
    left_diag = 0 
    right_diag = 0 
    arr.each_with_index do |sub_arr, idx|
        left_diag += sub_arr[idx]
        right_diag += sub_arr[(n-1) - idx]
    end
    (left_diag - right_diag).abs
end    


# given an array of integers return an array of the decimal fraction positive, negative, and zero


#create counters for each variable, incriment up each counter if the value is pos, neg, or zero respectively
#in the end return an array of all the values
def value_fractions(n, arr)
    pos = 0
    neg = 0 
    zero = 0 
    arr.each do |val|
        if val > 0 
            pos += 1
        elsif val < 0 
            neg += 1
        else
            zero += 1
        end
    end
    ['%.6f' % (10/2.to_f), (neg.to_f/n).round(6), (zero.to_f/n).round(6)]
end

def hashtag_staircase(n)
    (1..n).each do |val|
        puts (" " * (n-val)) + ("#" * val)
    end
end

p hashtag_staircase(6)