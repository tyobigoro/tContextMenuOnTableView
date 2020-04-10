//
//  DetailVC.swift
//  tContextMenuOnTableView
//
//  Created by tyobigoro on 2020/04/10.
//  Copyright © 2020 tyobigoro. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var contentsNameLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    var editPurpse: EditPurpose!
    
    var contentsNameStr: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("### DetailVC/viewDidLoad/contentsNameStr: \(String(describing: contentsNameStr))")

        switch editPurpse {
        case .create:
            contentsNameLabel.text = "新規作成"
        case .edit:
            contentsNameLabel.text = "\(String(describing: contentsNameStr))を編集します"
        default:
            fatalError("ここは通らない")
        }
        
        backBtn.setTitle(editPurpse.btnTitle, for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("### DetailVC/viewWillAppear/contentsNameStr: \(String(describing: contentsNameStr))")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("### DetailVC/viewDidAppear/contentsNameStr: \(String(describing: contentsNameStr))")
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
