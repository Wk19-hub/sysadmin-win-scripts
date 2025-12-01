# Compliance Policies

Author: Wk19-hub

Intune compliance policies and detection scripts for enterprise device management.

## 📁 Contents

This folder contains:

- **Detection Scripts**: PowerShell scripts for compliance checking
- **Policy Templates**: JSON policy definitions
- **Remediation Scripts**: Scripts to fix non-compliant states
- **BitLocker Compliance**: Drive encryption validation

## 🚀 Usage

### Detection Scripts
```powershell
# Run detection script
.\Check-Secondary-Drive-Encryption.ps1
```

### Policy Deployment
1. Import JSON policy templates into Intune
2. Assign detection scripts to device groups
3. Configure compliance rules and actions

## ⚠️ Prerequisites

- Microsoft Intune tenant
- Appropriate Intune licenses
- PowerShell execution policy configured
- Administrative rights on target devices

## 📋 Policy Categories

### Encryption Compliance
- BitLocker drive encryption validation
- Secondary drive encryption checking
- TPM and secure boot verification

### Security Baseline
- Windows security settings
- Firewall configuration
- Antivirus status checking

### System Configuration
- Registry key validation
- Service status checking
- Software installation verification

## 🔧 Implementation Guide

### 1. Detection Script Deployment
```powershell
# Upload to Intune as detection script
# Configure schedule (daily/hourly)
# Set compliance rules
```

### 2. Policy Configuration
```json
{
  "rules": [
    {
      "settingName": "policy_check",
      "operator": "IsEquals", 
      "dataType": "Boolean",
      "operand": "true"
    }
  ]
}
```

### 3. Compliance Actions
- Mark device non-compliant
- Send notification to user
- Block access to company resources
- Trigger remediation

## 📊 Monitoring

- Intune compliance dashboard
- Device compliance reports
- Non-compliance notifications
- Remediation success rates

## 📝 Notes

- Test policies in pilot groups first
- Monitor compliance impact on user productivity
- Regular policy review and updates required
- Ensure detection scripts handle edge cases
- Document remediation procedures