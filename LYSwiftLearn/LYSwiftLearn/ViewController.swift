//
//  ViewController.swift
//  LYSwiftLearn
//
//  Created by 刘宇 on 2020/4/4.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay
enum MyError: Error{
    case A
    case B
}

class ViewController: UIViewController {
    let disposeBag = DisposeBag.init()
    var observer :AnyObserver<Any> = AnyObserver<Any>.init { (event) in
        switch event {
            
        case .next(let element):
            print(element)
        case .error(let err):
            print(err)
        case .completed:
            print("completed")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        test10()
    }
    
    func test10() {
        
        
    }
    
    func test9() {
        Observable.of(1,2,3).map { num in
            return num * 10
        }.subscribe(onNext: { (num) in
            print(num)
        }, onError: { (err) in
            
        }, onCompleted: {
            
        }, onDisposed: {
            
            }).disposed(by: disposeBag)
        
    }
    
    func test8() {
            let subject = PublishSubject<String>()
            subject.window(timeSpan: RxTimeInterval.seconds(3), count: 3, scheduler: MainScheduler.instance).subscribe(onNext: { [weak self] in
                print("========")
                $0.asObservable()
                .subscribe(onNext: { print($0) })
                .disposed(by: self!.disposeBag)
                
            }, onError: { (err) in
                print("err")
            }, onCompleted: {
                print("第1次","onCompleted")
            }, onDisposed: {
                print("第1次","onDisposed")
            }).disposed(by: disposeBag)
            subject.onNext("a")
            subject.onNext("b")
            subject.onNext("c")
    //        subject.onCompleted()
            subject.onNext("1")
            subject.onNext("2")
//            subject.onNext("3")
        }
    func test7() {
        let subject = PublishSubject<String>()
        subject.buffer(timeSpan: RxTimeInterval.seconds(3), count: 3, scheduler: MainScheduler.instance).subscribe(onNext: { (string) in
            print("第1次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第1次","onCompleted")
        }, onDisposed: {
            print("第1次","onDisposed")
        }).disposed(by: disposeBag)
        subject.onNext("a")
        subject.onNext("b")
        subject.onNext("c")
//        subject.onCompleted()
        subject.onNext("1")
        subject.onNext("2")
//        subject.onNext("3")
    }
    
//    区别：当一个新的订阅者刚订阅它的时候，能不能收到 Subject 以前发出过的旧 Event，如果能的话又能收到多少个。 在调用onCompleted之后能否收到上一发出的event,
    
    func test6() {
        let subject = AsyncSubject<String>()
        
        subject.onNext("1")
        subject.onNext("2")
        
        subject.subscribe(onNext: { (string) in
            print("第1次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第1次","onCompleted")
        }, onDisposed: {
            print("第1次","onDisposed")
        }).disposed(by: disposeBag)
        
        subject.onNext("3")
        
        subject.onCompleted()
        
        subject.onNext("4")
        subject.subscribe(onNext: { (string) in
            print("第2次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第2次","onCompleted")
        }, onDisposed: {
            print("第2次","onDisposed")
        }).disposed(by: disposeBag)
        
    }
    func test5() {
        //一般用于加载更多
        let subject = BehaviorRelay<[String]>.init(value: ["1"])
        
        subject.subscribe(onNext: { (string) in
            print("第1次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第1次","onCompleted")
        }, onDisposed: {
            print("第1次","onDisposed")
        }).disposed(by: disposeBag)
        
        subject.accept(subject.value + ["2"])
        
        subject.subscribe(onNext: { (string) in
            print("第2次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第2次","onCompleted")
        }, onDisposed: {
            print("第2次","onDisposed")
        }).disposed(by: disposeBag)
        
        subject.accept(subject.value + ["3"])
        
        
        subject.subscribe(onNext: { (string) in
            print("第3次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第3次","onCompleted")
        }, onDisposed: {
            print("第3次","onDisposed")
        }).disposed(by: disposeBag)
    }
    
    func test4() {
        let subject = BehaviorRelay<String>.init(value: "1")
        
        subject.subscribe(onNext: { (string) in
            print("第1次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第1次","onCompleted")
        }, onDisposed: {
            print("第1次","onDisposed")
        }).disposed(by: disposeBag)
        
        subject.accept("2")
        
        subject.subscribe(onNext: { (string) in
            print("第2次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第2次","onCompleted")
        }, onDisposed: {
            print("第2次","onDisposed")
        }).disposed(by: disposeBag)
        
        subject.accept("3")
        
        
        subject.subscribe(onNext: { (string) in
            print("第3次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第3次","onCompleted")
        }, onDisposed: {
            print("第3次","onDisposed")
        }).disposed(by: disposeBag)
    }
    
    func test3() {
        let subject = ReplaySubject<String>.create(bufferSize: 2)
     
        subject.onNext("1")
        subject.onNext("2")
        subject.onNext("3")
        subject.subscribe(onNext: { (string) in
            print("第1次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第1次","onCompleted")
        }, onDisposed: {
            print("第1次","onDisposed")
        }).disposed(by: disposeBag)
        
        
        subject.onNext("4")
        subject.subscribe(onNext: { (string) in
            print("第2次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第2次","onCompleted")
        }, onDisposed: {
            print("第2次","onDisposed")
        }).disposed(by: disposeBag)
        
        subject.onNext("5")
        
        subject.onCompleted()
        
        subject.onNext("6")
        subject.subscribe(onNext: { (string) in
            print("第3次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第3次","onCompleted")
        }, onDisposed: {
            print("第3次","onDisposed")
        }).disposed(by: disposeBag)
        
    }
    
    func test2() {
        let subject = BehaviorSubject<String>(value: "初始值")
        
           subject.subscribe(onNext: { (string) in
               print("第1次",string)
           }, onError: { (err) in
               print("err")
           }, onCompleted: {
               print("第1次","onCompleted")
           }, onDisposed: {
               print("第1次","onDisposed")
           }).disposed(by: disposeBag)
           
           subject.onNext("2")
           
           subject.subscribe(onNext: { (string) in
               print("第2次",string)
           }, onError: { (err) in
               print("err")
           }, onCompleted: {
               print("第2次","onCompleted")
           }, onDisposed: {
               print("第2次","onDisposed")
           }).disposed(by: disposeBag)
           
           subject.onNext("3")
           
           subject.onCompleted()
           
           subject.onNext("4")
           subject.subscribe(onNext: { (string) in
               print("第3次",string)
           }, onError: { (err) in
               print("err")
           }, onCompleted: {
               print("第3次","onCompleted")
           }, onDisposed: {
               print("第3次","onDisposed")
           }).disposed(by: disposeBag)
           
       }
    
    func test1() {
        let subject = PublishSubject<String>()
        
        subject.onNext("1")
        
        subject.subscribe(onNext: { (string) in
            print("第1次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第1次","onCompleted")
        }, onDisposed: {
            print("第1次","onDisposed")
        }).disposed(by: disposeBag)
        
        subject.onNext("2")
        
        subject.subscribe(onNext: { (string) in
            print("第2次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第2次","onCompleted")
        }, onDisposed: {
            print("第2次","onDisposed")
        }).disposed(by: disposeBag)
        
        subject.onNext("3")
        
        subject.onCompleted()
        
        subject.onNext("4")
        subject.subscribe(onNext: { (string) in
            print("第3次",string)
        }, onError: { (err) in
            print("err")
        }, onCompleted: {
            print("第3次","onCompleted")
        }, onDisposed: {
            print("第3次","onDisposed")
        }).disposed(by: disposeBag)
        
    }
    
}

