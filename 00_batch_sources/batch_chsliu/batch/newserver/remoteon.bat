netsh advfirewall set allprofiles settings remotemanagement enable

REM RDP
netsh advfirewall firewall set rule group=���ݮୱ new enable=yes
netsh advfirewall firewall set rule group="Remote Desktop" new enable=yes

REM Event Viewer
Netsh advfirewall firewall set rule group="Remote Event Log Management" new enable=yes

REM Services
netsh advfirewall firewall set rule group=���ݪA�Ⱥ޲z new enable=yes
netsh advfirewall firewall set rule group="Remote Services Management" new enable=yes

REM Shared Folders
Netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=yes

REM Task Scheduler
Netsh advfirewall firewall set rule group="Remote Scheduled Tasks Management" new enable=yes

REM Reliability and Performance
Netsh advfirewall firewall set rule group="Performance Logs and Alerts" new enable=yes

REM Disk Management
Netsh advfirewall firewall set rule group="���ݺϺаϺ޲z" new enable=yes
Netsh advfirewall firewall set rule group="Remote Volume Management" new enable=yes

REM Windows Firewall
Netsh advfirewall firewall set rule group="Windows Firewall Remote Management" new enable=yes


REM �ϥλ��ݮୱ�޲z Server Core ���A��
cscript %windir%\system32\scregedit.wsf /AR 0
REM �ª� Windows �W���滷�ݮୱ�A�ȥΤ��
cscript %windir%\system32\scregedit.wsf /CS 0 

REM �]�w���q���H�����Ӧۨ�L�q���� (WS-Management) WS-Management �n�D�C
winrm quickconfig -q


netsh firewall set service type=remoteadmin mode=enable
Netsh advfirewall firewall set rule group="Remote Administration" new enable=yes

netsh advfirewall firewall set rule group="Windows Remote Management" new enable=yes

netsh advfirewall firewall set rule group="Windows Management Instrumentation (WMI)" new enable=yes

