# Jenkins Shared Library Template

> 🚀 A production-ready template for creating Jenkins Shared Libraries with proper structure, comprehensive testing, and code quality checks.

[![CI](https://github.com/Ichibytes/Jenkins-library-template/actions/workflows/ci.yml/badge.svg)](https://github.com/Ichibytes/Jenkins-library-template/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Java](https://img.shields.io/badge/Java-17%2B-orange.svg)](https://www.java.com/)
[![Groovy](https://img.shields.io/badge/Groovy-3.0-blue.svg)](https://groovy-lang.org/)
[![Gradle](https://img.shields.io/badge/Gradle-8.5-green.svg)](https://gradle.org/)

---

## 📋 Table of Contents

- [Features](#-features)
- [Structure](#-structure)
- [Quick Start](#-quick-start)
- [Development](#-development)
- [Usage Examples](#-usage-examples)
- [Testing](#-testing)
- [Requirements](#-requirements)
- [Contributing](#-contributing)
- [License](#-license)

---

## ✨ Features

| Feature | Description |
| ------- | ----------- |
| 🏗️ **Standard Structure** | Proper Jenkins library structure (`vars/`, `src/`, `resources/`) |
| 🧪 **Unit Testing** | Jenkins Pipeline Unit framework with comprehensive test coverage |
| 📊 **Coverage Reports** | JaCoCo integration for test coverage reporting |
| 🔍 **Code Quality** | CodeNarc static analysis with customizable rules |
| 🛠️ **Gradle Build** | Modern Gradle build system with wrapper included |
| 📝 **Examples** | Ready-to-use pipeline steps and utility classes |
| ✅ **Best Practices** | Serializable classes and Jenkins-compliant code |
| 📦 **Resources** | Resource file usage examples |

---

## 📁 Structure

```text
Jenkins-library-template/
├── 📂 vars/              # Global pipeline variables/steps
│   └── exampleStep.groovy
├── 📂 src/               # Groovy classes
│   └── org/jenkins/library/
│       └── ExampleUtility.groovy
├── 📂 resources/         # Static resource files
│   └── example-resource.txt
├── 📂 test/              # Unit tests
│   ├── vars/
│   └── src/
├── 📂 config/            # Configuration files
│   └── codenarc/
│       └── ruleset.groovy
├── 📄 build.gradle       # Gradle build configuration
├── 📄 Jenkinsfile        # CI/CD pipeline for the library
├── 📄 README.md          # This file
└── 📄 LICENSE            # MIT License
```

---

## 🚀 Quick Start

### 1. Clone and Customize

```bash
git clone https://github.com/Ichibytes/Jenkins-library-template.git
cd Jenkins-library-template
# Customize the library name, examples, and add your own steps
```

### 2. Configure in Jenkins

1. Navigate to **Manage Jenkins** → **Configure System**
2. Scroll to **Global Pipeline Libraries** section
3. Click **Add** to create a new library
4. Configure the following:
   - **Name**: `jenkins-library-template` (or your preferred name)
   - **Default Version**: `main` (or your default branch)
   - **Retrieval Method**: Modern SCM
   - **Source Code Management**: Git
   - **Project Repository**: `https://github.com/Ichibytes/Jenkins-library-template`
   - **Credentials**: Add if repository is private

### 3. Use in Your Pipelines

Add the library annotation at the top of your `Jenkinsfile`:

```groovy
@Library('jenkins-library-template') _

pipeline {
    agent any
    stages {
        stage('Example') {
            steps {
                exampleStep {
                    message = 'Hello from the library!'
                }
            }
        }
    }
}
```

---

## 🔄 CI/CD

This project uses **GitHub Actions** for continuous integration and testing:

- ✅ **Automated testing** on multiple Java versions (17, 21)
- ✅ **Code quality checks** with CodeNarc
- ✅ **Test coverage reports** with JaCoCo
- ✅ **Automated releases** on tag creation
- ✅ **Dependabot** for dependency updates with auto-merge

View the [workflow status](https://github.com/Ichibytes/Jenkins-library-template/actions) and [workflow files](.github/workflows/) for more details.

### Dependabot Auto-merge Setup

To enable automatic merging of Dependabot PRs:

1. Create a Personal Access Token (PAT):
   - Go to [GitHub Settings > Developer settings > Personal access tokens > Tokens (classic)](https://github.com/settings/tokens)
   - Click "Generate new token (classic)"
   - Select scopes: `repo` (full control) and `workflow`
   - Generate and copy the token

2. Add the PAT as a repository secret:
   - Go to Repository **Settings** → **Secrets and variables** → **Actions**
   - Click **New repository secret**
   - Name: `GH_PAT`
   - Value: Paste your PAT
   - Click **Add secret**

Once configured, Dependabot PRs for minor/patch updates will automatically merge after tests pass.

## 💻 Development

### Running Tests Locally

```bash
# Run all tests
./gradlew test

# Run tests with coverage report
./gradlew test jacocoTestReport

# View coverage report (macOS)
open build/reports/jacoco/test/html/index.html

# View coverage report (Linux)
xdg-open build/reports/jacoco/test/html/index.html
```

### Code Quality Checks

```bash
# Run CodeNarc static analysis
./gradlew codenarcMain codenarcTest

# View code quality reports
open build/reports/codenarc/main.html
```

### Run All Quality Checks

```bash
# Run tests, coverage, and code quality checks
./gradlew qualityCheck
```

---

## 📖 Usage Examples

### Adding New Pipeline Steps

1. **Create** a new file in `vars/` directory (e.g., `vars/myStep.groovy`)
2. **Implement** the `call` method:

```groovy
def call(Map config) {
    def message = config.message ?: 'Default message'
    echo "Executing myStep with message: ${message}"
    // Your step implementation
}
```

3. **Add tests** in `test/vars/MyStepTest.groovy`
4. **Use** in pipelines: `myStep { message = 'Hello' }`

### Adding Utility Classes

1. **Create** a class in `src/org/jenkins/library/` (or your package)
2. **Make it Serializable** (Jenkins requirement):

```groovy
package org.jenkins.library

class MyUtility implements Serializable {
    private static final long serialVersionUID = 1L
    
    static String doSomething(String input) {
        // Your implementation
        return "Processed: ${input}"
    }
}
```

3. **Add tests** in `test/src/org/jenkins/library/MyUtilityTest.groovy`
4. **Use** in pipeline steps: `import org.jenkins.library.MyUtility`

### Using Resources

Access resource files from `resources/` directory in your pipeline steps:

```groovy
def call() {
    def content = libraryResource('my-resource.txt')
    echo content
}
```

---

## 🧪 Testing

This library uses the [Jenkins Pipeline Unit](https://github.com/jenkinsci/JenkinsPipelineUnit) framework for comprehensive testing.

### Example Test Structure

```groovy
import com.lesfurets.jenkins.unit.BasePipelineTest
import org.junit.Before
import org.junit.Test

class MyStepTest extends BasePipelineTest {
    @Before
    void setUp() {
        super.setUp()
        helper.registerAllowedMethod('echo', [String.class], null)
    }
    
    @Test
    void testMyStep() {
        def script = loadScript('vars/myStep.groovy')
        script.call([message: 'test'])
        // Assertions...
    }
}
```

### Test Coverage

- ✅ Unit tests for all pipeline steps
- ✅ Unit tests for utility classes
- ✅ Coverage reports with JaCoCo
- ✅ Parallel test execution enabled

---

## 📦 Requirements

| Requirement | Version | Notes |
| ----------- | ------- | ----- |
| **Java** | 17+ | Required for building and testing (Java 11 is deprecated, Java 17+ is recommended) |
| **Gradle** | 8.5 | Wrapper included in repository |
| **Jenkins** | 2.x | Required for using the library in pipelines |

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

**Quick contribution steps:**

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests (`./gradlew test`)
5. Commit your changes (`git commit -m 'Add: amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

For more details, see [CONTRIBUTING.md](CONTRIBUTING.md).

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📞 Support

- 🐛 **Bug Reports**: [Open an issue](https://github.com/Ichibytes/Jenkins-library-template/issues/new?template=bug_report.md)
- 💡 **Feature Requests**: [Open an issue](https://github.com/Ichibytes/Jenkins-library-template/issues/new?template=feature_request.md)
- ❓ **Questions**: [Open an issue](https://github.com/Ichibytes/Jenkins-library-template/issues/new?template=question.md)

---

### Made with ❤️ for the Jenkins community

**⭐ [Star this repo](https://github.com/Ichibytes/Jenkins-library-template)** | **🐛 [Report Bug](https://github.com/Ichibytes/Jenkins-library-template/issues)** | **💡 [Request Feature](https://github.com/Ichibytes/Jenkins-library-template/issues)**
