//
//  myTableViewCell.swift
//  ToDoListApp2
//
//  Created by Stepan Ostapenko on 15.03.2021.
//

import UIKit
import CoreDataFramework

class myTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var Task: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    var Date: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    

    
    var statusText: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        
        return label
    }()
    
    
    var taskData: ToDoListItem? {
        didSet {
            Task.text = taskData?.name
            Date.text = "\(taskData!.createdAt!)"
            statusText.text = taskData?.getStatusInfo()
            
            Date.text = taskData?.getDateString()
            
            contentView.backgroundColor = taskData!.getColor()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 2
        contentView.layer.masksToBounds = true
       
        contentView.addSubview(statusText)
        contentView.addSubview(Task)
        contentView.addSubview(Date)
        
        NSLayoutConstraint.activate([
            Task.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            Task.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 7),
            
            Date.topAnchor.constraint(equalTo: Task.bottomAnchor, constant: 10),
            Date.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 7),
            Date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            
            statusText.trailingAnchor.constraint(lessThanOrEqualTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -7),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}
