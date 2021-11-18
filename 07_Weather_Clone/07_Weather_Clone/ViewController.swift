//
//  ViewController.swift
//  07_Weather_Clone
//
//  Created by Seydoux on 2021/11/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherStackView: UIStackView!
    @IBOutlet weak var cityNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        guard let cityName = self.cityNameTextField.text else { return }
        self.fetchWeather(cityName: cityName)
    }
    
    private func configureView(weather: WeatherInformation) {
        self.weatherStackView.isHidden = false
        self.tempLabel.text = "\(weather.temp)도"
        self.cityNameLabel.text = weather.name
    }
    
    private func fetchWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=79c4da4e02bc60742c6d1c905745c34d") else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            guard let weather = try? decoder.decode(WeatherInformation.self, from: data) else { return }
            DispatchQueue.main.async {
                self?.configureView(weather: weather)
                print(weather)
            }
        }.resume()
    }
}

