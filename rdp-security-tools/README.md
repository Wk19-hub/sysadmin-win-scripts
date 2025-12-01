# RDP Security Tools

Author: Wk19-hub

Remote Desktop Protocol (RDP) security hardening and troubleshooting tools.

## 📁 Contents

This folder contains scripts for:

- **Token Management**: Clear authentication tokens and cache
- **RDP Hardening**: Apply security mitigations and settings
- **Session Monitoring**: Track RDP connections and events
- **Security Cleanup**: Remove stored credentials and cache

## 🚀 Usage

### Clear Tokens and Fix RDP Issues
```powershell
# Run as Administrator - comprehensive RDP cleanup
.\Clear-Tokens-And-Fix-RDP.ps1
```

### Monitor RDP Sessions
```powershell
# View recent RDP session events
.\Get-RDP-Session-Events.ps1
```

## ⚠️ Prerequisites

- **Administrative privileges required**
- Windows 10/11 or Windows Server
- PowerShell 5.1 or later
- RDP enabled on target systems

## 📋 Script Categories

### Security Hardening
- **Clear-Tokens-And-Fix-RDP.ps1**: Comprehensive RDP security cleanup
  - Clear TokenBroker and WebAccountManager cache
  - Remove stored Windows credentials
  - Purge Kerberos tickets
  - Apply RDP registry mitigations
  - Disable TCP offloads
  - Restart Terminal Services

### Monitoring & Diagnostics
- **Get-RDP-Session-Events.ps1**: Monitor RDP session activity
  - Session connect/disconnect events
  - Connection failure analysis
  - User session tracking

## 🔧 Security Mitigations Applied

### Registry Settings
```
HKLM\SYSTEM\CurrentControlSet\Control\Lsa
- DisableRestrictedAdmin = 1

HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client
- fClientDisableUDP = 1

HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
- UseWDDMGraphicsDisplayDriver = 0

HKLM\SOFTWARE\Microsoft\Terminal Server Client
- DisableHardwareBitmapCache = 1
```

### Network Optimizations
```cmd
netsh int tcp set global chimney=disabled
netsh int tcp set global autotuninglevel=disabled  
netsh int tcp set global rss=disabled
```

## 🚨 Security Features

### Cache Cleanup
- TokenBroker cache removal
- WebAccountManager cache cleanup
- Stored credential removal (interactive)
- Kerberos ticket purging

### RDP Hardening
- Disable UDP for RDP connections
- Hardware bitmap cache disabled
- Graphics driver optimizations
- TCP offload mitigations

### Service Management
- Terminal Services restart
- Clean service state
- Configuration validation

## 📊 Event Monitoring

### RDP Event IDs
- **24**: Session disconnected
- **25**: Session reconnection succeeded
- **39**: Session disconnected with reason
- **40**: Session disconnected with reason

### Log Locations
- Event Viewer: Microsoft-Windows-TerminalServices-LocalSessionManager/Operational
- Security Log: Logon/Logoff events
- System Log: Service events

## 🔄 Rollback Procedures

Each security script creates rollback instructions:

1. **Registry Backups**: Auto-exported before changes
2. **Rollback Script**: Generated with undo commands
3. **Service Recovery**: Manual restart procedures

### Manual Rollback
```cmd
# Re-enable TCP autotuning
netsh int tcp set global autotuninglevel=normal

# Import registry backups
reg import backup_file.reg
```

## 📝 Notes

- **Backup before running**: Scripts create automatic backups
- **Reboot recommended**: After applying security changes
- **Test thoroughly**: In non-production environment first
- **Monitor impact**: Check RDP performance after changes
- **Keep backups**: Store registry exports safely