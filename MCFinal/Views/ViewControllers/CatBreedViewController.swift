//
//  CatBreedViewController.swift
//  MCFinal
//
//  Created by Mounika Madishetti on 08/10/22.
//

import UIKit

final class CatBreedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: CatBreedsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "breed"
        viewModel = CatBreedsViewModel()
        registerCells()
        fetchApiData()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: CatBreedTableViewCell.reuseIdentifer, bundle: nil), forCellReuseIdentifier: CatBreedTableViewCell.reuseIdentifer)
    }
    
    private func fetchApiData() {
        if viewModel?.pageCount == 0 {
            viewModel?.pageCount = 1
        } else {
            viewModel?.pageCount += 1
        }
        viewModel?.getApiResponse { [weak self] res in
            switch res {
            case .success(_):
                self?.tableView.reloadData()
            case .failure(_):
                print("failure")
            }
            
        }
    }
    
    
}

extension CatBreedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.catBreedResponse.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatBreedTableViewCell.reuseIdentifer, for: indexPath) as? CatBreedTableViewCell else { return UITableViewCell() }
        if let catBreed = viewModel?.catBreedResponse[indexPath.row] {
        cell.configure(catBreed: catBreed)
        }
       return cell 
    }
}

extension CatBreedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CatDetailViewController.instantiate()
        let vm = CatDetailViewModel(catData: (viewModel?.catBreedResponse[indexPath.row])!)
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}
