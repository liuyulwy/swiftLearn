//
//  TabbarItemContentView.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/11.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class TabbarItemCenterContentView: ESTabBarItemContentView {
    
    lazy var centerLabel: UILabel = {
        let label: UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        label.text = "数据库"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        renderingMode = .alwaysOriginal
        self.insets = UIEdgeInsets.init(top: -32, left: 0, bottom: 0, right: 0)
        self.superview?.bringSubviewToFront(self)
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 30
        imageView.layer.shadowColor = UIColor.blue.cgColor
        imageView.layer.shadowOpacity = 0.2
        imageView.layer.shadowRadius = 5
        imageView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.addSubview(centerLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateLayout() {
        super.updateLayout()
        imageView.frame = CGRect.init(x: 0, y: 0, width: 60, height: 60)
        imageView.center = CGPoint.init(x: self.bounds.size.width / 2.0, y: self.bounds.size.height / 2.0)
        centerLabel.center = imageView.center
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let p = CGPoint.init(x: point.x - imageView.frame.origin.x, y: point.y - imageView.frame.origin.y)
        return sqrt(pow(imageView.bounds.size.width / 2.0 - p.x, 2) + pow(imageView.bounds.size.height / 2.0 - p.y, 2)) < imageView.bounds.size.width / 2.0
    }
}

class TabbarItemContentView: ESTabBarItemContentView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        renderingMode = .alwaysOriginal
        textColor = UIColor.lightGray
        highlightTextColor = UIColor.black
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
