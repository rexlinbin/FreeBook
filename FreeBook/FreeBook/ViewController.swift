//
//  ViewController.swift
//  FreeBook
//
//  Created by admin on 2017/9/11.
//  Copyright © 2017年 lengyue. All rights reserved.
//

import UIKit
import Moya
import Fuzi

class ViewController: UIViewController {
    var provider = MoyaProvider<MyApi>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getHomeData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getHomeData(){
        provider.request(.Home, completion: {result in
            switch result{
            case let .success(response):
                let data = response.data
                var str = String(data: data, encoding: String.Encoding.utf8)
                if (str == nil) {
                    let enc:String.Encoding = String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(0x0632))
                    str = String(data: data, encoding: enc)
                }
                if str != nil {
                    self.parseBookHtml(str: str!)
                }
                
                
                print(str ?? "无内容")
                break
            case let .failure(error):
                print(error.errorDescription ?? "网络错误")
                break
                
            }
        })
    }
    
    var hotBooks = [String]()
    func parseBookHtml(str:String){
        do{
            let doc = try HTMLDocument(string: str)
            let ps = doc.xpath("//p")
            for p in ps {
                if p.attr("class") == "hotlink" {
                    let aNodes = p.children(tag: "a")
                    for a in aNodes {
                        hotBooks.append(a.attr("href")!)
                    }
                }
            }
            
        }catch let error{
            print(error.localizedDescription)
        }
        
    }
    
}
