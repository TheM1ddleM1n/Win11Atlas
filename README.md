# Win11Atlas

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)]()
[![License](https://img.shields.io/badge/license-MIT-green.svg)]()
[![Stars](https://img.shields.io/github/stars/TheM1ddleM1n/Win11Atlas.svg)]()
[![Issues](https://img.shields.io/github/issues/TheM1ddleM1n/Win11Atlas.svg)]()
[![Last Commit](https://img.shields.io/github/last-commit/TheM1ddleM1n/Win11Atlas.svg)]()

Win11Atlas is a comprehensive reference for Windows 11 command‑line tools, covering both Command Prompt and PowerShell. It provides clear explanations, syntax details, and practical examples to support developers, administrators, and technical users who rely on the Windows command‑line environment.

## Why This Project Exists

Windows command documentation is scattered across multiple sources, often inconsistent, outdated, or incomplete. Win11Atlas was created to provide a single, reliable, and well‑structured reference that focuses on clarity, accuracy, and practical usage. The goal is to make command‑line knowledge easier to access and apply, whether you are learning the basics or working in a professional environment.

## Purpose

The project consolidates essential command‑line information into a dependable resource. It emphasises accuracy, consistency, and real‑world relevance, helping users understand not just how commands work, but when and why they should be used.

## Scope

Win11Atlas focuses on:

- Command Prompt commands and their parameters  
- PowerShell cmdlets and usage patterns  
- Practical examples demonstrating real‑world scenarios  
- Behaviour notes, limitations, and common pitfalls  
- Cross‑references between CMD and PowerShell equivalents  
- Contextual explanations for when commands are appropriate  

The project does not include proprietary Windows binaries or any content that cannot be legally redistributed.

## Audience

This reference is intended for:

- Developers working with Windows‑based tooling  
- System administrators managing Windows environments  
- Users/Students learning command‑line fundamentals  
- Power users exploring Windows internals  
- Anyone who needs dependable command‑line documentation  

## Installation and Usage Notes

Win11Atlas does not require installation. It is a project that can be used directly from this repo.

To use the reference:

1. Browse the repository sections for CMD or PowerShell content.  
2. Open any command entry to view syntax, examples, and notes.  
3. Use the examples as a guide when working in Command Prompt or PowerShell.

## How to Read Command Syntax

Windows command syntax often uses symbols that indicate how parameters behave. Understanding these conventions helps you read documentation more effectively.

- **`command`** — the base command  
- **`<value>`** — a required value  
- **`[value]`** — an optional value  
- **`value1 | value2`** — choose one of the listed options  
- **`...`** — the parameter can repeat  
- **`/flag`** — a switch that enables a feature  
- **`-Parameter`** — PowerShell parameter name  
- **`-Parameter Value`** — PowerShell parameter with argument  

Example:

`robocopy <source> <destination> [options]`

This means `source` and `destination` are required, while `options` are optional.

## Common Windows CLI Mistakes

Even experienced users run into common issues. Here are some frequent pitfalls:

- **Running commands without elevated permissions**  
  Many administrative commands require an elevated Command Prompt or PowerShell session.

- **Incorrect path quoting**  
  Paths with spaces must be wrapped in quotes, e.g. `"C:\Program Files"`.

- **Mixing CMD and PowerShell syntax**  
  Some commands behave differently or use different parameter formats.

- **Assuming commands work identically across versions**  
  Windows 10 and Windows 11 sometimes differ in behaviour or available parameters.

- **Using outdated commands**  
  Some legacy commands still work but are deprecated in favour of PowerShell equivalents.

## Documentation Approach

Each command entry aims to provide:

- A clear description of the command’s purpose  
- Syntax and parameter explanations  
- Behaviour notes and edge cases  
- Example usage demonstrating practical application  
- Related commands or cmdlets  
- Version‑specific considerations where relevant  

The emphasis is on clarity, accuracy, and practical value.

## FAQ

**Is this project only for Windows 11?**  
Yes. Many commands work on earlier versions, but the focus is Windows 11 behaviour.

**Can I contribute new commands?**  
Yes. Contributions are welcome as long as they follow the project’s style and accuracy standards.

**Will this project cover advanced PowerShell modules?**  
Only core Windows modules. Any third‑party modules are out of scope.

**Is this an official Microsoft project?**  
No. This is an independent documentation project maintained by TheM1ddleM1n

## Contribution Guide

Contributions are welcome and encouraged. To maintain consistency and quality across the project, please follow the guidelines below.

### Writing Style

- Use clear, direct language.  
- Keep explanations concise but technically accurate.  
- Avoid unnecessary jargon unless it is standard terminology.  
- Use consistent formatting for headings, code blocks, and examples.

### Content Requirements

Each new command entry should include:

- A short description of what the command does  
- Syntax with parameters explained  
- At least one practical example  
- Notes on behaviour, limitations, or common mistakes  
- Links or references to related commands when appropriate  

### Submitting Changes

- Fork the repository.  
- Create a new branch for your changes.  
- Ensure your additions follow the existing style and structure.  
- Submit a pull request with a clear explanation of your changes.  

### Review Process

All submissions are reviewed for:

- Technical accuracy  
- Clarity and readability  
- Consistency with existing documentation  
- Compliance with the project’s scope  

Feedback may be provided before merging.

## Code of Conduct

To maintain a respectful and productive environment, all contributors are expected to follow these guidelines:

- Treat others with respect and professionalism.  
- Provide constructive feedback and accept it in return.  
- Avoid discriminatory, offensive, or disruptive behaviour.  
- Keep discussions focused on improving the project.  
- Do not submit content that is intentionally misleading or harmful. 

Violations may result in removal of contributions or restriction from participating in the project.

## Licence

This project is licensed under the MIT Licence, allowing broad reuse and modification while requiring attribution.
