import RxSwift

let disposeBag = DisposeBag()

print("----startWith----")
let yellowClass = Observable<String>.of("a", "b", "c")

yellowClass
    .enumerated()
    .map { index, element in
        element + " children" + " \(index)"
    }
    .startWith("teacher")
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("----concat1----")
let yellowChildren = Observable<String>.of("a", "b", "c")
let teacher = Observable<String>.of("teacher")

let walkInLine = Observable
    .concat([teacher, yellowChildren])

walkInLine
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("----concat2----")
teacher
    .concat(yellowChildren)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("----concatMap----")
let kinder: [String: Observable<String>] = [
    "yellow": Observable.of("a", "b", "c"),
    "blue": Observable.of("A", "B")
]

Observable.of("yellow", "blue")
    .concatMap { className in
        kinder[className] ?? .empty()
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("----merge1----")
let ilsan = Observable.from(["daehwa", "hwajung", "deokyang", "tanhyun"])
let seoul = Observable.from(["ganbuk", "gangnam", "nowon", "yongsan"])


Observable.of(ilsan, seoul)
    .merge()
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("----merge2----")
Observable.of(ilsan, seoul)
    .merge(maxConcurrent: 1)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("----combineLatest1----")
let famName = PublishSubject<String>()
let lastName = PublishSubject<String>()

let fullName = Observable
    .combineLatest(famName, lastName) { famName, lastName in
        famName + lastName
    }

fullName
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

famName.onNext("kim")
lastName.onNext("hojun")
lastName.onNext("sanwoo")
lastName.onNext("jihoon")
famName.onNext("Lee")
famName.onNext("Park")
famName.onNext("Choi")

print("----combineLatest2----")
let dateFormat = Observable<DateFormatter.Style>.of(.short, .long)
let currentDate = Observable<Date>.of(Date())

let printCurrent = Observable
    .combineLatest(
        dateFormat,
        currentDate,
        resultSelector: { format, date -> String in
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = format
            return dateFormatter.string(from: date)
        }
    )

printCurrent
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("----combineLatest3----")
let lastName2  = PublishSubject<String>()
let firstName2 = PublishSubject<String>()

let fullName2 = Observable.combineLatest([firstName2, lastName2]) { name in
    name.joined(separator: " ")
}

fullName2
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

lastName2.onNext("Kim")
firstName2.onNext("Paul")
firstName2.onNext("lil")
firstName2.onNext("kasadian")

print("----zip----")
enum resultCase {
    case win
    case lose
}

let results = Observable<resultCase>.of(.win, .win, .lose, .win, .lose, .win)
let players = Observable<String>.of("kr", "jp", "cn", "us", "uk", "vn")

let contestResults = Observable
    .zip(results, players) { result, player in
        player + " " + "\(result)"
    }

contestResults
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("----withLatestFrom1----")
let game = PublishSubject<Void>()
let players2 = PublishSubject<String>()

game
    .withLatestFrom(players2)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

players2.onNext("1")
players2.onNext("1, 2")
players2.onNext("1, 2, 3")

game.onNext(Void())
game.onNext(Void())

print("----sample----")

let start = PublishSubject<Void>()
let f1Players = PublishSubject<String>()

f1Players
    .sample(start)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

f1Players.onNext("1")
f1Players.onNext("1, 2")
f1Players.onNext("1, 2, 3")

start.onNext(Void())
start.onNext(Void())

print("----amb----")
let bus1 = PublishSubject<String>()
let bus2 = PublishSubject<String>()

let station = bus1.amb(bus2)

station
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

bus2.onNext("bus2-cus0: a")
bus1.onNext("bus1-cus0: b")
bus1.onNext("bus1-cus1: c")
bus2.onNext("bus2-cus1: d")
bus1.onNext("bus1-cus1: e")
bus2.onNext("bus2-cus2: f")

print("----switchLatest----")
let student1 = PublishSubject<String>()
let student2 = PublishSubject<String>()
let student3 = PublishSubject<String>()

let handsUp = PublishSubject<Observable<String>>()

let classRoom = handsUp.switchLatest()

classRoom
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

handsUp.onNext(student1)
student1.onNext("student1: i'm 1")
student2.onNext("student2: hey")

handsUp.onNext(student2)
student2.onNext("student2: i'm 2")
student1.onNext("student1: no")

handsUp.onNext(student3)
student2.onNext("student2: i'm saying")
student1.onNext("student1: fuck you")
student3.onNext("student3: fuck you both")

handsUp.onNext(student1)
student1.onNext("student1: no fuck you")
student2.onNext("student2: bb")
student3.onNext("student3: bbb")
student2.onNext("student2: bbbb")

print("----reduce----")
Observable.from((1...10))
    .reduce(0, accumulator: { summary, newValue in
        return summary + newValue
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("----scan----")
Observable.from((1...10))
    .scan(0, accumulator: { summary, newValue in
        return summary + newValue
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
