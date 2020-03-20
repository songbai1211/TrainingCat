//
//  RegisterViewController.swift
//  TrainingCat
//
//  Created by crespo on 2020/3/11.
//  Copyright © 2020 crespo. All rights reserved.
//

import UIKit
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
class RegisterViewController: UIViewController {

    var bgView = UIView()
    
    var userName = UITextField()
    var password = UITextField()
    var passwordAgain = UITextField()
    var button  = UIButton()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "注册"
        self.view.backgroundColor = UIColor(hexString: "#16c7fb")
        setupUI()
    }
    
    func setupUI() {
        
        
        let   imageView=UIImageView.init(frame: CGRect.init(x: (screenWidth-50)/2, y: 70, width: 50, height: 50))
        self.view.addSubview(imageView)
        imageView.image = UIImage.init(named: "refresh")
        
        
        
        self.view.addSubview(bgView)
        bgView.backgroundColor = .white
        bgView.frame = CGRect.init(x: 40, y: 120, width:screenWidth-80 , height: 150)
        bgView.layer.cornerRadius = 5
        bgView.layer.masksToBounds = true
        
        bgView.addSubview(userName)
        userName.frame = CGRect.init(x: 10, y: 0, width: screenWidth - 40, height: 50)
        userName.backgroundColor = .clear
        userName.placeholder = "请输入用户名"
        userName.layer.cornerRadius = 5.0
        userName.layer.masksToBounds = true
        
        
        
        
        
        bgView.addSubview(password)
         password.frame = CGRect.init(x: 10, y: 50, width: screenWidth - 40, height: 50)
         password.backgroundColor = .clear
         password.placeholder = "请输入密码"
         password.layer.cornerRadius = 5.0
         password.layer.masksToBounds = true
        
        bgView.addSubview(passwordAgain)
        passwordAgain.frame = CGRect.init(x: 10, y: 100, width: screenWidth - 40, height: 50)
        passwordAgain.backgroundColor = .clear
        passwordAgain.placeholder = "请再次输入密码"
        passwordAgain.layer.cornerRadius = 5.0
        passwordAgain.layer.masksToBounds = true

        
        let lineOneView = UIView.init(frame: CGRect.init(x: 0, y: 50, width: screenWidth-50, height: 1))
          lineOneView.backgroundColor = UIColor(hexString: "#f5f5f5")
          bgView.addSubview(lineOneView)
        let lineTwoView = UIView.init(frame: CGRect.init(x: 0, y: 100, width: screenWidth-50, height: 1))
          lineTwoView.backgroundColor = UIColor(hexString: "#f5f5f5")
          bgView.addSubview(lineTwoView)
        
        
        
//        button.buttonType = UIButton.ButtonType.custom
        self.view.addSubview(button)
        button.frame = CGRect.init(x: 40, y: 300, width: screenWidth - 80, height: 50)
        button.setTitle("注册", for: .normal)
        button.backgroundColor = UIColor(hexString: "#2261f8")
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(register), for: .touchUpInside)
                
    }
    @objc func register() {
            let mb = MBProgressHUD.showAdded(to: self.view, animated: true)
//               mb.bezelView.backgroundColor = UIColor(hexString: "#f2394e")
//               mb.label.textColor = .white;
               
        if  userName.text?.count == 0 || password.text?.count == 0  || passwordAgain.text?.count == 0{
                   mb.label.text = "用户名密码不能为空";
                   mb.hide(animated: true, afterDelay: 1)
                   return;
               }
        if password.text != passwordAgain.text {
            mb.label.text = "密码必须一致";
            mb.hide(animated: true, afterDelay: 1)
            return;
        }
                
           mb.label.text = "注册成功";
           mb.hide(animated: true, afterDelay: 1)
        
        let dic = [ "user" :userName.text!, "password":password.text! ]
        let array = songbaizhangDataManager.shareInstance().userDataArry
        array.add(dic)
        UserDefaults.standard.set(array, forKey: "userDatas")
        
       UserDefaults.standard.setValue("1", forKey: "login")
       UserDefaults.standard.synchronize()
        var controller:UIViewController = self
        while controller.presentingViewController != nil {
            controller = controller.presentingViewController!
        }
        controller.dismiss(animated: true, completion: nil)
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
