//
//  ViewController.swift
//  TableviewDelegate
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , IndexPathdelete, ToolViewDelegate{
    var macOs = [MacOs]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        macOs = [
            MacOs(image: (UIImage(named: "1")?.pngData())!, name: "Mac pro 2013", price: "55000.000"),
            MacOs(image: (UIImage(named: "2")?.pngData())!, name: "Mac 6", price: "77.000.000"),
            MacOs(image: (UIImage(named: "3")?.pngData())!, name: "Mac 7", price: "99.000.000"),
            MacOs(image: (UIImage(named: "4")?.pngData())!, name: "Mac 8", price: "12.000.000"),
            MacOs(image: (UIImage(named: "5")?.pngData())!, name: "Mac SE", price: "75.000.000"),
            MacOs(image: (UIImage(named: "1")?.pngData())!, name: "Mac X", price: "85.000.000"),
            MacOs(image: (UIImage(named: "2")?.pngData())!, name: "Mac XS", price: "95.000.000")]
        tableView.dataSource = self
        tableView.delegate   = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "Detail":
            guard let detailview = segue.destination as? DetailViewController else { return }
                detailview.toolViewDelegate = self
            if let indexPath = tableView.indexPathForSelectedRow {
                let data     = macOs[indexPath.row];
                detailview.macOS = data
            }
        case "Tool":
            guard let toolView = segue.destination as? ToolViewController else { return }
            toolView.delegate  = self
        default:
            print("see data")
        }
    }
    func showTool(with data: MacOs) {
        if let _ = tableView.indexPathForSelectedRow {
            
        } else {
            macOs.append(data)
        }
        tableView.reloadData()
    }
    
    func delete(at indexPAth: IndexPath) {
        macOs.remove(at: indexPAth.row)
        tableView.reloadData()
    }
    
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return macOs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell        = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        let listMacOs   = macOs[indexPath.row]
        if listMacOs.image != nil {
            
            cell.img.image  = UIImage(data: listMacOs.image!)
        }
        cell.name.text  = listMacOs.name ?? ""
        cell.price.text = listMacOs.price ?? ""
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
