//
//  StartViewController.swift
//  MovieShowtimes
//
//  Created by admin on 16.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!

    var movies = [Movie]()
    var dataManager = DataManager.shared
    
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    
    @IBAction func startButtonPressed(_ sender: Any) {
        startButton.isHidden = true
        spinnerView.startAnimating()
    
        dataManager.getMovies { [weak self] data in
            guard let strongSelf = self, let data = data, data.count > 0 else {
                let alertUIAlertController = UIAlertController(title: "Ошибка", message: "Ошибка загрузки файлов", preferredStyle: .alert)
                let closeButtonUIAlertAction = UIAlertAction(title: "Закрыть", style: .default, handler: { action in})
                alertUIAlertController.addAction(closeButtonUIAlertAction)

                DispatchQueue.main.async(execute: {
                    self?.spinnerView.stopAnimating()
                    self?.present(alertUIAlertController, animated: true)
                    self?.startButton.isHidden = false
                })
                return
            }
            strongSelf.movies = data
            DispatchQueue.main.async {
                guard let mainTVC = strongSelf.storyboard?.instantiateViewController(identifier: "cellsVC") as? TableViewController else {return}
                mainTVC.movies = strongSelf.movies
                strongSelf.navigationController?.pushViewController(mainTVC, animated: true)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.titleLabel?.numberOfLines = 0
        startButton.titleLabel?.textAlignment = .center
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        spinnerView.stopAnimating()
        startButton.isHidden = false
    }
    
}
