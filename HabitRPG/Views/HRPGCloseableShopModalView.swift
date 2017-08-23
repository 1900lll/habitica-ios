//
//  HRPGCloseableShopModalView.swift
//  Habitica
//
//  Created by Elliot Schrock on 8/12/17.
//  Copyright © 2017 Phillip Thelen. All rights reserved.
//

import UIKit

@IBDesignable
class HRPGCloseableShopModalView: UIView {
    @IBOutlet weak var shopModalBgView: HRPGShopModalBgView!
    @IBOutlet weak var closeButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func awakeFromNib() {
        styleViews()
    }
    
    func styleViews() {
        closeButton.layer.cornerRadius = 12
        closeButton.setTitleColor(UIColor.purple400(), for: UIControlState.normal)
    }
    
    // MARK: - Private Helper Methods
    
    private func setupView() {
        if let view = viewFromNibForClass() {
            view.frame = bounds
            
            view.autoresizingMask = [
                UIViewAutoresizing.flexibleWidth,
                UIViewAutoresizing.flexibleHeight
            ]
            
            addSubview(view)
        }
    }
    
    // Loads a XIB file into a view and returns this view.
    private func viewFromNibForClass() -> UIView? {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        
        return view
    }

}
