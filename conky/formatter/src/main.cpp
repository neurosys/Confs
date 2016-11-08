#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

bool highlight_weekend = true;
bool highlight_today   = true;
bool sunday_first = false;
std::string today = "0";

std::string weekend_color_start = "${color1}";
std::string weekend_color_end   = "${color3}";
std::string today_color_start   = "${color red}";
std::string today_color_end     = "${color}";

std::string months[] = {
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "Octomber",
    "November",
    "December"
};

std::string days_m = "Mo Tu We Th Fr Sa Su";
std::string days_s = "Su Mo Tu We Th Fr Sa";

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
HiglightMondayFirstWeek(std::vector<std::string> tokens, std::string today)
{
    for (std::size_t i = 0; i < tokens.size(); i++)
    {
        if ((today.size() == 1 && tokens[i][0] == ' ' && tokens[i][1] == today[0]) || 
            (today.size() == 2 && today == tokens[i]))
        {
            std::cout << today_color_start << tokens[i] << today_color_end << " " ;
        }
        else
        {
            if (i == 5 || i == 6)
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

bool CheckMonth(std::string *line)
{
    // Check to see if we got one of the months
    for (int i = 0 ; i < 12 ; i++)
    {
        int rez = line->find(months[i]);
        if (rez != -1)
        {
            return true;
        }
    }
    return false;
}

void ProcessInput()
{
    std::string line;
    void* rez = NULL;

    // Get the month antet
    rez = std::getline(std::cin, line);
    if (rez != 0)
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

    rez = std::getline(std::cin, line);
    if (rez != 0)
    {
        if (line == days_m || line == days_s)
        {
            if (line.find("Su", 0) == 0)
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

        if (sunday_first)
        {
            std::size_t i = 0;
            std::cout << weekend_color_start << tokens[i++] << weekend_color_end <<  " ";
            for (; i < tokens.size() - 1; i++)
            {
                std::cout << tokens[i] << " " ;
            }
            std::cout << weekend_color_start << tokens[i++] << weekend_color_end <<  " ";
            std::cout << std::endl;
        }
        else
        {
            HiglightMondayFirstWeek(tokens, today);
        }
    }

    while (std::getline(std::cin, line))
    {
        std::vector<std::string> tokens = SplitByColumns(line, 2, 1);
        HiglightMondayFirstWeek(tokens, today);
    }
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
