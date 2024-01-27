//
//  SearchViewController.swift
//  YeonFlix
//
//  Created by Seryun Chun on 2023/12/27.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "게임, 시리즈, 영화를 검색하세요..."
        searchBar.backgroundColor = .darkGray
        searchBar.barTintColor = .systemBackground
        return searchBar
    }()
    
    let firstSortingButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.image = UIImage(resource: .blue)
        config.imagePadding = 3
        config.imagePlacement = .leading
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.title = "공개 예정"
        let transformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.foregroundColor = .black
            outgoing.font = UIFont.boldSystemFont(ofSize: 12)
            return outgoing
        }
        config.titleTextAttributesTransformer = transformer
        button.configuration = config
        return button
    }()
    
    let secondSortingButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        button.titleLabel?.font = .systemFont(ofSize: 12)
        config.image = UIImage(resource: .turquoise)
        config.imagePadding = 3
        config.imagePlacement = .leading
        config.baseBackgroundColor = .black
        config.baseForegroundColor = .white
        config.title = "모두의 인기 콘텐츠"
        let transformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.boldSystemFont(ofSize: 12)
            return outgoing
        }
        config.titleTextAttributesTransformer = transformer
        button.configuration = config
        return button
    }()
    
    let thirdSortingButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.image = UIImage(resource: .pink)
        config.imagePadding = 3
        config.imagePlacement = .leading
        config.baseBackgroundColor = .black
        config.baseForegroundColor = .white
        config.title = "TOP 10 시리즈"
        let transformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.foregroundColor = .white
            outgoing.font = UIFont.boldSystemFont(ofSize: 13)
            return outgoing
        }
        config.titleTextAttributesTransformer = transformer
        button.configuration = config
        return button
    }()
    
    lazy var sortingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            firstSortingButton,
            secondSortingButton,
            thirdSortingButton
        ])
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        return stackView
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "이런! 찾으시는 작품이 없습니다."
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    let subLabel: UILabel = {
       let label = UILabel()
        label.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()

     // MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
     // MARK: - UI Configuration Method
    
    func render() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        view.addSubview(sortingStackView)
        sortingStackView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(8)
            make.height.equalTo(40)
        }
        
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(sortingStackView.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(subLabel)
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
}
