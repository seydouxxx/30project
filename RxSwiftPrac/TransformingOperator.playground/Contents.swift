import RxSwift

let disposeBag = DisposeBag()

print("--------skipUntil-------")
Observable.of("A", "B", "C")
    .toArray()
    .subscribe(onSuccess: {
        print($0)
    })
    .disposed(by: disposeBag)

print("--------map-------")
Observable.of(Date())
    .map { date -> String in
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko")
        return dateFormatter.string(from: date)
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("--------flatMap-------")
protocol Player {
    var score: BehaviorSubject<Int> { get }
}

struct Shooter: Player {
    var score: BehaviorSubject<Int>
}

let korean = Shooter(score: BehaviorSubject<Int>(value: 10))
let american = Shooter(score: BehaviorSubject<Int>(value: 8))

let olymics = PublishSubject<Player>()

olymics
    .flatMap { player in
        player.score
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

olymics.onNext(korean)
korean.score.onNext(10)

olymics.onNext(american)
korean.score.onNext(10)
american.score.onNext(9)

print("--------전화번호 11자리-------")
let input = PublishSubject<Int?>()
let list: [Int] = []

input
    .debug()
    .flatMap {
        $0 == nil ? Observable.empty() : Observable.just($0)
    }
    .map { $0! }
    .skip(while: { $0 != 0 })
    .take(11)
    .toArray()
    .asObservable()
    .map {
        $0.map { "\($0)" }
    }
    .map { numbers in
        var numberList = numbers
        numberList.insert("-", at: 3)
        numberList.insert("-", at: 8)
        let number = numberList.reduce(" ", +)
        return number
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

input.onNext(10)
input.onNext(0)
input.onNext(nil)
input.onNext(1)
input.onNext(0)
input.onNext(4)
input.onNext(8)
input.onNext(nil)
input.onNext(9)
input.onNext(7)
input.onNext(4)
input.onNext(2)
input.onNext(6)
input.onNext(9)
input.onNext(1)
