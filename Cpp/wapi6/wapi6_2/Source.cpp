﻿/*
Написать игру, смысл которой состоит в следующем. На игровом поле имеются 16 кнопок, список, счётчик и индикатор. 
При запуске игры (кнопка «Новая игра») на кнопки помещаются 16 случайных чисел из диапазона 0-100. 
Задача состоит в том, чтобы за указанное время успеть (пока не заполнится весь индикатор) щелкнуть по всем кнопкам в порядке возрастания чисел. 
При нажатии на кнопку число должно добавляться в список только в том случае, если это число является следующим по возрастанию. 
Время продолжения игры (в секундах) устанавливается с помощью счетчика.
*/

#include "GameDlg.h"

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInst, LPSTR lpszCmdLine, int CmdShow)
{
	GameDlg dlg;
	return DialogBox(hInstance, MAKEINTRESOURCE(IDD_DIALOG1), NULL, GameDlg::DlgProc);
}