/*
����������� ����������, ��������� �� ������ ����������� ����, � ���������� ��������� �����������������.
- ������������ �������� ����� ������� ���� �� ����� ������� �, �� �������� ������, ���� �� ��� �����, � � ������ ���������� ������ �� ���������� ����������� �������������� �������� �������, ������� �������� ���� ���������� �����
- ����������� ������ ������� ���������� 10�10, � ��� ������� �������� �������� ���������� ������� �������� ������������ ������ ������� ��������������� ��������������;
- ��� ������ ������ ������� ���� ��� ������������ �������� � ��������� ���� ������ ��������� ���������� � �������: ���������� �����, ������  � ������, � ����� ���������� ������������ ������������� ����. ������� ���� � ����� ������ ��������� ��������� ���������, �� ������������ �������� �������� � ���������� ���������� �������;
- ��� ������� ������ ����� ������� ���� ��� ������������ �������� �� ������ ��������� � �����. ���� � ����� ������ ��������� ��������� ���������, �� ������������ �������� �������� � ���������� ���������� �������.

*/
#include "CrackersDlg.h"

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInst, LPSTR lpszCmdLine, int nCmdShow)
{
	CrackersDlg dlg;
	return DialogBox(hInstance, MAKEINTRESOURCE(IDD_DIALOG1), NULL, CrackersDlg::DlgProc); 
}