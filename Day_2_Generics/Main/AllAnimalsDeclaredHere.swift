import Foundation

public class Pet {
    
    public var petName : String
    public var hungerLevel : Int
    
    internal init(petName: String, hungerLevel: Int) {
        self.petName = petName
        self.hungerLevel = hungerLevel
    }
    
    // Этот метод можно не смотреть т.к. я видимо тут просто практиковался в коде
    // Тут по сути просто ветвление логики и больше ничего
    public func feedThePet(foodAmount: Int){
        print("_____")
        guard hungerLevel > 0 else {
            print("Не можем покормить питомца т.к. его уровень голода: \(hungerLevel) - меньше или равен нулю")
            return
        }
        
        print("Собираемся покормить питомца, уровень голода питомца: \(hungerLevel) единиц еды, выдали еды петомцу: \(foodAmount) единиц еды")
        
        var actualFoodToBeFed = 0
        var foodLeftovers = 0
        
        if(foodAmount > hungerLevel){
            // Потом можно сделать что-то с профицитом выданной питомцу еды
            foodLeftovers = foodAmount - hungerLevel
            actualFoodToBeFed = foodAmount - foodLeftovers
        }else{
            actualFoodToBeFed = foodAmount
        }
        hungerLevel -= actualFoodToBeFed
        
        print("Покормили питомца, скормили ему \(actualFoodToBeFed) единиц еды, уровень голода стал: \(hungerLevel) единиц еды, осталось еды из выданной порции: \(foodLeftovers) единиц еды.")
    }
}

public class Cat : Pet{
    
}

public class Dog : Pet, Lockable{
    public func LockTheObject<T>(someObject: T) {
        if(type(of: someObject) == type(of: self)){
            print("Собака была закреплена для дальнейших действий")
        }else{
            print("Не можем закрепить собаку т.к. типы не совпадают")
        }
    }
}
