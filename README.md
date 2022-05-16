# WindowsInfrastructureExample
An infrastructure example in Windows for CI

## Usage

### Git for Windows
- Open PowerShell in this repository root as *Administrator*
- Download and Place `Git-2.x.x-64-bit.exe`
  - e.g. `>Invoke-WebRequest https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-64-bit.exe -OutFile Git-2.36.1-64-bit.exe`
- Run `>Set-ExecutionPolicy RemoteSigned -Scope Process`
- Run `>.\install-git.ps1`

#### Add to PATH
**!WARNING! This command will change `PATH` in the System Variable**

- Run `>.\set-git-path.ps1`

### PowerShell 7
- Open PowerShell in this repository root as *Administrator*
- Download and Place `PowerShell-7.x.x-win-x64.msi`
  - e.g. `>Invoke-WebRequest https://github.com/PowerShell/PowerShell/releases/download/v7.2.3/PowerShell-7.2.3-win-x64.msi -OutFile PowerShell-7.2.3-win-x64.msi`
- Run `>Set-ExecutionPolicy RemoteSigned -Scope Process`
- Run `>.\install-powershell.ps1`

#### Add to PATH
**!WARNING! This command will change `PATH` in the System Variable**

- Run `>.\set-powershell-path.ps1`

## License
See [LICENSE](./LICENSE)
