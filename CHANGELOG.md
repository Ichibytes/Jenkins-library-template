# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.0] - 2026-01-12

### Added
- Automated setup script (`setup.sh`) for quick project initialization
- Setup script automatically customizes library name, removes examples, and cleans repository

### Changed
- Removed Java 11 support (now requires Java 17+)
- Updated CI workflow to test on Java 17 and 21 only
- Updated documentation to reflect Java 17+ requirement

### Fixed
- Fixed Dependabot auto-merge workflow to use `pull_request_target` for proper secret access
- Fixed "Input required and not supplied: token" error in Dependabot workflow
- Fixed "Semver bump '' is invalid!" error by using `dependabot/fetch-metadata` action

## [0.1.0] - 2026-01-12

### Added
- Initial Jenkins Shared Library template
- Standard library structure (`vars/`, `src/`, `resources/`)
- Example pipeline step (`exampleStep`)
- Example utility class (`ExampleUtility`)
- Unit testing with Jenkins Pipeline Unit
- Test coverage reporting with JaCoCo
- Code quality checks with CodeNarc
- Gradle build system with wrapper
- GitHub Actions CI/CD workflows
- Dependabot configuration
- Comprehensive documentation (README, CONTRIBUTING)
- Issue and PR templates
- EditorConfig for consistent formatting
- MIT License

[Unreleased]: https://github.com/Ichibytes/Jenkins-library-template/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/Ichibytes/Jenkins-library-template/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/Ichibytes/Jenkins-library-template/releases/tag/v0.1.0

