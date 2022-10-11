//
//  CatDetailViewController.swift
//  MCFinal
//
//  Created by Mounika Madishetti on 08/10/22.
//

import UIKit

class CatDetailViewController: UIViewController {
    var viewModel: CatDetailViewModel?
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var imageView: CustomImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: (viewModel?.catData?.url)!){
        imageView.getImage(with: url)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
