## Solution set

### These are common algorithm problems and solutions in swift


### Contains Duplicate

Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
 
Example 1:

Input: nums = [1,2,3,1]

Output: true

Explanation:

The element 1 occurs at the indices 0 and 3.

Example 2:

Input: nums = [1,2,3,4]

Output: false

Explanation:

All elements are distinct.

Example 3:

Input: nums = [1,1,1,3,3,4,3,2,4,2]

Output: true

Constraints:

1 <= nums.length <= 105
-109 <= nums[i] <= 109

#### Solution

```swift 
class ContainsDuplicate {

    func containsDuplicate(_ nums: [Int]) -> Bool {
        let arr = nums
        var numSet = Set<Int>()
        for number in arr {
            if numSet.contains(number) {
                return true
            }
            numSet.insert(number)
        }
        return false
    }
}
