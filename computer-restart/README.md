# Computer Restart Script

Batch script to remotely restart multiple computers from a list.

## Description

This script reads computer names from a text file and sends a forced restart command to each one using the Windows `shutdown` command.

## Usage

1. Create a `restart.txt` file with one computer name per line
2. Run the script:
   ```batch
   restart_script.bat
   ```

## Files

- `restart_script.bat` - Main restart script
- `restart.txt` - List of target computer names (create this)

## Requirements

- Windows OS
- Administrative privileges on target computers
- Network connectivity to target machines

## Author

Wk19-hub

## License

MIT
