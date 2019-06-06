//
//  MainInfoViewController.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 5/31/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class MainInfoViewController: UIViewController, Storyboarded {

    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var githubLabel: UILabel!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var techButton: MoreInfoButton!
    @IBOutlet weak var softButton: MoreInfoButton!
    @IBOutlet weak var hobbiesButton: MoreInfoButton!
    
    
    //MARK: - Closures for coordinator
    var moreInfo: (Int, Model?) -> () = { _, _ in }
    var showTwitter: (String?) -> Void = { _ in }
    var showOkErrorAlert: (String?) -> Void = { _ in }
    
    //MARK: - Class variables
    var model: Model? = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInfo()
        title = "mainScreenTitle".localize()
    }
    
    //MARK: - Class methods
    func fetchInfo() {
        Networking.shared.getModel(model: model) {[weak self] result in
            guard let result = result else {
                self?.showOkErrorAlert("fetch_error".localize())
                self?.lockButtons()
                return
            }
            self?.model = result
            DispatchQueue.main.async {
                self?.setView()
            }
        }
    }
    
    func lockButtons() {
        techButton.isEnabled = false
        softButton.isEnabled = false
        hobbiesButton.isEnabled = false
    }
    
    func setView() {
        guard let name = model?.mainInfo?.name, let lastname = model?.mainInfo?.lastname else {
            return
        }
        
        nameLabel.text = name + " " + lastname
        ageLabel.text = model?.mainInfo?.age
        areaLabel.text = model?.mainInfo?.area
        universityLabel.text = model?.mainInfo?.university
        githubLabel.text = model?.contact?.github
        if let twitter = model?.contact?.twitter {
            twitterButton.setTitle(twitter, for: .normal)
        }
        guard let imageString = model?.mainInfo?.photo else {
            return
        }
        guard let imageURL = URL(string: imageString) else {
            return
        }
        Networking.shared.getImage(from: imageURL) { [unowned self] image in
            self.photoImageView.image = image
            self.photoImageView.roundImageWithShadow(url: imageURL)
        }
    }
    
    //MARK: - Actions
    @IBAction func moreInfoPressed(_ sender: UIButton) {
        moreInfo(sender.tag, model)
    }
    
    @IBAction func twitterPressed(_ sender: UIButton) {
        showTwitter(sender.title(for: .normal))
    }
    
}
