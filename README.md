#Storehouse
####What is Storehouse?
Storehouse is a random, slowly being worked on, alternative to using `NSUserDefaults` for storing persistent data on iOS devices. Why? I just kind of felt like it.

Storehouse is written in Swift 3.0.

#### Usage
##### Creating a Storehouse
```swift
let storehouse = Storehouse(houseName: "StorageForAll")
```

##### Storing to the Storehouse
```swift
let container = StoreContainerString(name: "Character Fact",
                                     value: "Junkrat is the best.")

do {
    try storehouse.store(container: container)
}
catch {
    print("Something went wrong: \(error)")
}
```

##### Getting data from the Storehouse
```swift
let container: StoreContainerString
do {
   container = storehouse.get(containerNamed: "Character Fact")
}
catch {
    print("Something went wrong: \(error)")
}

print("Fun Overwatch Character Fact: \(container.value)")
```

##### Removing data from Storehouse
```swift
storehouse.bin(container: container)
```

##### Delete the Storehouse?
```swift
storehouse.demolishStorehouse()
```
Just know... this will change...

#### What is the StoreContainer?
The `StoreContainer` class that has a generic value type for it's property `value`.
As long as the value type conforms to the `DataStorable` protocol, you can store custom objects.

The following types already support the `DataStorable` protocol for convenience:
* `Int`       as `StoreContainerInt`)
* `UInt`      as `StoreContainerUInt`)
* `Bool`      as `StoreContainerBool`)
* `Float`     as `StoreContainerFloat`)
* `Double`    as `StoreContainerDouble`)
* `String`    as `StoreContainerString`)
* `Character` as `StoreContainerCharacter`)
