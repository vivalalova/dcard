//
//  String+.swift
//  card
//
//  Created by Lova on 2020/7/21.
//

import Foundation

extension String {
    func urls() -> [URL] {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))

        var results: [URL] = []
        for match in matches {
            guard let range = Range(match.range, in: self) else { continue }
            let substring = self[range]

            if let url = URL(string: "\(substring)") {
                results.append(url)
            }
        }

        return results
    }
}
