'*******************************************'
'disable all network adapters, shutdown windows 1 min timer and show message to user'
'require high rights'
'author: Andrey Margulis'
'block.ps1'
'*******************************************'
'find network adapters & disable it'
 Get-NetAdapter | Disable-NetAdapter -Confirm:$false

'shutdown and show 1 min warning to user'
 cmd /c  Shutdown.exe /s /t 60 /c '��������� �����! ������ ������������. ��������� ����� �������� ����� 1 ������. ��������� ��� �������� ����� � ���������� � ������ ����������� ���������.'