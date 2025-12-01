# Intune Management Scripts

Author: Wk19-hub

Microsoft Intune device management and troubleshooting scripts for enterprise environments.

## 📁 Contents

This folder contains scripts for:

- **Policy Management**: Force policy refresh, clear cache
- **Troubleshooting**: Debug reports, log analysis
- **Certificate Management**: SCEP enrollment, Wi-Fi profiles
- **Agent Reset**: Intune Management Extension reset

## 🚀 Usage

### Force Policy Refresh
```powershell
# Clear cache and force policy download
.\Force-Intune-Policy-Refresh.ps1
```

### Generate Debug Reports
```powershell
# Comprehensive compliance debug report
.\Intune-Compliance-Debug-Report.ps1
```

### Reset Management Extension
```powershell
# Complete IME reset (use as last resort)
.\Reset-Intune-Management-Extension.ps1
```

## ⚠️ Prerequisites

- Microsoft Intune enrolled device
- Administrative privileges
- Intune Management Extension installed
- PowerShell 5.1 or later

## 📋 Script Categories

### Policy Management
- **Force-Intune-Policy-Refresh.ps1**: Clear policy cache and force refresh
- Cache cleanup and service restart
- Primary Refresh Token renewal

### Diagnostic Tools
- **Intune-Compliance-Debug-Report.ps1**: Generate detailed compliance report
- **Search-Intune-WiFi-SCEP-Logs.ps1**: Wi-Fi and certificate troubleshooting
- Log analysis and error detection

### Certificate Management
- SCEP enrollment troubleshooting
- Wi-Fi profile deployment issues
- Certificate authority connectivity

### Agent Management
- **Reset-Intune-Management-Extension.ps1**: Complete agent reset
- Service management and restart
- Registration status checking

## 🔧 Troubleshooting Workflow

### 1. Check Device Status
```powershell
dsregcmd /status
```

### 2. Force Policy Refresh
```powershell
.\Force-Intune-Policy-Refresh.ps1
```

### 3. Generate Debug Report
```powershell
.\Intune-Compliance-Debug-Report.ps1
```

### 4. Reset Agent (if needed)
```powershell
.\Reset-Intune-Management-Extension.ps1
```

## 📊 Log Locations

- **IME Logs**: `C:\ProgramData\Microsoft\IntuneManagementExtension\Logs`
- **Event Logs**: Windows Event Viewer → Applications and Services Logs
- **Debug Reports**: Generated on desktop

## 🔍 Common Issues

### Policy Not Applying
1. Check device registration
2. Force policy refresh
3. Review IME logs
4. Verify network connectivity

### Certificate Enrollment Failures
1. Check SCEP server connectivity
2. Validate certificate templates
3. Review CA configuration
4. Check device certificates

### Wi-Fi Profile Issues
1. Certificate chain validation
2. RADIUS server connectivity
3. Profile configuration review
4. Network authentication testing

## 📝 Notes

- Always run scripts as Administrator
- Test in non-production environment first
- Monitor script execution and results
- Keep debug reports for support cases
- Regular policy refresh prevents issues