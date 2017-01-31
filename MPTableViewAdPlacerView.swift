//
//  MPTableViewAdPlacerView.swift
//  test
//
//  Created by Tom Cheung on 2017-01-30.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//


import UIKit
import MoPub

class MPTableViewAdPlacerView: UIView, MPNativeAdRendering {
    var titleLabel: UILabel!
    var mainTextLabel: UILabel!
    var iconImageView: UIImageView!
    var mainImageView: UIImageView!
    var privacyInformationIconImageView: UIImageView!
    var ctaLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.titleLabel = UILabel()
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(17.0))
        self.titleLabel?.text = "Title"
        self.addSubview(self.titleLabel)
        self.mainTextLabel = UILabel()
        self.mainTextLabel.font = UIFont.systemFont(ofSize: CGFloat(14.0))
        self.mainTextLabel.text = "Text"
        self.mainTextLabel.numberOfLines = 2
        self.addSubview(self.mainTextLabel)
        self.iconImageView = UIImageView()
        self.addSubview(self.iconImageView)
        self.mainImageView = UIImageView()
        self.mainImageView.clipsToBounds = true
        self.mainImageView.contentMode = .scaleAspectFill
        self.addSubview(self.mainImageView)
        self.ctaLabel = UILabel()
        self.ctaLabel.font = UIFont.systemFont(ofSize: CGFloat(14.0))
        self.ctaLabel.text = "CTA Text"
        self.ctaLabel.textColor = UIColor.green
        self.ctaLabel.textAlignment = .right
        self.addSubview(self.ctaLabel)
        self.privacyInformationIconImageView = UIImageView()
        self.addSubview(self.privacyInformationIconImageView)
        self.backgroundColor = UIColor(white: CGFloat(0.21), alpha: CGFloat(1.0))
        self.titleLabel?.textColor = UIColor(white: CGFloat(0.86), alpha: CGFloat(1.0))
        self.mainTextLabel.textColor = UIColor(white: CGFloat(0.86), alpha: CGFloat(1.0))
        self.clipsToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let width: CGFloat = self.bounds.size.width
        self.titleLabel?.frame = CGRect(x: CGFloat(75), y: CGFloat(10), width: CGFloat(212), height: CGFloat(60))
        self.iconImageView.frame = CGRect(x: CGFloat(10), y: CGFloat(10), width: CGFloat(60), height: CGFloat(60))
        self.privacyInformationIconImageView.frame = CGRect(x: CGFloat(width - 30), y: CGFloat(10), width: CGFloat(20), height: CGFloat(20))
        self.ctaLabel.frame = CGRect(x: CGFloat(width - 100), y: CGFloat(270), width: CGFloat(90), height: CGFloat(48))
        self.mainTextLabel.frame = CGRect(x: CGFloat(width / 2 - 150), y: CGFloat(68), width: CGFloat(300), height: CGFloat(50))
        self.mainImageView.frame = CGRect(x: CGFloat(width / 2 - 150), y: CGFloat(119), width: CGFloat(300), height: CGFloat(156))
    }
    
    // MARK: - <MPNativeAdRendering>
    
    func nativeMainTextLabel() -> UILabel {
        return self.mainTextLabel
    }
    
    func nativeTitleTextLabel() -> UILabel {
        return self.titleLabel!
    }
    
    func nativeCallToActionTextLabel() -> UILabel {
        return self.ctaLabel
    }
    
    func nativeIconImageView() -> UIImageView {
        return self.iconImageView
    }
    
    func nativeMainImageView() -> UIImageView {
        return self.mainImageView
    }
    
    func nativePrivacyInformationIconImageView() -> UIImageView {
        return self.privacyInformationIconImageView
    }
}
