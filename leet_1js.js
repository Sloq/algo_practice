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


