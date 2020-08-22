# DummyTextField
Custom textfield design with title on the top.

### Screenshots
Default | When error
:-------------------------:|:-------------------------:
![normal](https://user-images.githubusercontent.com/29127047/90949158-47c84a00-e470-11ea-9a18-5dc748075f2c.png) | ![error](https://user-images.githubusercontent.com/29127047/90949160-48f97700-e470-11ea-86d2-d1280c4eed8f.png)

### Installation
```swift
pod "DummyTextField"
```

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
dummyTextField.errorMessage = "Please fill username"
```

### Reset error
```swift
dummyTextField.errorMessage = nil
```
