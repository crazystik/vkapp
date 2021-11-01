//
//  Data+PrettyJSON.swift
//  vkapp
//
//  Created by Pavel Lazarev on 26.10.2021.
//

import Foundation

extension Data {
    var prettyJSON: String? { /// gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding: .utf8)
        else { return nil }
        return prettyPrintedString
    }
}
