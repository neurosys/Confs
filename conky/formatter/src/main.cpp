#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <ctype.h>

bool highlight_weekend = true;
bool highlight_today   = true;
bool sunday_first = false;
std::string today = "0";

std::string weekend_color_start = "${color1}";
std::string weekend_color_end   = "${color3}";
std::string today_color_start   = "${color red}";
std::string today_color_end     = "${color3}";

#define __RO__ 1

#ifdef __RO__
    std::string months[] = {
        "ianuarie",
        "februarie",
        "martie",
        "aprilie",
        "mai",
        "iunie",
        "iulie",
        "august",
        "septembrie",
        "octombrie",
        "noiembrie",
        "decembrie"
    };
    std::string days_m = "Lu Ma Mi Jo Vi Sb Du";
    std::string days_s = "Du Lu Ma Mi Jo Vi Sb";
    std::string sunday_name = "Du";
#else
    std::string months[] = {
        "january",
        "february",
        "march",
        "april",
        "may",
        "june",
        "july",
        "august",
        "september",
        "october",
        "november",
        "december"
    };
    std::string days_m = "Mo Tu We Th Fr Sa Su";
    std::string days_s = "Su Mo Tu We Th Fr Sa";
    std::string sunday_name = "Su";
#endif

static inline void rtrim(std::string &s) {
    s.erase(std::find_if(s.rbegin(), s.rend(), [](unsigned char ch) {
                return !std::isspace(ch);
                }).base(), s.end());
}


std::vector<std::string>
Split(std::string line, std::string separator, bool empty_tokens = false)
{
    std::vector<std::string> tokens;
    std::size_t start = 0;
    std::size_t end = 0;

    while ((end = line.find(separator, start)) != std::string::npos)
    {
        if (empty_tokens == true)
        {
                tokens.push_back(line.substr(start, end - start));
        }
        else
        {
            if (end != start)
            {
                tokens.push_back(line.substr(start, end - start));
            }
        }
        start = end + 1;
    }
    if (empty_tokens == true)
    {
        tokens.push_back(line.substr(start));
    }
    else 
    {
        if (end != start)
        {
            tokens.push_back(line.substr(start));
        }
    }
    return tokens;
}

std::vector<std::string>
SplitByColumns(std::string line, int col_size, int skip)
{
    std::vector<std::string> tokens;
    for (std::size_t i = 0; i < line.size(); i += col_size + skip)
    {
        tokens.push_back(line.substr(i, col_size));
    }
    return tokens;
}

void
HiglightWeek(std::vector<std::string> tokens, std::string today)
{
    std::size_t saturday = 5;
    std::size_t sunday   = 6;
    if (sunday_first)
    {
        sunday = 0;
        saturday = 6;
    }
    
    for (std::size_t i = 0; i < tokens.size(); i++)
    {
        if ((today.size() == 1 && tokens[i][0] == ' ' && tokens[i][1] == today[0]) || 
            (today.size() == 2 && today == tokens[i]))
        {
            std::cout << today_color_start << tokens[i] << today_color_end << " " ;
        }
        else
        {
            if (i == saturday || i == sunday)
            {
                std::cout << weekend_color_start << tokens[i] << weekend_color_end <<  " "; 
            }
            else
            {
                std::cout << tokens[i] << " " ;
            }
        }
    }
    std::cout << std::endl;
}

std::string toLower(std::string s) {
    std::transform(s.begin(), s.end(), s.begin(),
       [](unsigned char c){ return std::tolower(c); }
    );
    return s;
}

bool CheckMonth(std::string *line)
{
    std::string lowerCaseLine = toLower(*line);
    // Check to see if we got one of the months
    for (int i = 0 ; i < 12 ; i++)
    {
        int rez = lowerCaseLine.find(months[i]);
        if (rez != -1)
        {
            return true;
        }
    }
    return false;
}

bool IsLineComprisedOfEmptySpaces(std::string &line) {
    //std::cout << "Line 1 = '" << line << "'" << std::endl;
    int size = line.length();
    for (int i = 0; i < size; i++) {
        char x = line[i];
        //std::cout << "Line 2 idx = " << i << "x = '" << x << "'(" << (int)x << ") isspace = " << isspace(x) << std::endl;
        if (isspace(x) == 0) {
            //std::cout << "Line 3" << std::endl;
            return false;
        }
    }
    //std::cout << "Line 4 = '" << line << "'" << std::endl;
    return true;
}

void ProcessInput()
{
    std::string line;

    // Get the month antet
    std::getline(std::cin, line);
    if (std::cin)
    {
        if (CheckMonth(&line))
        {
            std::cout << line << std::endl;
        }
        else
        {
            std::cout << "No month found" << std::endl;
            return;
        }
    }
    else
    {
        std::cout << "Can't process input" << std::endl;
        return;
    }

    
    if (std::getline(std::cin, line))
    {
        rtrim(line);
        if (line == days_m || line == days_s)
        {
            if (line.find(sunday_name, 0) == 0)
            {
                sunday_first = true;
            }
        }
        else
        {
            std::cout << "No weekdays header found" << std::endl;
            return;
        }

        std::vector<std::string> tokens = SplitByColumns(line, 2, 1);
        HiglightWeek(tokens, today);
    }

    while (std::getline(std::cin, line))
    {
        if (IsLineComprisedOfEmptySpaces(line)) {
            continue;
        }
        std::vector<std::string> tokens = SplitByColumns(line, 2, 1);
        HiglightWeek(tokens, today);
    }
    std::cout << std::endl;
}

int main(int argc, char* argv[])
{
    for (int i = 0; i < argc; i++)
    {
        if ((std::string(argv[i]) == "--today" || std::string(argv[i]) == "-td" )
                && i + 1 < argc)
        {
            i++;
            today = std::string(argv[i]);
        }

        if ((std::string(argv[i]) == "--weekend-color" || std::string(argv[i]) == "-w" )
            && i + 1 < argc)
        {
            i++;
            weekend_color_start = std::string(argv[i]);
        }

        if ((std::string(argv[i]) == "--weekend-end" || std::string(argv[i]) == "-we" )
            && i + 1 < argc)
        {
            i++;
            weekend_color_end = std::string(argv[i]);
        }

        if ((std::string(argv[i]) == "--today-color" || std::string(argv[i]) == "-t" )
            && i + 1 < argc)
        {
            i++;
            today_color_start = std::string(argv[i]);
        }

        if ((std::string(argv[i]) == "--today-end" || std::string(argv[i]) == "-te" )
            && i + 1 < argc)
        {
            i++;
            today_color_end = std::string(argv[i]);
        }
    }
    ProcessInput();
    return 0;
}
