//
//  ToolViewController.swift
//  TableviewDelegate
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit
protocol ToolViewDelegate {
    func showTool(with data: MacOs)
}
class ToolViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var editImage: UIImageView!
    var delegate :ToolViewDelegate?
    var macOS: MacOs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let macOS = macOS, let imageData = macOS.image {
            editImage?.image = UIImage(data:imageData)
            textField.text   = macOS.name
        }
    }
    var image: UIImage? {
        didSet {
            editImage?.image = image
            macOS?.image     = image?.pngData()
        }
    }
    
    @IBAction func tap(_ sender: Any) {
        let imagepickerControllerDeleget = UIImagePickerController()
        imagepickerControllerDeleget.sourceType = .photoLibrary
        imagepickerControllerDeleget.delegate = self
        present(imagepickerControllerDeleget, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Save(_ sender: Any) {
        if macOS == nil {
            macOS = MacOs(image: image?.pngData(), name: textField.text ?? "", price: "$20")
        }
        macOS?.name = textField.text ?? ""
        macOS?.price = txtField2.text ?? ""
        delegate?.showTool(with: macOS!)
        navigationController?.popToRootViewController(animated: true)
        
        //        else {
        //            let alert = UIAlertController(title: "Thông báo", message: "Vui lòng nhập name and photo", preferredStyle: UIAlertController.Style.alert)
        //            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        //            self.present(alert, animated: true, completion: nil)
        //        }
    }
    
    
}
