//
//  CommonTextField.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/25.
//

import UIKit
import Combine

class CommonTextField: UITextField {
    
    @Published var currentText: String = ""
    private var cornerRadius: CGFloat = 0
    
    init(cornerRadius: CGFloat = 8,
         borderWidth: CGFloat = 1,
         leftView: UIView? = nil,
         returnKeyType: UIReturnKeyType = .done,
         keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        
        self.borderStyle = .roundedRect
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.adjustsFontSizeToFitWidth = true
        if let leftView = leftView {
            self.leftView = leftView
            self.leftViewMode = .always
        }
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.delegate = self
        if keyboardType == .numberPad {
            self.inputAccessoryView = createToolbar()
        }
    }
    
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
           toolbar.barStyle = .default
           let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
           let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
           toolbar.items = [flexSpace, flexSpace, doneButton]
           return toolbar
    }
    
    @objc func doneButtonTapped() {
        resignFirstResponder()
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        .init(x: 10, y: 12.5, width: self.bounds.height - 25, height: self.bounds.height - 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommonTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textRange = Range(range, in: textField.text ?? "")
        if let ranges = textRange {
            currentText = textField.text?.replacingCharacters(in: ranges, with: string) ?? ""
        }
        return true
    }
    
//    - (BOOL)textFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end

//    - (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason API_AVAILABLE(ios(10.0)) API_UNAVAILABLE(watchos); // if implemented, called in place of textFieldDidEndEditing:

//
//    - (void)textFieldDidChangeSelection:(UITextField *)textField API_AVAILABLE(ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);
//
//    - (BOOL)textFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
//    - (BOOL)textFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.
//
//    /**
//     * @abstract Asks the delegate for the menu to be shown for the specified text range.
//     *
//     * @param textField                   The text field requesting the menu.
//     * @param range                            The characters range for which the menu is presented for.
//     * @param suggestedActions   The actions and commands that the system suggests.
//     *
//     * @return Return a UIMenu describing the desired menu hierarchy. Return @c nil to present the default system menu.
//     */
//    - (nullable UIMenu *)textField:(UITextField *)textField editMenuForCharactersInRange:(NSRange)range suggestedActions:(NSArray<UIMenuElement *> *)suggestedActions API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(watchos);
//
//    /**
//     * @abstract Called when the text field is about to present the edit menu.
//     *
//     * @param textField    The text field displaying the menu.
//     * @param animator      Appearance animator. Add animations to this object to run them alongside the appearance transition.
//     */
//    - (void)textField:(UITextField *)textField willPresentEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator API_AVAILABLE(ios(16.0))  API_UNAVAILABLE(tvos) API_UNAVAILABLE(watchos);
//
//    /**
//     * @abstract Called when the text field is about to dismiss the edit menu.
//     *
//     * @param textField    The text field displaying the menu.
//     * @param animator      Dismissal animator. Add animations to this object to run them alongside the dismissal transition.
//     */
//    - (void)textField:(UITextField *)textField willDismissEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator API_AVAILABLE(ios(16.0))  API_UNAVAILABLE(tvos) API_UNAVAILABLE(watchos);
}
