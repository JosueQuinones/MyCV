//
//  MoreInfoViewController.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 5/31/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

enum TableSection: Int {
    case languages = 0, technologies, dbms
}

class MoreInfoTableViewController: UITableViewController, Storyboarded {
    
    //MARK: - Class variables
    var type: MoreInfoType = .technical
    var model: Model?
    var SectionHeaderHeight: CGFloat = 25

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        
    }
    
    //MARK: - Class methods
    func setTitle() {
        title = type.rawValue.localize()
    }
    
    func getNumberOfRowsForTechnical(section: Int) -> Int {
        let programmingLanguages = model?.technicalSkills?.programmingLanguages?.count ?? 0
        let technologies = model?.technicalSkills?.technologies?.count ?? 0
        let dbms = model?.technicalSkills?.DBMS?.count ?? 0
        
        switch section {
        case 0:
            return programmingLanguages
        case 1:
            return technologies
        case 2:
            return dbms
        default:
            return 1
        }
    }
    
    func getNumberOfSections() -> Int {
        switch type {
        case .technical:
            return 3
        case .soft, .hobbies:
            return 1
        }
    }
    
    func getTextForTechnicalRow(index: IndexPath) -> String? {
        switch index.section {
        case 0:
            return model?.technicalSkills?.programmingLanguages?[index.row].first
        case 1:
            return model?.technicalSkills?.technologies?[index.row].first
        case 2:
            return model?.technicalSkills?.DBMS?[index.row].first
        default:
            return nil
        }
    }
    
    func getTextForSoftRow(index: IndexPath) -> String? {
        return model?.softSkills?[index.row]
    }
    
    func getTextForHobbiesRow(index: IndexPath) -> String? {
        return model?.hobbies?[index.row]
    }
    
    func getProgressForRow(index: IndexPath) -> Float {
        switch index.section {
        case 0:
            guard let programming = model?.technicalSkills?.programmingLanguages?[index.row][1] else {
                return 0.0
            }
            guard let programmingFloat = Float(programming) else {
                return 0.0
            }
            return programmingFloat / 100
        case 1:
            guard let technologies = model?.technicalSkills?.technologies?[index.row][1] else {
                return 0.0
            }
            guard let technologiesFloat = Float(technologies) else {
                return 0.0
            }
            return technologiesFloat / 100
        case 2:
            guard let dbms = model?.technicalSkills?.programmingLanguages?[index.row][1] else {
                return 0.0
            }
            guard let dbmsFloat = Float(dbms) else {
                return 0.0
            }
            return dbmsFloat / 100
        default:
            return 0.0
        }
    }
    
    //MARK: - Data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return getNumberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch type {
        case .technical:
            return getNumberOfRowsForTechnical(section: section)
        case .soft:
            guard let soft = model?.softSkills?.count else {
                return 0
            }
            return soft
        case .hobbies:
            guard let hobbies = model?.hobbies?.count else {
                return 0
            }
            return hobbies
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCell", for: indexPath) as? SkillTableViewCell else {
            return UITableViewCell()
        }
        
        switch type {
        case .technical:
            cell.skillLabel.text = getTextForTechnicalRow(index: indexPath)
            cell.progressView.progress = getProgressForRow(index: indexPath)
            cell.progressView.isHidden = false
        case .soft:
            cell.skillLabel.text = getTextForSoftRow(index: indexPath)
            cell.progressView.isHidden = true
        case .hobbies:
            cell.skillLabel.text = getTextForHobbiesRow(index: indexPath)
            cell.progressView.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if type == .technical {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: SectionHeaderHeight))
        view.backgroundColor = .mainDarkGray
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: SectionHeaderHeight))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .extraLightGray
        if let tableSection = TableSection(rawValue: section) {
            switch tableSection {
            case .languages:
                label.text = "programming_languages".localize()
            case .technologies:
                label.text = "technologies".localize()
            case .dbms:
                label.text = "dbms".localize()
            }
        }
        view.addSubview(label)
        return view
        }
        return nil
    }
}
