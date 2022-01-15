import RxSwift

let disposeBag = DisposeBag()

print("--------ReplaySubject-------")
let sleepMode = PublishSubject<String>()

sleepMode
    .ignoreElements()
    .subscribe {
        print($0)
    }

sleepMode.onNext("Alert!!!!!")
sleepMode.onNext("Alert!!!!!")
sleepMode.onNext("Alert!!!!!")
sleepMode.onNext("Alert!!!!!")
sleepMode.onCompleted()

print("--------ReplaySubject-------")
let hardToWakeUp = PublishSubject<String>()

hardToWakeUp
    .element(at: 2)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

hardToWakeUp.onNext("Alert1")
hardToWakeUp.onNext("Alert2")
hardToWakeUp.onNext("Alert3")
hardToWakeUp.onNext("Alert4")

print("--------filter-------")
Observable.of(1, 2, 3, 4, 5, 6 , 7, 8)
    .filter { $0 % 2 == 0 }
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

print("--------skip-------")
Observable.of(1, 2, 3, 4, 5, 6, 7, 8)
    .skip(5)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("--------skipWhile-------")
Observable.of(1, 2, 3, 4, 5, 6, 7, 8, 9)
    .skip(while: {
        $0 != 3
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("--------skipUntil-------")
let customer1 = PublishSubject<String>()
let openingTime = PublishSubject<String>()

customer1
    .skip(until: openingTime)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

customer1.onNext("1")
customer1.onNext("2")

openingTime.onNext("Alert!!")
customer1.onNext("3")

print("--------take-------")
Observable.of(1, 2, 3, 4, 5)
    .take(3)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
