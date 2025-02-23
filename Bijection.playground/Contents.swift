import UIKit

/*
 
 * Given a pattern and a string str, find if str follows the same pattern.
 *  Here follow means a full match, such that there is a bijection between a letter in
 * pattern and a non-empty word in str.
 *
 * Examples:
 *
 * pattern = "abba", str = "dog cat cat dog" should return true.
 * pattern = "abba", str = "dog cat cat fish" should return false.
 * pattern = "aaaa", str = "dog cat cat dog" should return false.
 * pattern = "abba", str = "dog dog dog dog" should return false
 
 


1. pattern string pattern define - map character in pattern to each word in input
2. order each word to match pattern
3. compare input with ordered word
 
 */


// Online Swift compiler to run Swift program online
// Print "Try programiz.pro" message
print("Try programiz.pro")

func patternCheck(pattern: String, input: String) -> Bool {
    
    let patternCharacters = Array(pattern).map { String($0) }
    let inputWords = input.split(separator: " ").map { String($0) }
    
    print(patternCharacters)
    print(inputWords)
    if patternCharacters.count != inputWords.count { return false }
    
    var patternDict: [String: [Int]] = [:]
    
    for i in 0..<patternCharacters.count {
        if patternDict[patternCharacters[i]] != nil {
           var existing = patternDict[patternCharacters[i]]!
           existing.append(i)
           patternDict[patternCharacters[i]] = existing
        } else {
            patternDict[patternCharacters[i]] = [i]
        }
    }
    
    var inputDict: [String: [Int]] = [:]
    for i in 0..<inputWords.count {
        if inputDict[inputWords[i]] != nil {
           var existing = inputDict[inputWords[i]]!
           existing.append(i)
           inputDict[inputWords[i]] = existing
        } else {
            inputDict[inputWords[i]] = [i]
        }
    }
    
    var result = true
    for i in 0..<patternCharacters.count {
        let patternC = patternCharacters[i]
        let word = inputWords[i]
        
        if patternDict[patternC] != inputDict[word] {
            result = false
            break
        }
    }
    
    return result
    
}

let r = patternCheck(pattern: "abba", input: "dog cat cat dog")
let r1 = patternCheck(pattern: "abba", input: "dog cat cat fish")
let r2 = patternCheck(pattern: "aaaa", input: "dog cat cat dog")
let r3 = patternCheck(pattern: "abba", input: "dog dog dog dog")
let r4 = patternCheck(pattern: "abba", input: "dog cat cat dog")

print(r)
print(r1)
print(r2)
print(r3)
print(r4)
