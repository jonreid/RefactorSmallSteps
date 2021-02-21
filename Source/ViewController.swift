//  Refactor Small Steps by Jon Reid, https://qualitycoding.org/refactor-small-steps/
//  Copyright 2021 Quality Coding, Inc. See LICENSE.txt

import UIKit

enum ViewStyle {
    case undetermined
    case normal
    case alternative
}

struct ScreenStrings {
    let field1Placeholder: String
    let field1Hint: String
    let field2Placeholder: String
    let field2Hint: String
}

struct ViewModel {
    let isAlternateStyle: Bool
}

final class ViewController: UIViewController {
    let textField1 = UITextField()
    let textField2 = UITextField()
    private let strings: ScreenStrings
    private let viewModel: ViewModel
    private(set) var viewStyle: ViewStyle

    init(strings: ScreenStrings, viewModel: ViewModel) {
        self.strings = strings
        self.viewModel = viewModel
        viewStyle = .undetermined
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder:) is not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if viewModel.isAlternateStyle {
            textField1.placeholder = strings.field1Hint
            textField2.placeholder = strings.field2Hint
        } else {
            textField1.placeholder = strings.field1Placeholder
            textField2.placeholder = strings.field2Placeholder
        }

        if viewModel.isAlternateStyle {
            setUpAlternateView()
        } else {
            setUpNormalView()
        }
    }

    private func setUpAlternateView() {
        viewStyle = .alternative
    }

    private func setUpNormalView() {
        viewStyle = .normal
    }
}
