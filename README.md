# System Administration Scripts (sysadmin-win-scripts)

A comprehensive collection of Windows system administration scripts organized by language and functionality. From automating routine tasks to enterprise device management, these scripts help streamline IT operations and troubleshooting.

**Author:** Wk19-hub  
**License:** MIT

## 🚀 Overview

This repository contains battle-tested scripts for Windows system administration, security hardening, and enterprise management. All scripts are anonymized, documented, and ready for production use.

## 📂 Repository Structure

### 🔧 By Language & Functionality

| Folder | Language | Description |
|--------|----------|-------------|
| **`powershell-scripts/`** | PowerShell | Advanced system management and automation |
| **`batch-scripts/`** | Batch/CMD | Command-line utilities and simple automation |
| **`compliance-policies/`** | JSON/PS1 | Intune compliance policies and detection scripts |
| **`intune-management/`** | PowerShell | Microsoft Intune device management tools |
| **`rdp-security-tools/`** | PowerShell | RDP security hardening and troubleshooting |
| **`logging-utilities/`** | PowerShell | Log analysis and search utilities |

### 🏢 By Functional Category

#### System Administration
- `ad-computer-creator/`: Active Directory computer object management
- `local-admin-renamer/`: Local administrator account management
- `computer-ping-categorizer/`: Network connectivity testing
- `system-cleanup/`: System maintenance and cleanup
- `computer-restart/`: Remote restart utilities
- `sleep-mode-manager/`: Power management configuration

#### Software Deployment  
- `adobe-installer/`: Adobe software deployment scripts
- `chrome-installer/`: Chrome browser installation
- `edge-installer/`: Microsoft Edge deployment
- `zscaler-installer/`: Zscaler security client deployment

#### Security & Compliance
- `bitlocker-manager/`: BitLocker encryption management
- `endpoint-security-installer/`: Endpoint security deployment
- `remote-access-enabler/`: Secure remote access configuration
- `file-permissions-checker/`: File and folder permission auditing

#### Monitoring & Diagnostics
- `application-checker/`: Installed software inventory
- `sccm-troubleshooter/`: SCCM client troubleshooting
- `host-manufacturer-getter/`: Hardware information gathering
- `ip-to-hostname-resolver/`: DNS resolution utilities

#### User Management
- `user-account-unlocker/`: User account management
- `user-deleter/`: User account cleanup
- `users-deleter/`: Bulk user operations

And many more specialized tools...

## 🚀 Usage

### PowerShell Scripts
```powershell
# Run as Administrator
PowerShell -ExecutionPolicy Bypass -File "script-name.ps1"
```

### Batch Scripts
```cmd
# Run from Command Prompt or PowerShell
script-name.bat
```

### Compliance Policies
```powershell
# Deploy to Intune as detection scripts
# Configure compliance rules and remediation
```

## 📋 Requirements

- **Operating System**: Windows 10/11, Windows Server 2016+
- **PowerShell**: Version 5.1 or PowerShell Core 6+
- **Permissions**: Administrative privileges for system-level operations
- **Network**: Internet connectivity for cloud-based scripts (Intune, etc.)
- **Dependencies**: Specific modules may be required (documented in each script)

## 🔒 Privacy & Anonymization

All scripts have been fully anonymized for public distribution:

- **👤 Personal Information**: All names and usernames removed
- **🏢 Company Data**: Organization names replaced with generic placeholders
- **🖥️ Hostnames**: Computer names changed to `COMPUTERX` patterns
- **🌐 Network**: IP addresses and domains anonymized
- **📁 Paths**: User-specific paths generalized
- **🆔 Identifiers**: UUIDs, GUIDs, and serial numbers removed

## 🎯 Enterprise Features

### Microsoft Intune Integration
- Compliance policy templates
- Device management automation
- Certificate enrollment troubleshooting
- Policy deployment scripts

### Active Directory Support
- Computer object management
- User account operations
- Group policy utilities
- Domain troubleshooting

### Security Hardening
- BitLocker management
- RDP security configuration
- Endpoint protection deployment
- Access control management

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/Wk19-hub/sysadmin-win-scripts.git
   ```

2. **Choose your scripts**
   - Browse folders by language or functionality
   - Read individual README files for detailed instructions

3. **Configure for your environment**
   - Update placeholders with your actual values
   - Test in non-production environment first

4. **Deploy and execute**
   - Run with appropriate privileges
   - Monitor execution and results

## ⚠️ Important Notes

- **Test First**: Always test scripts in a safe environment
- **Backup**: Create backups before making system changes
- **Permissions**: Many scripts require administrative privileges
- **Dependencies**: Install required modules and tools
- **Documentation**: Review script comments and README files

## 📄 License

MIT License - Feel free to use, modify, and distribute these scripts.

## 👨‍💻 Author

**Wk19-hub** - Windows System Administrator & Automation Specialist
