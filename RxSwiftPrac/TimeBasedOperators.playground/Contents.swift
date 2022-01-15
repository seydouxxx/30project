import RxSwift
import RxCocoa
import UIKit
import PlaygroundSupport

let disposeBag = DisposeBag()

print("----replay----")
let greetings = PublishSubject<String>()
let mockingBird = greetings.replay(1)

mockingBird.connect()

greetings.onNext("1. Hello")
greetings.onNext("2. Hi")

mockingBird
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("----replayAll----")
let doctorStrange = PublishSubject<String>()
let timeStone = doctorStrange.replayAll()

timeStone.connect()

doctorStrange.onNext("123")
doctorStrange.onNext("456")

timeStone
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("----buffer----")
//let source = PublishSubject<String>()
//
//var count = 0
//let timer = DispatchSource.makeTimerSource()
//
//timer.schedule(deadline: .now() + 2, repeating: .seconds(1))
//timer.setEventHandler {
//    count += 1
//    source.onNext("\(count)")
//}
//timer.resume()
//
//source
//    .buffer(
//        timeSpan: .seconds(2),
//        count: 2,
//        scheduler: MainScheduler.instance
//    )
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

print("----window----")
//let maxObservable = 5
//let makeInterval = RxTimeInterval.seconds(2)
//
//let window = PublishSubject<String>()
//
//var windowCount = 0
//let windowTimeSource = DispatchSource.makeTimerSource()
//windowTimeSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
//
//windowTimeSource.setEventHandler {
//    windowCount += 1
//    window.onNext("\(windowCount)")
//}
//windowTimeSource.resume()
//
//window
//    .window(
//        timeSpan: makeInterval,
//        count: maxObservable,
//        scheduler: MainScheduler.instance
//    )
//    .flatMap { windowObservable -> Observable<(index: Int, element: String)> in
//        windowObservable.enumerated()
//    }
//    .subscribe(onNext: {
//        print("\($0.index) Observable's element \($0.element)")
//    })
//    .disposed(by: disposeBag)

print("----delaySubscription----")
//let delaySource = PublishSubject<String>()
//var delayCount = 0
//let delayTimeSource = DispatchSource.makeTimerSource()
//delayTimeSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
//delayTimeSource.setEventHandler {
//    delayCount += 1
//    delaySource.onNext("\(delayCount)")
//}
//delayTimeSource.resume()
//
//delaySource
//    .delaySubscription(.seconds(5), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

print("----delay----")
//let delaySubject = PublishSubject<String>()
//var delayCount = 0
//let delayTimerSource = DispatchSource.makeTimerSource()
//delayTimerSource.schedule(deadline: .now(), repeating: .seconds(1))
//delayTimerSource.setEventHandler {
//    delayCount += 1
//    delaySubject.onNext("\(delayCount)")
//}
//delayTimerSource.resume()
//
//delaySubject
//    .delay(.seconds(3), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

print("----interval----")
//Observable<Int>
//    .interval(.seconds(3), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

print("----timer----")
//Observable<Int>
//    .timer(.seconds(5), period: .seconds(2), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)

print("----timeout----")
let errorMaker = UIButton(type: .system)
errorMaker.setTitle("Press Button!", for: .normal)
errorMaker.sizeToFit()

PlaygroundPage.current.liveView = errorMaker

errorMaker.rx.tap
    .do(onNext: {
        print("tapped")
    })
    .timeout(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
