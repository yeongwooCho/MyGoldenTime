//
//  RecordViewController.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/05.
//

import UIKit
import SpreadsheetView

class RecordViewController: UIViewController {
    
    var salesSpreadsheetData: SalesSpreadsheetData = SalesSpreadsheetData()
    
    var spreadsheetView: SpreadsheetView!
    
    override func loadView() {
        self.view = UIView()
        self.spreadsheetView = SpreadsheetView()
        self.configureView()
        self.configureSubviews()
        self.configureConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupSpreadsheetView()
    }
    
    private func configureView() {
        guard let view = self.view else { return }

        view.backgroundColor = .systemBackground
    }

    private func configureSubviews() {
        guard let view = self.view else { return }

        guard let spreadsheetView = self.spreadsheetView else { return }
        view.addSubview(spreadsheetView)
    }
    
    private func configureConstraints() {
        guard let view = self.view else { return }
        guard let spreadsheetView = self.spreadsheetView else { return }
        spreadsheetView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            spreadsheetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            spreadsheetView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            spreadsheetView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spreadsheetView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupSpreadsheetView() {
        spreadsheetView.dataSource = self
        spreadsheetView.register(HeaderCell.self, forCellWithReuseIdentifier: String(describing: HeaderCell.self))
        spreadsheetView.register(DateCell.self, forCellWithReuseIdentifier: String(describing: DateCell.self))
        spreadsheetView.register(TextCell.self, forCellWithReuseIdentifier: String(describing: TextCell.self))
    }
}

extension RecordViewController: SpreadsheetViewDataSource {

    func frozenRows(in spreadsheetView: SpreadsheetView) -> Int { // 고정
        return self.salesSpreadsheetData.header.count
    }

    func frozenColumns(in spreadsheetView: SpreadsheetView) -> Int { // 고정
        return 1
    }
    
    func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int { // 고정
        return self.salesSpreadsheetData.header[0].count
    }
    
    func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        return self.salesSpreadsheetData.header.count + self.salesSpreadsheetData.data.count
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
        return 100
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {
        return 40
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, cellForItemAt indexPath: IndexPath) -> Cell? {
        switch (indexPath.row, indexPath.column) {
        case (0, 0):
            guard let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else { return Cell() }
            cell.label.text = self.salesSpreadsheetData.header[0][0]
            return cell
        case (0, indexPath.column):
            guard let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else { return Cell() }
            cell.label.text = self.salesSpreadsheetData.header[0][indexPath.column]
            return cell
        case (indexPath.row, 0):
            guard let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: DateCell.identifier, for: indexPath) as? DateCell else { return Cell() }
            cell.label.text = self.salesSpreadsheetData.data[indexPath.row - self.salesSpreadsheetData.header.count][indexPath.column]
            return cell
        default:
            guard let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: TextCell.identifier, for: indexPath) as? TextCell else { return Cell() }
            cell.label.text = self.salesSpreadsheetData.data[indexPath.row - self.salesSpreadsheetData.header.count][indexPath.column]
            return cell
        }
    }
}
