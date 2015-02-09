SwiftBond/Bond Demo
=====

!!! This demo project refere to my forked Bond repository, which is not original. So, you do not refere to this project. This project is for my study only.
---

### UITextField and UISlider

![demo1](demo1.gif)


```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITextField
        textField ->> textLabel
        
        // UISlider
        slider
            .map({"Hi, my value is \($0)"})
            ->> sliderLabel
    }
```

### Validation

![demo2](demo2.gif)

```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ============= rule1 =============
        let rule1a = reduce(usernameField, emailField, false) {
            !($0.isEmpty || $1.isEmpty)
        }
        let rule1b = reduce(passwordField, passwordConfirmField, false) {
            $0 == $1
        }
        let rule1c = passwordField.map { countElements($0) >= 8 }
        reduce(rule1a, rule1b, rule1c, false) { $0 && $1 && $2 } ->> createButton

        // ============= rule2 =============
        reduce(passwordField, passwordConfirmField, "") {
            $0 == $1 ? "" : "The password does not match"
        } ->> errorLabel
        
    }
```

Getting Started
-----

`git clone https://github.com/mpon/SwiftBondDemo.git`

`git submodule update --init`

`open SwiftBondDemo.xcodeproj`

