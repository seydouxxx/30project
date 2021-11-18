//
//  ViewController.swift
//  08_Covid19_Clone
//
//  Created by Seydoux on 2021/11/18.
//

import UIKit
import Charts
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var chartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.fetchCovidData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(covidStatus):
                self.totalLabel.text = "\(covidStatus.korea.totalCase)명"
                self.newLabel.text = "\(covidStatus.korea.newCase)명"
                self.configureChart(from: covidStatus)
            case let .failure(error):
                debugPrint("error \(error)")
            }
        }
    }
    
    func stringToDouble(from string: String) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: string)?.doubleValue ?? 0
    }
    
    func configureChart(from covidStatus: CovidStatus) {
        let entries = [
            covidStatus.seoul,
            covidStatus.gyeonggi,
            covidStatus.incheon,
            covidStatus.gangwon,
            covidStatus.chungbuk,
            covidStatus.chungnam,
            covidStatus.daejeon,
            covidStatus.gyeongbuk,
            covidStatus.gyeongnam,
            covidStatus.daegu,
            covidStatus.ulsan,
            covidStatus.busan,
            covidStatus.sejong,
            covidStatus.jeonbuk,
            covidStatus.jeonnam,
            covidStatus.gwangju,
        ]
            .sorted(by: { stringToDouble(from: $0.newCase) > stringToDouble(from: $1.newCase) })
            .compactMap { [weak self] city -> PieChartDataEntry? in
                guard let self = self else { return nil }
                return PieChartDataEntry(
                    value: self.stringToDouble(from: city.newCase),
                    label: city.countryName,
                    data: city
                )
            }
        let dataSet = PieChartDataSet(entries: entries, label: "코로나 발생 현황")
        dataSet.valueTextColor = .black
        dataSet.sliceSpace = 1
        dataSet.entryLabelColor = .black
        dataSet.xValuePosition = .outsideSlice
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.3
        dataSet.colors = ChartColorTemplates.material() +
            ChartColorTemplates.pastel() +
            ChartColorTemplates.liberty() +
            ChartColorTemplates.joyful() +
            ChartColorTemplates.vordiplom()
        
        self.chartView.data = PieChartData(dataSet: dataSet)
        
    }

    func fetchCovidData(
        completionHandler: @escaping (Result<CovidStatus, Error>) -> Void
    ) {
        
        guard let url = URL(string: "https://api.corona-19.kr/korea/country/new/") else { return }
        let param = [
            "serviceKey": "u3syW1h4fKc6YgLNnmVXH7ZlrdeUjTQEw"
        ]
        AF.request(url, method: .get, parameters: param)
            .responseData(completionHandler: { response in
                switch response.result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let result =  try decoder.decode(CovidStatus.self, from: data)
                        completionHandler(.success(result))
                    } catch {
                        print("error occured during json decoding \(error)")
                    }
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            })
        
    }

}
