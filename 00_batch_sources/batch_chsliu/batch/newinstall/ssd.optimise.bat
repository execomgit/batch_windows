@echo off
REM =================================
if [%1]==[] %~dp0\..\utility\getadmin.bat "%~dp0\%~nx0"

REM =================================
echo === TRIM Enable check, DisableDeleteNotify = 0
fsutil behavior query DisableDeleteNotify

echo === Superfetch disable
sc config SysMain start= disabled
taskkill /F /FI "SERVICES eq SysMain"
taskkill /F /FI "SERVICES eq SysMain"
taskkill /F /FI "SERVICES eq SysMain"
rd /s/q c:\windows\prefetch

echo === Defragment disable
dfrgui

echo === Windows Search disable
sc config WSearch start= disabled
taskkill /F /FI "SERVICES eq WSearch"
taskkill /F /FI "SERVICES eq WSearch"
taskkill /F /FI "SERVICES eq WSearch"

echo === Heartbeat disable
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability]
echo "TimeStampInterval"=dword:00000000
regedit

echo === ���� Windows 7 ���Ȥ�g���i�p�e
echo �t�κ޲z�d�� - �t�� - ���ں����q�T�޲z - ���ں����q�T�]�w
echo "���� Windows �Ȥ�g���i�p��" ���Ŀ� "�ҥ�"
gpedit.msc

echo === ���� CEIP �۰ʱƵ{
echo �u�@�Ƶ{���{���w - Microsoft - Windows - Customer Experience Improvement Program
echo Consolidator	diable
echo KernelCeipTask	diable
echo UsbCeip		diable
taskschd.msc

echo === ���� RAC �۰ʱƵ{�C�p�ɤ@��
echo �u�@�Ƶ{���{���w - Microsoft - Windows - RAC
echo RacTask 		diable
taskschd.msc

echo === ���� ReadyBoot tracing
echo ��Ʒj�������X�u�� -- �Ұʨƥ�l�ܤu�㶥�q
echo ReadyBoot		diable
echo for HD optimise, defrag.exe c: -b 
perfmon
del c:\windows\prefetch\readyboot\readyboot.etl

REM echo === IPv6 disable
REM echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters]
REM echo "DisabledComponents"=dword:ffffffff
rem regedit

REM echo === IP-Helper disable
REM echo disable TCP/IPv4 in network property
REM sc config iphlpsvc start= disabled
REM taskkill /F /FI "SERVICES eq iphlpsvc"
REM taskkill /F /FI "SERVICES eq iphlpsvc"
REM taskkill /F /FI "SERVICES eq iphlpsvc"

echo === DisablePagingExecutive
echo for PC with 4GB RAM or more
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
echo "DisablePagingExecutive"=dword:00000001
regedit

echo === hiberfil.sys disable
echo for PC, not Notebook: 
echo run: powercfg -h off

echo === AHCI Enable check

echo === 4K alignment check

echo === pagefile.sys

echo === temp dir

echo === userprofile

pause
