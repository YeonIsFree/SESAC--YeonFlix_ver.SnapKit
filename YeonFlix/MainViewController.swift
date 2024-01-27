//
//  MainViewController.swift
//  YeonFlix
//
//  Created by Seryun Chun on 2023/12/27.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    static let movieList: [String] = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    
     // MARK: - UI Properties
    
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "노량")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let mainGenreLabel: UILabel = {
        let label = UILabel()
        label.text = "응원하고픈 ⋅ 흥미진진 ⋅ 사극 ⋅ 전투 ⋅ 한국작품"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    let mainPlayButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "arrowtriangle.right.fill")
        config.attributedTitle = "재생"
        config.imagePadding = 10
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .white
        config.imagePlacement = .leading
        button.configuration = config
        return button
    }()
    
    let mainLikeButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "plus")
        config.title = "내가 찜한 리스트"
        config.imagePadding = 10
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .darkGray
        config.imagePlacement = .leading
        button.configuration = config
        return button
    }()
    
    lazy var mainButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            mainPlayButton,
            mainLikeButton
        ])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    let contentsNowLabel = {
        let label = UILabel()
        label.text = "지금 뜨는 콘텐츠"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let firstContentsNow = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: movieList.randomElement() ?? "")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let secondContentsNow = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: movieList.randomElement() ?? "")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let thirdContentsNow = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: movieList.randomElement() ?? "")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var contentNowStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            firstContentsNow,
            secondContentsNow,
            thirdContentsNow
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        return stackView
    }()
    
     // MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
     // MARK: - UI Configuration Method
    
    func render() {
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.horizontalEdges.equalTo(view).inset(10)
            make.height.equalTo(500)
        }
        
        mainImage.addSubview(mainGenreLabel)
        mainGenreLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.centerX.equalToSuperview()
        }
        
        mainImage.addSubview(mainButtonStackView)
        mainButtonStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainGenreLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
        
        view.addSubview(contentsNowLabel)
        contentsNowLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(0)
            make.height.equalTo(20)
        }
        
        view.addSubview(contentNowStackView)
        contentNowStackView.snp.makeConstraints { make in
            make.top.equalTo(contentsNowLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}
