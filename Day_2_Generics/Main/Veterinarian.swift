//
//  Veterinarian.swift
//  Day_2_Generics
//
//  Created by test on 11.06.2022.
//

import Foundation

public class Veterinarian{
    
    // Тут ограничили объект типом Pet
    // Также ограничили объект протоколом "Lockable", притворяемся, что чтобы вылечить питомца,
    // его перед этим нужно закрепить(установить неподвижно) на одном месте
    // это значит что в классе, который наследует протокол Lockable, должен быть определен метод, который
    // будет закреплять этот объект
    // Также символ "&" используется чтобы показать в констраинтах несколько типов для ограничения
    public func cureThePet<T : Pet & Lockable>(somePet : T){
        somePet.LockTheObject(someObject: somePet)
        
        
        print("\(somePet.petName) был вылечен")
    }
    
    
    
}

public protocol Lockable{
    // Можно было бы и не указывать 
    func LockTheObject<T>(someObject: T)
}
