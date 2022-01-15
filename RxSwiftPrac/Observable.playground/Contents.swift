import Foundation
import RxSwift

print("--------Just-------")
Observable<Int>.just(1)
    .subscribe(onNext: {
        print($0)
    })

print("--------Of 1-------")
Observable<Int>.of(1, 2, 3, 4, 5, 6)
    .subscribe(onNext: {
        print($0)
    })

print("--------Of 2-------")
Observable.of([1, 2, 3, 4, 5, 6])
    .subscribe(onNext: {
        print($0)
    })

print("--------From-------")
Observable.from([1, 2, 3, 4, 5, 6])
    .subscribe(onNext: {
        print($0)
    })

print("--------Subscribe-------")
Observable.of(1, 2, 3)
    .subscribe {
        print($0)
    }

print("--------Subscribe2-------")
Observable.of(1, 2, 3)
    .subscribe {
        if let element = $0.element {
            print(element)
        }
    }

print("--------Subscribe3-------")
Observable.of(1, 2, 3)
    .subscribe(onNext: {
        print($0)
    })

print("--------Empty-------")
Observable<Void>.empty()
    .subscribe {
        print($0)
    }

print("--------never-------")
Observable<Void>.never()
    .debug("never")
    .subscribe(
        onNext: {
            print($0)
        },
        onCompleted: {
            print("Completed")
        })

print("--------range-------")
Observable.range(start: 1, count: 9)
    .subscribe(onNext: {
        print("2*\($0)=\(2*$0)")
    })

print("--------dispose-------")
Observable.of(1, 2, 3)
    .debug("dispose")
    .subscribe(onNext: {
        print($0)
    })
    .dispose()

print("--------disposeBag-------")
let disposeBag = DisposeBag()

Observable.of(1, 2, 3)
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

print("--------create 1-------")
Observable.create { observer -> Disposable in
    observer.onNext(1)
    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
}
.subscribe {
    print($0)
}
.disposed(by: disposeBag)

print("--------Deffered 1-------")
Observable.deferred {
    Observable.of(1, 2, 3)
}
.subscribe {
    print($0)
}
.disposed(by: disposeBag)

print("--------Deffered 2-------")
var flip: Bool = false

let factory: Observable<String> = .deferred {
    flip = !flip
    
    if flip {
        return Observable.of("Up")
    } else {
        return Observable.of("Down")
    }
}

for _ in 0...3 {
    factory.subscribe(onNext: {
        print($0)
    })
        .disposed(by: disposeBag)
}
