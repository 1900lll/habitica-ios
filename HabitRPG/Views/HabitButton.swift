//
//  HabitButton.swift
//  Habitica
//
//  Created by Phillip Thelen on 06.03.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import UIKit
import Habitica_Models

class HabitButton: UIView {
    
    private let label = UIImageView()
    private let roundedView = UIView()
    private var buttonSize: CGFloat = 32
    private var isActive = false
    
    var action: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        addSubview(roundedView)
        addSubview(label)
        roundedView.layer.cornerRadius = buttonSize / 2
        label.contentMode = .center
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        roundedView.layer.borderWidth = 1
    }
    
    func configure(task: TaskProtocol, isNegative: Bool) {
        isActive = isNegative ? task.down : task.up
        
        if isActive {
            if isNegative {
                label.image = #imageLiteral(resourceName: "minus")
            } else {
                label.image = #imageLiteral(resourceName: "plus")
            }
            if ThemeService.shared.theme.isDark {
                backgroundColor = UIColor.forTaskValueDark(Int(task.value))
            } else {
                backgroundColor = UIColor.forTaskValue(Int(task.value))
            }
            
            if task.value >= 10 && task.value < -1 {
                roundedView.backgroundColor = UIColor.orange10()
            } else if task.value >= -1 && task.value < 1 {
                if ThemeService.shared.theme.isDark {
                    roundedView.backgroundColor = UIColor.yellow5()
                } else {
                    roundedView.backgroundColor = UIColor.yellow10()
                }
            } else {
                roundedView.backgroundColor = UIColor(white: 0, alpha: 0.1)
            }
            roundedView.layer.borderColor = UIColor.clear.cgColor
        } else {
            if isNegative {
                label.image = #imageLiteral(resourceName: "minus_gray")
            } else {
                label.image = #imageLiteral(resourceName: "plus_gray")
            }
            backgroundColor = ThemeService.shared.theme.contentBackgroundColorDimmed
            roundedView.layer.borderColor = UIColor.gray600().cgColor
            roundedView.backgroundColor = ThemeService.shared.theme.contentBackgroundColorDimmed
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let verticalCenter = frame.size.height / 2
        let horizontalCenter = frame.size.width / 2
        
        roundedView.frame = CGRect(x: horizontalCenter - self.buttonSize/2, y: verticalCenter - buttonSize/2, width: buttonSize, height: buttonSize)
        label.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
    @objc
    private func handleTap() {
        if isActive {
            if let action = self.action {
                action()
            }
            UIView.animate(withDuration: 0.2, animations: {[weak self] in
                self?.label.backgroundColor = self?.backgroundColor?.lighter(by: 0.1)
            }, completion: {[weak self] (_) in
                UIView.animate(withDuration: 0.2, animations: {
                    self?.label.backgroundColor = nil
                })
            })
        }
    }
}
