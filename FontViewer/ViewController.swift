//
//  ViewController.swift
//  FontViewer
//
//  Created by 植田圭祐 on 2020/03/22.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIFontPickerViewControllerDelegate {
    
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.frame = CGRect(x: 100, y: 100, width: 500, height: 50)
        //label.backgroundColor = .black
        label.text = "test"
        label.font = UIFont(name: "GillSans", size: 20)
        view.addSubview(label)
        

        
        let button = UIButton()
        button.center = view.center
        button.frame.size = CGSize(width: 50, height: 50)
        button.layer.cornerRadius = 25
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(pushFontButton), for: .touchUpInside)
        view.addSubview(button)
        // フォントピッカーの表示
        //self.present(fontPicker, animated: true, completion: nil)
    }
    
    @objc func pushFontButton() {
                // フォントピッカーの表示設定
        let fontPickerConfig = UIFontPickerViewController.Configuration()
        
        // 複数のフォントフェイスを表示
        fontPickerConfig.includeFaces = false
        
        // 各フォント名にそのフォントを適応する (true だとシステムフォントで表示されるっぽい)
        fontPickerConfig.displayUsingSystemFont = false
        
        // 日本語フォントのみ表示
        fontPickerConfig.filteredLanguagesPredicate = UIFontPickerViewController.Configuration.filterPredicate(forFilteredLanguages: ["en"])
        
        // フォントピッカーの設定
        let fontPicker = UIFontPickerViewController(configuration: fontPickerConfig)
        fontPicker.delegate = self
        
        self.present(fontPicker, animated: true, completion: nil)
    }
    
    // UIFontPickerViewControllerDelegate - 選択後
    func fontPickerViewControllerDidPickFont(_ fontPicker: UIFontPickerViewController) {
        if let fontName = fontPicker.selectedFontDescriptor?.postscriptName {
            print("FontName: \(fontName)")
            label.font = UIFont(name: fontName, size: 20)
        }
    }

    // UIFontPickerViewControllerDelegate - キャンセル
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
    }
}
