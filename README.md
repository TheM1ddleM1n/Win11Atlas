# Win11Atlas

[![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)]()
[![License](https://img.shields.io/badge/license-MIT-green.svg)]()
[![Stars](https://img.shields.io/github/stars/TheM1ddleM1n/Win11Atlas.svg)]()
[![Issues](https://img.shields.io/github/issues/TheM1ddleM1n/Win11Atlas.svg)]()
[![Last Commit](https://img.shields.io/github/last-commit/TheM1ddleM1n/Win11Atlas.svg)]()

Win11Atlas is a comprehensive reference and script library for Windows 11 command-line tooling, covering both Command Prompt and PowerShell.

---

## Why This Project Exists

Windows command documentation is fragmented across multiple sources — often inconsistent, outdated, or incomplete. Win11Atlas consolidates essential command-line knowledge into a single, well-structured reference that prioritises clarity, accuracy, and real-world relevance. Whether you are learning the basics or working in a professional environment, this project is designed to be immediately useful.

---

## Scope

Win11Atlas covers:

- Command Prompt commands and their parameters
- PowerShell cmdlets and usage patterns
- Practical scripts for real-world scenarios
- Behaviour notes, limitations, and common pitfalls
- Cross-references between CMD and PowerShell equivalents
- Version-specific considerations where relevant

The project does not include proprietary Windows binaries or content that cannot be legally redistributed.

---

## Audience

This reference is intended for:

- Developers working with Windows-based tooling
- System administrators managing Windows environments
- Students learning command-line fundamentals
- Power users exploring Windows internals
- Anyone who needs dependable command-line documentation

---

## Usage

Win11Atlas requires no installation. Clone or download the repository and run scripts directly from Command Prompt or PowerShell. PowerShell scripts may require an elevated session depending on the operation being performed.

To run a PowerShell script:

```powershell
.\Scripts\POWERSHELL\Dashboard.ps1
```

To run a CMD script:

```cmd
Scripts\CMD\Networking\network-tools.cmd
```

If script execution is blocked, you may need to adjust your execution policy:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

---

## How to Read Command Syntax

Understanding syntax conventions makes documentation easier to follow.

| Symbol | Meaning |
|---|---|
| `command` | The base command |
| `<value>` | A required value |
| `[value]` | An optional value |
| `value1 \| value2` | Choose one of the listed options |
| `...` | The parameter can repeat |
| `/flag` | A switch that enables a feature |
| `-Parameter` | A PowerShell parameter name |
| `-Parameter Value` | A PowerShell parameter with an argument |

Example: `robocopy <source> <destination> [options]` — source and destination are required; options are optional.

---

## Common Mistakes

- **Running without elevated permissions** — Many administrative commands require an elevated Command Prompt or PowerShell session. Right-click and select "Run as administrator" where needed.
- **Incorrect path quoting** — Paths containing spaces must be wrapped in double quotes, for example `"C:\Program Files"`.
- **Mixing CMD and PowerShell syntax** — Commands and parameters are not interchangeable between the two environments. Check which shell a command targets before running it.
- **Assuming cross-version compatibility** — Windows 10 and Windows 11 sometimes differ in available parameters and behaviour. This project focuses on Windows 11.
- **Using deprecated commands** — Some legacy commands still function but are deprecated in favour of PowerShell equivalents. Prefer the modern alternative where one exists.

---

## Documentation Approach

Each command entry provides:

- A clear description of its purpose
- Syntax with parameter explanations
- Behaviour notes and edge cases
- Practical usage examples
- Related commands or cmdlets
- Version-specific considerations where applicable

The emphasis throughout is on accuracy, consistency, and practical value.

---

## Q&A

**Q: I ran a script and got "Access is denied". What does that mean?**
A: The operation requires elevated privileges. Close your current session, right-click Command Prompt or PowerShell, select "Run as administrator", and run the script again.

**Q: PowerShell says my script cannot be loaded because running scripts is disabled. How do I fix this?**
A: Run the following command in an elevated PowerShell session to allow locally written scripts to execute:
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

**Q: A command works on my Windows 10 machine but not on Windows 11. Why?**
A: Some parameters and commands differ between versions. This project documents Windows 11 behaviour specifically. Check whether a newer equivalent exists, as certain legacy commands have been deprecated or altered.

**Q: What is the difference between CMD and PowerShell? Which should I use?**
A: CMD is the legacy Windows shell. It handles basic scripting and system tasks but has limited capabilities. PowerShell is the modern shell, built on .NET, with significantly more power, flexibility, and access to system APIs. For anything beyond simple tasks, PowerShell is the preferred choice on Windows 11.

**Q: Can I run PowerShell scripts from CMD?**
A: Yes. Use the following syntax:
```cmd
powershell -ExecutionPolicy Bypass -File "path\to\script.ps1"
```

**Q: Some scripts show no output or incomplete results. What could cause this?**
A: Most commonly this is an elevation issue. Some cmdlets silently skip inaccessible resources when not running as an administrator. Run the script in an elevated session and check whether `-ErrorAction SilentlyContinue` is suppressing errors you need to see.

**Q: Is it safe to run these scripts on a production machine?**
A: Read-only scripts such as those that query system info, list processes, or report disk usage are safe to run in any environment. Scripts that stop processes, modify the registry, disable scheduled tasks, or change system configuration should be reviewed carefully and tested in a non-production environment first.

**Q: Can I schedule these scripts to run automatically?**
A: Yes. Use Task Scheduler or the `Register-ScheduledTask` cmdlet in PowerShell to schedule any script. Ensure the task is configured to run with appropriate privileges if the script requires elevation.

**Q: How do I know which scripts require elevation?**
A: Any script that reads from the Security event log, modifies registry keys, manages scheduled tasks, stops system processes, or queries firewall and audit policy will require an elevated session. The script descriptions in this project note where elevation is needed.

**Q: A script references a cmdlet that does not exist on my machine. What should I do?**
A: Verify you are running Windows 11 and that your PowerShell version is up to date. Run `$PSVersionTable` to check your version. Some cmdlets require PowerShell 5.1 or later, which ships with Windows 11 by default.

---

## Code of Conduct

All contributors are expected to:

- Treat others with respect and professionalism
- Provide constructive feedback and accept it in return
- Keep discussions focused on improving the project
- Avoid submitting content that is intentionally misleading or harmful

Violations may result in removal of contributions or restriction from participating in the project.

---

## FAQ

**Is this project only for Windows 11?**
Primarily yes. Many commands work on earlier versions, but the documented behaviour targets Windows 11.

**Can I contribute new commands?**
Yes. Contributions are welcome as long as they follow the project's style and accuracy standards.

**Will this project cover advanced PowerShell modules?**
Only core Windows modules are in scope. Third-party modules are out of scope.

**Is this an official Microsoft project?**
No. This is an independent project maintained by TheM1ddleM1n

---

## Licence

This project is licensed under the [MIT Licence](LICENSE), permitting broad reuse and modification with attribution.
