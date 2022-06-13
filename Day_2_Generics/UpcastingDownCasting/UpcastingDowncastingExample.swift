//
//  UpcastingDowncastingExample.swift
//  Day_2_Generics
//
//  Created by test on 13.06.2022.
//

import Foundation

// Не забываем про эту статью, очень полезно, рекоммендую прочитать до конца
// https://abhimuralidharan.medium.com/typecastinginswift-1bafacd39c99
public func castingExample(){
    print("_____Showing casting example_____")
    var elements = [A(), B(), C(), D()]
    
    // this thing will print: A, B, B, B because with that order C and D variables are indeed siblings of B class, to show it right we need to use the one example below
//    for element in elements{
//        switch element{
//        case let obj as A:
//            print("element is A")
//            break
//        case let obj as B:
//            print("element is B")
//            break
//        case let obj as C:
//            print("element is C")
//            break
//        case let obj as D:
//            print("element is D")
//            break
//        default:
//            print("unknown type")
//        }
//    }
    
    // Предыдущий пример всё показыал правильно, но в таком порядке проверки мы можем получить точный тип наших переменных
    for element in elements{
        switch element{
        case let obj as D:
            print("element is D")
            obj.dClass()
            break
        case let obj as C:
            print("element is C")
            obj.cClass()
            break
        case let obj as B:
            print("element is B")
            obj.bClass()
            break
        case let obj as A:
            print("element is A")
            obj.aClass()
            break
        default:
            print("unknown type")
        }
    }
    
    print("_____")
    
    // можно посмотреть также тут
    // https://stackoverflow.com/questions/29637974/whats-the-difference-between-as-as-and-as
    
    var a = A()
    
    // конвертация из класса А в класс родитель всегда безопасна, проверяется еще во время компиляции
    // 1) Здесь всё правльно
    var baseClassConverted_1 = a as BaseClass
    // 2) Здесь выведет ошибку еще до запуска, XCode подскажет что экземляр класса А не может быть сконвертирован в экземляр класса B т.к. а не неследуется от B
    //var baseClassConverted_1_1 = a as B
    
    // Поэтому когда речь идет про апкастинг, то есть про кастинг к родителю, то достаточно использовать "as"
    // "as" какже можно безопасно использовать в switch-statement для того чтобы проверить истинный тип переменной (и записать этот тип в переменную(var) или константу(let))
    
    //-_____________________________________________-
    
    // Если нужно провести даункастинг, самую популярную операцию, чтобы из абстрактного экземляра класса получить более конкретный класс наследник, то могут помочь операторы as? и as!
    
    // посмотри тип этой переменной, это optionsl C: C?
    // если каст не удастся, у нас в переменную будет записано фактическое значение nil
    var baseClassConverted_2 = a as? C
    
    // можно использовать так:
    // мы в переменную типа базового класса записали экземпляр класса наследника
    var some_b_HiddenInBaseClass:BaseClass = B()
    // после запусков и чтения консоли раскомментируй строчку выше, и раскомментируй строчку ниже
    //var some_b_HiddenInBaseClass:BaseClass = A()
    
    // теперь пробуем его максимально безопасно записать в переменную с типом класса B
    
    // Пример 1) - здесь сразу с if-statement произведем конвертацию безопасно, код в фигурных скобочках исполнится если конвертация удастся, и мы получим переменную типа B (Не optional B) - проверь тим переменной, нажав клавишу option и кликнув по ней
    if let someB = some_b_HiddenInBaseClass as? B{
        print("Переменная действительно имеет тип B")
    }
    
    // проверь тип этой переменной, это optional, если конвертация не успешна, то его значение nil
    var tmpVariable = some_b_HiddenInBaseClass as? B
    
    if(tmpVariable != nil){
        print("Переменная действительно имеет тип B - 2")
    }
    
    if let someVar = tmpVariable{
        print("Переменная действительно имеет тип B - 3")
    }
    
    
    // ______________________________________________
    // этот же пример сразу пытается скастовать и произвести forceUnwrap в нужный тип, и если будет nil, то будет выброшено исключение и приложение крашнется, и после краша XCode покажет на какой строчке приложение упало
    // Раскомментируй, запусти, и проверь
    //var baseClassConverted_3 = a as! C
    
    // as! можно использовать когда мы проверили и убедились в точном типе
    
    // is ничего не конвертирует, просто возвращает boolean(true/false)
    if a is C{
        // тут мы уже знаем что переменная является С, если код зайдет сюда
        var retrievedC = a as! C
    }
    
    
}

public class BaseClass{
    public func baseClass(){
        print("baseClass")
    }
}

public class A : BaseClass{
    public func aClass(){
        print("aClass")
    }
}
public class B: BaseClass{
    public func bClass(){
        print("bClass")
    }
}

public class C : B{
    public func cClass(){
        print("cClass")
    }
}

public class D : B{
    public func dClass(){
        print("dClass")
    }
}
