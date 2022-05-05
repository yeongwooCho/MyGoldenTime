//
//  RecordViewController.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/05.
//

import UIKit
import SpreadsheetView

class RecordViewController: UIViewController {
    
    var salesSpreadsheetData: SalesSpreadsheetData!
    
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
        self.requestSpreadsheetData()
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
    
    private func requestSpreadsheetData() {
        salesSpreadsheetData = SalesSpreadsheetData(data: [
            [StateInfo(date: "22-04-15", hour: 8, what: "iOS", why: "재밌어서", energy: 1, consentration: 1)],
            [StateInfo(date: "22-04-16", hour: 7, what: "클린코드", why: "재밌어서", energy: 4, consentration: 5)],
            [StateInfo(date: "22-04-17", hour: 9, what: "물먹기", why: "재밌어서", energy: 4, consentration: 2)],
            [StateInfo(date: "22-04-18", hour: 10, what: "화장실가기", why: "재밌어서", energy: 3, consentration: 2)],
            [StateInfo(date: "22-04-19", hour: 8, what: "유투브", why: "재밌어서", energy: 2, consentration: 3)],
            [StateInfo(date: "22-04-20", hour: 9, what: "독서중", why: "재밌어서", energy: 5, consentration: 4)],
            [StateInfo(date: "22-04-21", hour: 8, what: "헬스중", why: "재밌어서", energy: 1, consentration: 5)],
            [StateInfo(date: "22-04-22", hour: 11, what: "걷는중", why: "재밌어서", energy: 2, consentration: 1)],
            [StateInfo(date: "22-04-23", hour: 10, what: "밥먹는중", why: "재밌어서", energy: 4, consentration: 3)],
            [StateInfo(date: "22-04-24", hour: 15, what: "가만히 있는중", why: "재밌어서", energy: 3, consentration: 5)],
            [StateInfo(date: "22-04-25", hour: 16, what: "순간 멍때림", why: "재밌어서", energy: 4, consentration: 4)],
            [StateInfo(date: "22-04-26", hour: 14, what: "물먹는중", why: "재밌어서", energy: 4, consentration: 4)],
            [StateInfo(date: "22-04-27", hour: 10, what: "발표준비중", why: "재밌어서", energy: 2, consentration: 4)],
            [StateInfo(date: "22-04-28", hour: 11, what: "하늘 보는중", why: "재밌어서", energy: 5, consentration: 3)],
            [StateInfo(date: "22-04-29", hour: 12, what: "산책중", why: "재밌어서", energy: 1, consentration: 2)],
            [StateInfo(date: "22-04-30", hour: 8, what: "티타임중", why: "재밌어서", energy: 5, consentration: 5)],
            [StateInfo(date: "22-05-01", hour: 9, what: "거북이 구경중", why: "재밌어서", energy: 5, consentration: 1)],
            [StateInfo(date: "22-05-02", hour: 10, what: "버거킹 도착", why: "재밌어서", energy: 4, consentration: 2)],
            [StateInfo(date: "22-05-03", hour: 13, what: "콜로세움 노래", why: "재밌어서", energy: 4, consentration: 3)],
            [StateInfo(date: "22-05-04", hour: 12, what: "프로젝트 중", why: "재밌어서", energy: 3, consentration: 4)],
            [StateInfo(date: "22-05-05", hour: 15, what: "쉿! 회의중", why: "재밌어서", energy: 2, consentration: 5)],
            [StateInfo(date: "22-05-06", hour: 10, what: "하이", why: "재밌어서", energy: 1, consentration: 1)]
        ]
                                                    )
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
            cell.label.text = self.salesSpreadsheetData.data[indexPath.row - self.salesSpreadsheetData.header.count][indexPath.column].date
            return cell
        default:
            guard let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: TextCell.identifier, for: indexPath) as? TextCell else { return Cell() }
            cell.label.text = self.salesSpreadsheetData.data[indexPath.row - self.salesSpreadsheetData.header.count][0].what
            return cell
        }
    }
}
