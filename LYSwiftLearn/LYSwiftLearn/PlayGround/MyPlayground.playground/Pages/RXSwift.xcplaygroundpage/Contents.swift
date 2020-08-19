//: [Previous](@previous)
import UIKit
import RxSwift
import RxRelay
import RxCocoa

let disposeBag = DisposeBag.init()


let observable = Observable<String>.create { (observer) -> Disposable in
    
    print("observe:\(observer)")
    observer.onNext("a")
    
    return Disposables.create {
        
    }
}
observable.subscribe { (event) in
    print(event)
}.disposed(by: disposeBag)

observable.subscribe { (event) in
    print(event)
}.disposed(by: disposeBag)


Observable<Any>.empty().subscribe { (event) in
    print(event)
}.disposed(by: disposeBag)

Observable.just([1,2,3])
    .subscribe { event in
        print(event)
}
.disposed(by: disposeBag)


Observable.of("🐶", "🐱", "🐭", "🐹")
    .subscribe(
        onNext: { print("Element:", $0) },
        onError: { print("Error:", $0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") })
    .disposed(by: disposeBag)


Observable.from(["🐶", "🐱", "🐭", "🐹"])
    .subscribe(
        onNext: { print("Element:", $0) },
        onError: { print("Error:", $0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") })
    .disposed(by: disposeBag)

Observable.range(start: 1, count: 10)
    .subscribe(
        onNext: { print("Element:", $0) },
        onError: { print("Error:", $0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") })
    .disposed(by: disposeBag)

Observable.repeatElement("🔴").take(5)
    .subscribe(
        onNext: { print("Element:", $0) },
        onError: { print("Error:", $0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") })
    .disposed(by: disposeBag)


Observable.generate(
    initialState: 0,
    condition: { $0 < 10 },
    iterate: { $0 + 2 }
).subscribe(
    onNext: { print("Element:", $0) },
    onError: { print("Error:", $0) },
    onCompleted: { print("Completed") },
    onDisposed: { print("Disposed") })
    .disposed(by: disposeBag)


    var count = 1
    let deferredSequence = Observable<String>.deferred {
        print("Creating \(count)")
        count += 1
        return Observable.create { observer in
            print("Emitting...")
            observer.onNext("🐶")
            observer.onNext("🐱")
            observer.onNext("🐵")
            return Disposables.create()
        }
    }
    
    deferredSequence
        .subscribe(
        onNext: { print("Element:", $0) },
        onError: { print("Error:", $0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") })
        .disposed(by: disposeBag)
    
    deferredSequence
        .subscribe(
        onNext: { print("Element:", $0) },
        onError: { print("Error:", $0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") })
        .disposed(by: disposeBag)

enum TestError: Error {
    case a
}
let err = TestError.a

Observable.error(err).subscribe(onNext: { print($0) })
.disposed(by: disposeBag)

Observable.of("🍎", "🍐", "🍊", "🍋")
.do(onNext: { print("Intercepted:", $0) }, afterNext: { print("Intercepted after:", $0) }, onError: { print("Intercepted error:", $0) }, afterError: { print("Intercepted after error:", $0) }, onCompleted: { print("Completed")  }, afterCompleted: { print("After completed")  })
.subscribe(onNext: { print($0) })
.disposed(by: disposeBag)

//let interval = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
//
//_ = interval
//    .subscribe(onNext: { print("Subscription: 1, Event: \($0)") })
//DispatchQueue.main.asyncAfter(deadline: .now()+5) {
//    _ = interval
//    .subscribe(onNext: { print("Subscription: 2, Event: \($0)") })
//}
//
//let observable = Observable<Int>.timer(5, scheduler: MainScheduler.instance)
//observable.subscribe { event in
//    print(event)
//}

//let observable = Observable<Int>.timer(5, period: 2, scheduler: MainScheduler.instance)
//observable.subscribe { event in
//    print(event)
//}
//Observable序列（每隔1秒钟发出一个索引数）
let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
observable
    .map { "当前索引数：\($0 )"}.bind { text in
        print(text)
}.disposed(by: disposeBag)

//: [Next](@next)
