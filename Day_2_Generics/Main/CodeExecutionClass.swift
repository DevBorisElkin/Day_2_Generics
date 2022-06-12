

import Foundation

// как выяснилось, мы можем исполнять код (то есть методы и функции) не только тот, который находятся внутри класса, но и тот, который находится просто в файле, конечно, для этого метод или функция не обязательно должны быть статическими
// Насколько я понял, все методы и весь код который находится вне классов, принадлежит "как-бы" ко всем файлам (иначе как мы вызываем его не обращаясь к классу или экземпляру класса), тут уже большую роль играют модификаторы доступа у переменных и методов

// Немного по терминологии, большинство ресурсов в интернете определяют это так: "функция" - блок кода, не привязана к классу, то есть может быть просто определена в файле
//  "метод" - функция, которая определена в классе (и соотвественно, принадлежит к нему)

// В любом случае в 90%+ блоки кода будут объявлены в классах, поэтому у нас будут почти всегда "методы"

// Рекоммендую посмотреть вводное видео по дженерикам
// https://www.youtube.com/watch?v=N_YHF-dtm-U&ab_channel=TheSwiftDevelopers

public func executeTheCode(){
    
    printValue(someValue: "Hello")
    printValue(someValue: 44)
    printValue(someValue: -2.5)
    
    printTwoValues(firstValue: 1, secondValue: "Hello")
    printTwoValues(firstValue: "Bla bla bla", secondValue: 44.1)
    
    var arrayOfInts = [1, 23, 43, 6, 2, -24, 2, -12]
    var arrayOfStrings = ["Hello", "There!", "Ha ha", "Another string"]
    var arrayOfDoubles = [2.5, 2.7, 1.0, 8.2, -76.2]
    
    printArray(someArray: arrayOfInts)
    printArray(someArray: arrayOfStrings)
    printArray(someArray: arrayOfDoubles)
    
    // Наверное следующий пример избыточный, но constraint'ы для дженериков - тесно связаны с наследованием и подпиской на протоколы (имплементированием протоколов)
    
    var someVeterinatian = Veterinarian()
    
    var pets = [Cat(petName: "Mysechka", hungerLevel: 4), Dog(petName: "Bobik", hungerLevel: 2), Cat(petName: "Boris", hungerLevel: 24)]
    
    // Полезная ссылка про кастинг
    // https://abhimuralidharan.medium.com/typecastinginswift-1bafacd39c99
    for pet in pets{
        
        // Тут проверили, является ли наш питомец именно собакой, т.к. именно собаку можно закрепить(т.к. собака имплементирует протокол Lockable - и после закрепления врач может ее вылечить т.к. метод лечения принимает любые классы которые являются питомцами, и имплементируют протокол Lockable)
        if pet is Dog{
            var dogPet = pet as! Dog
            someVeterinatian.cureThePet(somePet: dogPet)
        }
        
    }
}

// T = дженерик любого типа (максимально абстрактный), можно использовать любое название, то есть вместо "Т" использовать "Hello", "SomeType" "XYZ" и т.д. Если в дженериках указывается несколько значений, то общепринятые буквы для использования "T", "Y" и др.
public func printValue<T>(someValue : T){
    print(someValue)
}

public func printTwoValues<T,Y>(firstValue: T, secondValue: Y){
    print("firstValue: \(firstValue), secondValue: \(secondValue)")
}

public func printArray<T>(someArray : [T]){
    for element in someArray{
        print(element)
    }
}






