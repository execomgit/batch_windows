REM RDP
netsh advfirewall firewall set rule group=���ݮୱ new enable=yes
netsh advfirewall firewall set rule group="Remote Desktop" new enable=yes


REM �ϥλ��ݮୱ�޲z Server Core ���A��
cscript %windir%\system32\scregedit.wsf /AR 0
REM �ª� Windows �W���滷�ݮୱ�A�ȥΤ��
cscript %windir%\system32\scregedit.wsf /CS 0 
