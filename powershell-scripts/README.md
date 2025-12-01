# PowerShell Scripts

Author: Wk19-hub

Collection of PowerShell scripts for Windows system administration, security, and management tasks.

## 📁 Contents

This folder contains PowerShell (.ps1) scripts organized by functionality:

- **Security & Authentication**: Token management, credential cleanup
- **System Management**: Service control, registry modifications  
- **Logging & Diagnostics**: Event log analysis, troubleshooting
- **Network & Remote**: RDP configuration, network troubleshooting

## 🚀 Usage

Most scripts require administrative privileges:

```powershell
# Run as Administrator
PowerShell -ExecutionPolicy Bypass -File "script-name.ps1"
```

## ⚠️ Prerequisites

- Windows PowerShell 5.1 or PowerShell Core 6+
- Administrative privileges for system-level operations
- Appropriate modules (e.g., ActiveDirectory, BitLocker)

## 📋 Script Categories

### Security Scripts
- Token and credential management
- RDP security hardening
- Authentication troubleshooting

### System Administration
- Service management
- Registry operations
- System cleanup and maintenance

### Diagnostics & Logging
- Event log analysis
- Performance monitoring
- Error troubleshooting

## 🔧 Execution Policy

If you encounter execution policy restrictions:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 📝 Notes

- All scripts are anonymized and sanitized
- Test in non-production environment first
- Review script content before execution
- Some scripts may require additional modules or dependencies