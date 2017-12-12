// two sum
const twoSum = (arr, target) => {
    const lookupHash = {};
    let paramour;
    for (let i = 0; i < arr.length; i++) {
        paramour = target - arr[i];
        if (lookupHash[paramour] != undefined) {
            return [lookupHash[paramour], i]
        }
        lookupHash[arr[i]] = i
    }
}


//longest non repeating continuous substring
def length_of_longest_substring(s)
    s_array = s.split(//);
    dic = Hash.new;
    max_length = 0;
    start = 0;
    temp_length = 0;
    index = 0;
    s_array.each do |val|
        if dic.has_key?(val) then
            ret = dic[val];
            dic[val] = index;
            
            if ret<start then
               temp_length += 1;
            else
               start = ret + 1;
               temp_length = index - start + 1;
            end
        else
            temp_length += 1;
            dic[val] = index;
        end
        
        if temp_length > max_length then
            max_length = temp_length;
        end
        
        index += 1;
    end
    return max_length;
end

var generate = function(numRows) {
    let triangle = [[1], [1, 1]];
    if (numRows < 3) {
        return triangle.slice(0, numRows);
    }
    
    while (numRows > 2) {
        let last = triangle.slice(-1)[0];
        let newArr = [1];
        for (i = 0; i < last.length-1; i++) {
            newArr.push(last[i] + last[i+1]);
        }
        newArr.push(1);
        numRows -= 1;
        triangle.push(newArr);
    }
    return triangle;
};


console.log(generate(5));
