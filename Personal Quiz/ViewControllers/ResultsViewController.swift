//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встерчающийся тип живтоного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    var answers = [Answer]()
    
    @IBOutlet weak var petLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTestResults()
        
        self.navigationItem.hidesBackButton = true
    }
    
    private func getTestResults() {
        
        let answersSort = answers.reduce(into: [:]) { countAnswers, animal in countAnswers[animal.type, default: 0] += 1}
        
        let countAnswers = answersSort.sorted{$0.value < $1.value}
        
        if let finalPet = countAnswers.first {
            petLabel.text = "Вы - \(finalPet.key.rawValue)"
            descriptionLabel.text = finalPet.key.definition
        }
    }
}
