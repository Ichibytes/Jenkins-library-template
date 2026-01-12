# Contributing to Jenkins Shared Library Template

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing.

## Getting Started

1. Fork the repository: https://github.com/Ichibytes/Jenkins-library-template
2. Clone your fork: `git clone https://github.com/YOUR-USERNAME/Jenkins-library-template.git`
3. Create a branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Run tests: `./gradlew test`
6. Run code quality checks: `./gradlew codenarcMain codenarcTest`
7. Commit your changes: `git commit -m "Add: description of changes"`
8. Push to your fork: `git push origin feature/your-feature-name`
9. Create a Pull Request

## Development Guidelines

### Code Style

- Follow Groovy coding conventions
- Use meaningful variable and method names
- Add comments for complex logic
- Keep methods focused and small
- Run CodeNarc before submitting: `./gradlew codenarcMain codenarcTest`

### Adding New Pipeline Steps

When adding new pipeline steps:

1. **Create the step** in `vars/yourStep.groovy`
   - Use Map-based configuration for flexibility
   - Provide sensible defaults
   - Add Javadoc comments
   - Make it idempotent when possible

2. **Write tests** in `test/vars/YourStepTest.groovy`
   - Test happy path
   - Test edge cases
   - Test error conditions
   - Aim for good test coverage

3. **Update documentation** in README.md if needed

Example:

```groovy
// vars/yourStep.groovy
/**
 * Your step description
 * 
 * Usage:
 *   yourStep {
 *     param = 'value'
 *   }
 */
def call(Map config) {
    def param = config.param ?: 'default'
    // Implementation
}
```

### Adding Utility Classes

When adding utility classes:

1. **Make classes Serializable** (required for Jenkins)
2. **Use static methods** when possible
3. **Add proper package structure**
4. **Write comprehensive tests**
5. **Document public APIs**

Example:

```groovy
package org.jenkins.library

class MyUtility implements Serializable {
    private static final long serialVersionUID = 1L
    
    /**
     * Method description
     * @param input Input parameter
     * @return Result description
     */
    static String processInput(String input) {
        // Implementation
    }
}
```

### Testing Requirements

- All new code must have tests
- Maintain or improve test coverage
- Tests should be fast and isolated
- Use descriptive test method names

### Commit Messages

Follow conventional commit format:

- `Add: description` - New features
- `Fix: description` - Bug fixes
- `Update: description` - Updates to existing features
- `Refactor: description` - Code refactoring
- `Docs: description` - Documentation changes
- `Test: description` - Test additions/changes

Examples:
```
Add: new deployment step with rollback support
Fix: handle null values in exampleStep
Update: improve error messages in utility class
Refactor: extract common logic to utility method
Docs: add usage examples for new step
Test: add integration tests for deployment step
```

## Pull Request Process

1. **Ensure all tests pass**: `./gradlew test`
2. **Check code quality**: `./gradlew codenarcMain codenarcTest`
3. **Update documentation** if needed
4. **Add/update tests** for new features
5. **Keep PRs focused** - one feature/fix per PR
6. **Write clear PR description** explaining:
   - What changes were made
   - Why they were made
   - How to test the changes

## Code Review

- All PRs require at least one approval
- Address review comments promptly
- Be open to feedback and suggestions
- Keep discussions constructive and respectful

## Questions?

If you have questions or need help:

1. Check existing [GitHub Issues](https://github.com/Ichibytes/Jenkins-library-template/issues)
2. Create a new issue with the `question` label
3. Review the README.md for usage examples

Thank you for contributing! 🎉

