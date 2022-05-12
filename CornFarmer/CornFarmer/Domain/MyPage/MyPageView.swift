//
//  MyPageView.swift
//  CornFarmer
//
//  Created by 이상현 on 2022/05/04.
//

import UIKit
import Then
import SnapKit

class MyPageView: BaseView {
    let view = UILabel().then {
        $0.text = "qq"
        $0.textColor = .red
    }
    
    override func setup() {
        self.backgroundColor = .white
        self.addSubview(view)
    }
    
    override func bindConstraints() {
        view.snp.makeConstraints {
            $0.center.equalTo(view)
        }
    }
}
