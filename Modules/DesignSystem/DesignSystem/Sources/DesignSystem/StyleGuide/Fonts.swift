//
//  Fonts.swift
//  DesignSystem
//
//  Created by Bodgar Espinosa Miranda on 16/01/25.
//

import Foundation
import SwiftUI

public enum Fonts {
    /// Size 22 - Bold - Linear spacing 22/31
    case H1
    /// Size 18 - Bold - Linear spacing 18/23
    case H2
    /// Size 16 - Bold - Linear spacing 16/26
    case H3
    /// Size 16 - Semibold - Linear spacing 16/26
    case H4
    /// Size 14 - Semibold - Linear spacing 14/22
    case H5
    /// Size 16 - Regular - Linear spacing 16/26
    case T1
    /// Size 14 - Regular - Linear spacing 14/22
    case T2
    /// Size 12 - Regular - Linear spacing 12/19
    case info
    /// Size 11 - Medium - Linear spacing 11/14
    case menuActive
    /// Size 11 - Regular - Linear spacing 11/14
    case menuDefault
    
    public var attributes: (font: Font, lineSpacing: CGFloat) {
        switch self {
        case .H1:
            return (.system(size: 22, weight: .bold, design: .default), 31 - 22)
        case .H2:
            return (.system(size: 18, weight: .bold, design: .default), 23 - 18)
        case .H3:
            return (.system(size: 16, weight: .bold, design: .default), 26 - 16)
        case .H4:
            return (.system(size: 16, weight: .semibold, design: .default), 26 - 16)
        case .H5:
            return (.system(size: 14, weight: .semibold, design: .default), 22 - 14)
        case .T1:
            return (.system(size: 16, weight: .regular, design: .default), 26 - 16)
        case .T2:
            return (.system(size: 14, weight: .regular, design: .default), 22 - 14)
        case .info:
            return (.system(size: 12, weight: .regular, design: .default), 19 - 12)
        case .menuActive:
            return (.system(size: 11, weight: .medium, design: .default), 14 - 11)
        case .menuDefault:
            return (.system(size: 11, weight: .regular, design: .default), 14 - 11)
        }
    }
}
