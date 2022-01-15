import RxSwift

let disposeBag = DisposeBag()

print("--------publishSubject-------")
let publishSubject = PublishSubject<String>()

// 서브젝트는 옵저버이자 옵저버블
// 옵저버블은 구독을 해야만 의미가 있다

publishSubject.onNext("1. 여러분 안녕하세요.")

let subscriber1 = publishSubject
    .subscribe(onNext: {
        print("a \($0)")
    })

publishSubject.onNext("2. 들리세요?")
publishSubject.on(.next("3. 안들리시나요?"))

subscriber1.dispose()

let subscriber2 = publishSubject
    .subscribe(onNext: {
        print("b \($0)")
    })

publishSubject.onNext("4. 여보세요")
publishSubject.onCompleted()

publishSubject.onNext("5. Finished")

subscriber2.dispose()

publishSubject
    .subscribe {
        print("세번째 구독: ", $0.element ?? $0)
    }
    .disposed(by: disposeBag)

publishSubject.onNext("6. 찍힐까요?")

print("--------behaviorSubject-------")
enum SubjectError: Error {
    case error1
}

let behaviorSubject = BehaviorSubject<String>(value: "초기값")

behaviorSubject.onNext("1. 첫번째값")

behaviorSubject.subscribe {
    print("첫 번째 구독: ", $0.element ?? $0)
}
.disposed(by: disposeBag)

behaviorSubject.onError(SubjectError.error1)

behaviorSubject.subscribe {
    print("두 번째 구독: ", $0.element ?? $0)
}
.disposed(by: disposeBag)

let value = try? behaviorSubject.value()
print(value)

print("--------ReplaySubject-------")
let replaySubject = ReplaySubject<String>.create(bufferSize: 2)

replaySubject.onNext("1. 여러분")
replaySubject.onNext("2. 힘내세요")
replaySubject.onNext("3. 어렵지만")

replaySubject.subscribe {
    print("First Subscribe: ", $0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.subscribe {
    print("Second Subscribe: ", $0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.onNext("4. 할 수 있습니다.")
replaySubject.onError(SubjectError.error1)
replaySubject.dispose()

replaySubject.subscribe {
    print("Thrid Subscriber: ", $0.element ?? $0)
}
.disposed(by: disposeBag)
