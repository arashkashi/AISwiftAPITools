Here’s a short README.md for your package, AISwiftAPITools, explaining how it works and how to use it.

📌 README.md

# AISwiftAPITools

AISwiftAPITools is a Swift command-line tool (`swift-api-rewriter`) that **parses Swift source files** and **extracts public function signatures**, generating a header-like `.hswift` file for API documentation.

## 🚀 Features
- Parses Swift files using **SwiftSyntax** and **SwiftParser**.
- Extracts **public function signatures**.
- Outputs results to a `.hswift` file in the same directory.

## 🛠 Installation
### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-repo/AISwiftAPITools.git
cd AISwiftAPITools

2️⃣ Build the CLI

swift build -c release

3️⃣ Install Globally (Optional)

sudo cp .build/release/swift-api-rewriter /usr/local/bin/

Now, you can run it from anywhere using:

swift-api-rewriter <path-to-swift-file>

📜 Usage

Extract API from a Swift file

swift run swift-api-rewriter MyClass.swift

or, if installed:

swift-api-rewriter MyClass.swift

Example

🔹 Input (MyClass.swift):

public func greet(name: String) -> String {
    return "Hello, \(name)!"
}

private func hidden() {}

public func add(a: Int, b: Int) -> Int {
    return a + b
}

🔹 Output (MyClass.hswift):

public func greet(name: String) -> String
public func add(a: Int, b: Int) -> Int

✅ This extracts public APIs and generates an .hswift file for easy reference.

🏗 Future Enhancements
	•	Support for directories (process multiple Swift files).
	•	Integration with Google API (pending).
	•	More filtering options for function extraction.

📄 License

This project is licensed under MIT License.

---

### **📌 Summary**
✅ **Explains what the package does**  
✅ **Provides installation instructions**  
✅ **Shows how to run the CLI tool**  
✅ **Includes input/output examples**  

🚀 **Would you like to add support for processing an entire directory?** 😃
