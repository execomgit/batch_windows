@echo off

set PCNAME=%1
set ADMPASS=%2
set FIRSTUSER=%3
set FIRSTUSERPASS=%4

if [%PCNAME%]==[] goto exit
if [%ADMPASS%]==[] goto exit
if [%FIRSTUSER%]==[] goto exit
if [%FIRSTUSERPASS%]==[] goto exit


echo ���C�K�X����
echo set PasswordComplexity = 0
echo export.sec.bat
call export.sec.bat
notepad sec.cfg
echo import.sec.bat
call import.sec.bat

echo �]�w�q���W��
echo computername.bat %PCNAME%
call computername.bat %PCNAME%

echo ���adm�K�X
echo passwd.bat administrator %ADMPASS%
call passwd.bat administrator %ADMPASS%

echo adm�K�X���L��
echo neverexpired.bat administrator
call neverexpired.bat administrator

echo �s�Wfirstuser
echo adduser.bat %FIRSTUSER% %FIRSTUSERPASS%
call adduser.bat %FIRSTUSER% %FIRSTUSERPASS%

echo firstuser�K�X���L��
echo neverexpired.bat %FIRSTUSER%
call neverexpired.bat %FIRSTUSER%

echo [�ĤG��]����firstuser�޲z�v��
echo addadmin.bat %FIRSTUSER%
call addadmin.bat %FIRSTUSER%

echo ���}powerscript�\��
echo enablepowershellscript.bat
call enablepowershellscript.bat

echo �w�˥��n�\��
echo installfeature.bat
call installfeature.bat

echo �ϥ�HVRemote script
echo server.bat %FIRSTUSER%
call server.bat %FIRSTUSER%

echo open port for rsync
echo openport.bat
call openport.bat

echo �}�һ��ݮୱ�޲z
echo rdpon.bat
call rdpon.bat

echo �}�һ��ݺ޲z
echo remoteon2.bat
call remoteon2.bat

goto :EOF

:exit
echo %0 PCNAME ADMPASS FIRSTUSER FIRSTUSERPASS
