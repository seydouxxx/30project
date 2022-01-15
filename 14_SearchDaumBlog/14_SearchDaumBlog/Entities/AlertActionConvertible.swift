//
//  AlertActionConvertible.swift
//  14_SearchDaumBlog
//
//  Created by Seydoux on 2021/12/19.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
