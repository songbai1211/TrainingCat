//
//  songbaizhangChangeNameViewController.swift
//  TrainingCat
//
//  Created by crespo on 2020/3/11.
//  Copyright © 2020 crespo. All rights reserved.
//

import UIKit

class songbaizhangChangeNameViewController: UIViewController {
    var nameField = UITextField()
    var loginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "修改昵称"
        self.view.backgroundColor = UIColor(hexString: "#f5f5f5")
        nameField.frame = CGRect.init(x: 0, y: 100, width: screenWidth, height: 50)
        nameField.backgroundColor = .white
        nameField.placeholder = "请输入昵称"
//        nameField.layer.cornerRadius = 5
//        nameField.layer.masksToBounds = true
        self.view.addSubview(nameField)
        self.navigationController?.navigationBar.tintColor = .white;

            loginButton.frame = CGRect.init(x: 40, y: 200, width: screenWidth-80, height: 50)
           //       loginButton.b = .UIButtonTypeCustom
                   loginButton.setTitle("确认修改", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
                   loginButton.backgroundColor = UIColor(hexString: "#1296db")
                   self.view.addSubview(loginButton)
                   
        loginButton.addTarget(self, action: #selector(changeName), for: .touchUpInside)
        loginButton.layer.cornerRadius = 8
        loginButton.layer.masksToBounds = true
        
        
        
    }
    
    @objc func changeName() {
        let mb = MBProgressHUD.showAdded(to: self.view, animated: true)
        if nameField.text?.count == 0  {
            mb.label.text = "昵称不能为空";
            mb.hide(animated: true, afterDelay: 1)
            return;
        }
        mb.label.text = "修改成功";
        mb.hide(animated: true, afterDelay: 1)
        UserDefaults.standard.setValue(nameField.text, forKey: "nickname")
        UserDefaults.standard.synchronize()
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true);
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
