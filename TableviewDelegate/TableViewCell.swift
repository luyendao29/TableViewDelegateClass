//
//  TableViewCell.swift
//  TableviewDelegate
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit
protocol IndexPathdelete {
    func delete (at indexPAth: IndexPath)
}
class TableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    var delegate:IndexPathdelete?
    var indexPath:IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func xoa(_ sender: Any) {
        delegate?.delete(at: indexPath!)
        
    }
    
}
