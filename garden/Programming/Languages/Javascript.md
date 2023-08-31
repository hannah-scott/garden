---
title: "Javascript"
---


#code #javascript 

## Example

```js
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(nums, target) {
  for (var i = 0; i < nums.length; i++) {
    var complement = target - nums[i];
    for (var j = i + 1; j < nums.length; j++) {
      if (complement == nums[j]) {
        return [i, j];
      }
    }
  }
};
```