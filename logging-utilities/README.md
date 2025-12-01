# Logging Utilities

Author: Wk19-hub

Log analysis and search utilities for Windows system administration and troubleshooting.

## 📁 Contents

This folder contains scripts for:

- **SCEP Log Analysis**: Certificate enrollment troubleshooting
- **Intune Log Search**: Device management log parsing
- **Error Detection**: Automated error and failure detection
- **Log Filtering**: Pattern matching and keyword searches

## 🚀 Usage

### Find SCEP Errors
```powershell
# Search for SCEP-related errors in log files
.\Find-SCEP-Errors.ps1
```

### Search Intune Logs
```powershell
# Comprehensive Intune and SCEP log analysis
.\Search-Intune-SCEP-Logs.ps1
```

## ⚠️ Prerequisites

- PowerShell 5.1 or later
- Access to log directories
- Appropriate file permissions
- Administrative privileges (for system logs)

## 📋 Script Categories

### Certificate & SCEP Analysis
- **Find-SCEP-Errors.ps1**: Basic SCEP error detection
- **Search-Intune-SCEP-Logs.ps1**: Advanced SCEP and certificate analysis
- Keywords: SCEP, mscep, NDES, certificate, enrollment

### Log Search & Filtering
- Recursive file searching
- Pattern matching and regex support
- Output formatting and reporting
- Error categorization

## 🔧 Configuration

### Default Search Locations
```powershell
# Modify these paths in scripts as needed
$LogFolder = "C:\Logs"                    # General logs
$IntuneLogDir = "C:\ProgramData\Microsoft\IntuneManagementExtension\Logs"
```

### Search Keywords
```powershell
# Common search patterns
$Keywords = @(
    "SCEP", "mscep", "NDES",           # Certificate enrollment
    "error", "fail", "exception",      # Error detection  
    "HTTP", "0x87D", "certificate"      # Network and cert issues
)
```

## 📊 Output Formats

### Console Output
- Color-coded results
- Line numbers and context
- File path identification
- Match highlighting

### File Output
- Timestamped reports
- Structured logging
- Search summaries
- Export to text files

## 🔍 Search Capabilities

### File Types Supported
- **Log files**: *.log
- **Text files**: *.txt
- **Event exports**: *.evt, *.evtx
- **Configuration**: *.ini, *.cfg

### Search Features
- Recursive directory scanning
- Multiple keyword support
- Case-insensitive matching
- Line length filtering
- Pattern exclusion

## 📈 Analysis Features

### SCEP Troubleshooting
- Certificate enrollment failures
- NDES connectivity issues
- CA communication problems
- Authentication failures

### Intune Integration
- Policy deployment tracking
- Device enrollment issues
- Compliance evaluation
- Management extension logs

### Network Analysis
- IP address pattern detection
- Connection failure identification
- Timeout and error tracking
- SSL/TLS issues

## 🚨 Common Log Patterns

### SCEP Errors
```
0x87D1FDE8 - SCEP enrollment failed
TransactionException - SCEP transaction error
mscep.dll - SCEP library issues
NDES - Network Device Enrollment Service
```

### Intune Issues
```
DeviceManagement - Policy application
MDM - Mobile Device Management
PolicyPlatform - Windows policy engine
IME - Intune Management Extension
```

### Network Problems
```
timeout - Connection timeouts
SocketException - Network socket errors
SSL handshake - Certificate issues
connection refused - Service unavailable
```

## 🔧 Customization

### Adding Keywords
```powershell
# Extend search patterns
$CustomKeywords = @("custom1", "custom2", "pattern")
$Keywords += $CustomKeywords
```

### Output Formatting
```powershell
# Customize output colors and format
Write-Host $message -ForegroundColor Cyan
Add-Content -Path $OutputFile -Value $logEntry
```

### Filter Configuration
```powershell
# Adjust line length and content filters
$MaxLineLength = 500
$ExcludePatterns = @("debug", "verbose")
```

## 📝 Notes

- **Large files**: Scripts handle large log files efficiently
- **Performance**: Use specific keywords to improve search speed
- **Permissions**: Ensure access to target log directories
- **Retention**: Configure log rotation and archival
- **Monitoring**: Regular log analysis prevents issues