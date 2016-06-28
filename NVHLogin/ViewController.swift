//
//  ViewController.swift
//  NVHLogin
//
//  Created by Hùng Nguyễn  on 6/25/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var bg_image: UIImageView!
    @IBOutlet weak var tef_userName: UITextField!
    @IBOutlet weak var tef_password: UITextField!

    @IBOutlet weak var btn_login: UIButton!
    @IBOutlet weak var btn_users: UIButton!
    
    var users = ["hungnguyen": "123","xuanthe": "234","vantu":"345","techmaster":"1"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }
    
    @IBAction func acc_login(sender: UIButton) {
        checkUser(tef_userName.text!)
    }
    
    @IBAction func acc_showUsers(sender: UIButton) {
         showUsers()
    }
    @IBAction func acc_addUser(sender: UIButton) {
        //print("added a new user")
        addUser(tef_userName.text!)
    }
    @IBAction func acc_editUser(sender: UIButton) {
        //print("edited user information")
        editUser(tef_userName.text!)
    }
    @IBAction func acc_deleteUser(sender: UIButton) {
        //print("deleted one user")
        deleteUser(tef_userName.text!)
    }
    
    
   
// ham checkUser kiem tra username + password
    func checkUser(pass :String) {
         if let password = users[tef_userName.text!] {
            if  password == tef_password.text  {
               print("Đăng nhập thành công")
                } else {
                    print("Sai mật khẩu")
                    return
                 }
            } else {
              print("Tài khoản không tồn tại")
              return
        }
    }
    
// ham showUsers show danh sach users/mat khau
    func showUsers() {
        print("Danh Sách Người Dùng")
        for (username,password) in users {
            print("Username : \(username) : Password : \(password)")
        }
    }
// ham addUser add 1 user moi vao dictionnary
    func addUser(string1 :String) {
        if let password = users[string1] {
            if password == tef_password.text {
                print("Username đã tồn tại")
            } else {
                print("Tạo username khác")
                return
            }
        } else {
            print("Đã thêm user \(string1): Password \(tef_password.text!)")
            users["\(string1)"] = "\(tef_password.text!)"
        }
    }
// ham editUser edit  password theo username
    func editUser(string2 :String) {
        if let password = users[string2] {
                print("Đã chỉnh sửa thông tin user \(string2) change password to \(tef_password.text!)")
                users.updateValue(tef_password.text!, forKey: string2)
            } else {
                print("Tài khoản không tồn tại")
                return
            }
    }
// ham deleteUser delete 1 user duoc chon theo username
    func deleteUser(string3 :String) {
        if let password = users[string3] {
            if password == tef_password.text {
            users.removeAtIndex(users.indexForKey(string3)!)
                print("Đã xoá user \(string3)")
            } else {
                print("Không có user này")
                return
            }
        } else {
            print("Tài khoản không tồn tại")
            return
        }
    }
}
