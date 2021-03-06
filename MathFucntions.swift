//
//  MathFucntions.swift
//  WebWorkKiller
//
//  Created by エリック on 2017/04/07.
//  Copyright © 2017年 エリック. All rights reserved.
//

import UIKit

class MathFucntions: UITableViewCell {

    @IBOutlet weak var functionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(_ mathFunction : mathFunctionsEnum){
        switch mathFunction{
        case .definiteIntegral: functionsLabel.text = "definite Integral"
        case .improperIntegral: functionsLabel.text = "Improper Integral"
        case .checkConverDivergence: functionsLabel.text = "Convergence checker "

        }
    }

}
