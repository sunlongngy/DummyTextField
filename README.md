# DummyTextField
Custom textfield design with title on the top.

### Initialize
```swift
let dummyTextField: DummyTextField = {
    let textfield = DummyTextField()
    textfield.setupBorder(
        color   : .lightGray,
        width   : 1,
        radius  : 4
    )
    textfield.setupTitle(
        text        : "Username",
        textColor   : .gray,
        font        : UIFont.systemFont(ofSize: 12, weight: .regular)
    )
    return textfield
}()
```

### Error message
```swift
dummyTextField.errorMessage = "Please fill in the blank"
```

### Reset error
```swift
dummyTextField.errorMessage = nil
```
