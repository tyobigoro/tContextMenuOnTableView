//
//  FirstTVC.swift
//  tContextMenuOnTableView
//
//  Created by tyobigoro on 2020/04/10.
//  Copyright © 2020 tyobigoro. All rights reserved.
//

import UIKit

enum EditPurpose {
    case create
    case edit
    
    var btnTitle: String {
        switch self {
        case .create:
            return "新規作成"
        case .edit:
            return "編集"
        }
    }
}

class FirstVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    let contentsNames: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func newBtnDidTap(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailVC
        
        vc.editPurpse = .create
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backFromDetailVC(segue: UIStoryboardSegue) {
        
        let from = segue.source as! DetailVC
        
        switch from.editPurpse {
        case .create:
            print("新規作成から戻ってきたよ")
        case .edit  :
            print("編集から戻ってきたよ")
        default:
            fatalError("ここはとおらない")
        }
    }
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contentsNames.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = contentsNames[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailVC
        vc.contentsNameStr = contentsNames[indexPath.row]
        vc.editPurpse = .edit
        
        self.present(vc, animated: true, completion: nil)
        
    }

    
    
    func tableView(_ tableView: UITableView,
                            contextMenuConfigurationForRowAt indexPath: IndexPath,
                            point: CGPoint) -> UIContextMenuConfiguration?
    {
        let item = contentsNames[indexPath.row]
    
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { suggestedActions in
    
            let copy = UIAction(title: "copy", image: UIImage(systemName: "doc.on.clipboard.fill")) { _ in
    
                print("copyItem: \(item)")
    
            }
    
            let rename = UIAction(title: "rename", image: UIImage(systemName: "square.and.pencil")) { _ in
    
                print("renameItem: \(item)")
    
            }
    
            let delete = UIAction(title: "delete", image: UIImage(systemName: "trash")) { _ in
    
                print("deleteItem: \(item)")
    
            }
    
            return UIMenu(title: "menuTitle", children: [copy, rename, delete])
        })
    }
    
}
