#include "Date.h"
#include <ctime>

int Date::LastDay()
{
	if (mMonth == 1 || mMonth == 3 || mMonth == 5 || mMonth == 7 || mMonth == 8 || mMonth == 10 || mMonth == 12)
		return 31;
	else if (mMonth == 4 || mMonth == 6 || mMonth == 9 || mMonth == 11)
		return 30;
	else {
		if (mYear % 4 == 0) {
			if (mYear % 100 == 0) {
				if (mYear % 400 == 0)
					return 29;
				return 28;
			}
			return 29;
		}
		return 28;
	}
}

bool Date::SetDate(const short year, const short month, const short day)
{
	if (year > 1900 && year < 3000) 	{ mYear = year; }
	else return false;

	if (month >0 && month < 13) { mMonth = month; }
	else  return false;

	if (day > 0 && day <= LastDay()) { mDay = day; }
	else  return false;

	return true;
}

int Date::ConvertToSeconds() const
{
	struct tm date = { 0 };
	date.tm_year = mYear - 1900;
	date.tm_mon = mMonth - 1;
	date.tm_mday = mDay;

	return mktime(&date);
}



bool Date::operator==(const Date& operand2) const
{
	if (mYear == operand2.mYear &&
		mMonth == operand2.mMonth &&
		mDay == operand2.mDay)
	{
		return true;
	}

	return false;
}


bool Date::operator!=(const Date& operand2) const
{
	return !(*this == operand2);
}


bool Date::operator>(const Date& operand2) const
{
	if (ConvertToSeconds() - operand2.ConvertToSeconds() > 0)
	{
		return true;
	}
	else
	{
		return false;
	}
}


bool Date::operator<(const Date& operand2) const
{
	if (ConvertToSeconds() - operand2.ConvertToSeconds() < 0)
	{
		return true;
	}
	else
	{
		return false;
	}
}


bool Date::operator>=(const Date& operand2) const
{
	return !(*this < operand2);
}


bool Date::operator<=(const Date& operand2) const
{
	return !(*this > operand2);
}

string Date::GetDate() const
{
	string year = to_string(mYear);

	string month = to_string(mMonth);
	if (mMonth < 10) month.insert(0, "0");

	string day = to_string(mDay);
	if (mDay < 10) day.insert(0, "0");

	return year + "." + month + "." + day;
}