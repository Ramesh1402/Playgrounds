import UIKit


//Associated Type

protocol StringsCollection {
    var count: Int { get }
    subscript(index: Int) -> String { get }
    mutating func append(_ item: String)
}

protocol Collection {
    associatedtype Item
    var count: Int { get }
    subscript(index: Int) -> Item { get }
    mutating func append(_ item: Item)
}

struct UppercasaeStringsCollection: Collection {
    var container: [String] = []
    
    var count: Int {
        container.count
    }
    
    mutating func append(_ item: String) {
        guard !container.contains(item) else { return }
        container.append(item.uppercased())
    }
    
    subscript(index: Int) -> String {
        return container[index]
    }
}

struct FullIntegersCollection: Collection {
    var container: [Int] = []
    
    var count: Int {
        container.count
    }
    
    mutating func append(_ item: Int) {
        guard !container.contains(item) else { return }
        container.append(item)
    }
    
    subscript(index: Int) -> Int {
        return container[index]
    }
}

var upString = UppercasaeStringsCollection()
upString.append("hello")
upString.append("world")
upString.append("hello")

print(upString[0])
print(upString[1])
print(upString[2])

var fullInteger = FullIntegersCollection()
fullInteger.append(1)
fullInteger.append(2)
fullInteger.append(3)

print(fullInteger[0])
print(fullInteger[1])
print(fullInteger[2])

//func getCollection() -> some Collection {
//    return UppercasaeStringsCollection()
//}

var a: any Collection = FullIntegersCollection()

changeCollection(collection: a)
chnageCollection2(collection: a)

print(a)

func changeCollection<T: Collection>(collection: T) -> Int {
    return collection.count
}

func chnageCollection2(collection: any Collection) -> Int {
    return collection.count
}


//protocol StorageMechanism {
//    associatedtype TypeOfStorage
//}
//
//func implementingStorageFirst(_ mechanism: StorageMechanism) {
//    
//}
//
//func implementingStorageSecond<T: StorageMechanism>(_ mechanism: T) {
//        // ✅ Will Compile since we are now using generics
//    }
//    
//func implementingStorageThird(_ mechanism: some StorageMechanism) {
//        // ✅ Will Compile since we are now using some keyword
//}



func testA() {
    var animalOne: some Animal = Dog()
    
    //animalOne = Cat()
    
    testB(a: animalOne)
    
    let c = testC()
    c.makeSound()
    let d = testD()
    d.makeSound()
    
    
    
}

func testB(a: some Animal) {
    a.makeSound()
}

func testC() -> some Animal {
    let n = Int.random(in: 0...100)
    
    if n < 50 {
        return Dog()
    }
    else {
       return Dog()
    }
}

func testD() -> any Animal {
    let n = Int.random(in: 0...100)
    
    if n < 50 {
        return Dog()
    }
    else {
       return Tiger()
    }
}


protocol Animal {
    func makeSound()
}

struct Dog: Animal {
    func makeSound() {
        print("Dog Sound")
    }
    
    func dogg() { }
}

struct Cat: Animal {
    func makeSound() {
        print("Cat Sound")
    }
}

struct Tiger: Animal {
    func makeSound() {
        print("Tiger Sound")
    }
}
