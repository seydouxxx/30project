//
//  ViewController.swift
//  05_DiaryClone
//
//  Created by Seydoux on 2021/11/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var diaryList = [Diary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionViewInit()
    }
    
    private func collectionViewInit() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? WriteDiaryViewController else { return }
        viewController.delegate = self
    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "DiaryDeltailViewController") as? DiaryDetailViewController else { return }
        let diary = diaryList[indexPath.row]
        
        viewController.diary = diary
        viewController.indexPath = indexPath
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.diaryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryCell", for: indexPath) as? DiaryCell else { return UICollectionViewCell() }
        let diary = diaryList[indexPath.row]
        
        cell.titleLabel.text = diary.title
        cell.dateLabel.text = dateToString(from: diary.date)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width/2) - 20, height: 200)
    }
}

extension ViewController: WriteDiaryViewControllerDelegate {
    func writeDiary(diary: Diary) {
        self.diaryList.append(diary)
        self.collectionView.reloadData()
    }
}
