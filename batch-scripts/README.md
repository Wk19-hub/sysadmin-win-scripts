# Batch Scripts

Author: Wk19-hub

Collection of Windows batch (.bat/.cmd) scripts for command-line automation and system tasks.

## 📁 Contents

This folder contains batch scripts for:

- **Command Line Utilities**: System commands, file operations
- **Android Development**: ADB logcat filtering
- **Network Operations**: Connectivity testing, diagnostics
- **System Automation**: Service management, cleanup tasks

## 🚀 Usage

Run batch scripts from Command Prompt or PowerShell:

```cmd
script-name.bat
```

For elevated operations:
```cmd
# Run as Administrator
script-name.bat
```

## ⚠️ Prerequisites

- Windows Command Prompt or PowerShell
- Administrative privileges (for system operations)
- Specific tools may be required (e.g., ADB for Android scripts)

## 📋 Script Categories

### Development Tools
- Android Debug Bridge (ADB) utilities
- Log filtering and analysis
- Development environment setup

### System Operations
- File and folder management
- Service control and monitoring
- System information gathering

### Network Utilities
- Connectivity testing
- Network diagnostics
- Remote operations

## 🔧 Common Commands

```cmd
# Check if script exists before running
if exist "script.bat" call "script.bat"

# Run with parameters
script.bat parameter1 parameter2

# Capture output to file
script.bat > output.log 2>&1
```

## 📝 Notes

- All scripts are anonymized and sanitized
- Test scripts in safe environment first
- Some scripts may pause for user input
- Review script content before execution
- Ensure required tools are installed and in PATH