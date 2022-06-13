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
    var baseClassConverted_1 = a as BaseClass
    var baseClassConverted_2 = a as? BaseClass
    var baseClassConverted_3 = a as! BaseClass
    
    
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
