//
//  ShoppingListModel.swift
//  ShoppingListApp
//
//  Created by Kaan Uzman on 12/12/23.
//

import Foundation

enum AmountType: Codable, Hashable {
    case piece
    case kg
    case litre
    case gram
    case ml
}

/// Money Type for Shopping List Model
enum MoneyType: String, Codable, Hashable {
    case tl = "₺"
    case dolar = "$"
    case euro = "€"
    case pound = "£"
}

/// Category for Shopping List Model
enum ListCategory: Codable, Hashable {
    case Food
    case Clothes
    case Electronics
    case Other
}

/// Shopping List Model for TableView
struct ShoppingListModel: Codable, Hashable {
    var productName: String
    var amount: Double
    var amountType: AmountType
    var isDone: Bool
    var money: Double
    var moneyType: MoneyType
    var category: ListCategory
    var createdDate: Date
}

extension ShoppingListModel {
    static let dummyList: [ShoppingListModel] = [
        ShoppingListModel(
            productName: "Egg",
            amount: 1,
            amountType: .piece,
            isDone: false,
            money: 1,
            moneyType: .tl,
            category: .Food,
            createdDate: Date()
        ),
        ShoppingListModel(
            productName: "Milk",
            amount: 1,
            amountType: .litre,
            isDone: false,
            money: 5,
            moneyType: .tl,
            category: .Food,
            createdDate: Date()
        ),
        ShoppingListModel(
            productName: "T-Shirt",
            amount: 1,
            amountType: .piece,
            isDone: false,
            money: 50,
            moneyType: .tl,
            category: .Clothes,
            createdDate: Date()
        ),
        ShoppingListModel(
            productName: "iPhone 12 Pro Max",
            amount: 1,
            amountType: .piece,
            isDone: false,
            money: 15000,
            moneyType: .tl,
            category: .Electronics,
            createdDate: Date()
        ),
        ShoppingListModel(
            productName: "MacBook Pro M1",
            amount: 1,
            amountType: .piece,
            isDone: false,
            money: 15000,
            moneyType: .tl,
            category: .Electronics,
            createdDate: Date()
        ),
        ShoppingListModel(
            productName: "MacBook Pro M1",
            amount: 1,
            amountType: .piece,
            isDone: false,
            money: 15000,
            moneyType: .tl,
            category: .Electronics,
            createdDate: Date()
        ),
        ShoppingListModel(
            productName: "MacBook Pro M1",
            amount: 1,
            amountType: .piece,
            isDone: false,
            money: 15000,
            moneyType: .tl,
            category: .Electronics,
            createdDate: Date()
        ),
        ShoppingListModel(
            productName: "MacBook Pro M1",
            amount: 1,
            amountType: .piece,
            isDone: false,
            money: 15000,
            moneyType: .tl,
            category: .Electronics,
            createdDate: Date()
        ),
    ]
}
