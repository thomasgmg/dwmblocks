//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/  /*Command*/                                                               /*Update Interval*/  /*Update Signal*/
    {" ",    "/home/thomas/software/dwmblocks/scripts/cpu.sh",                         5,                   0},

    {"力 ",   "/home/thomas/software/dwmblocks/scripts/igpu.sh",                        5,                   0},

    {"Mem: ", "free -h | awk '/^Mem/ {printf \"%s/%s\", $3, $2}' | sed 's/i//g'",       30,                  0},

    {"󱊣 ",    "cat /sys/class/power_supply/BAT0/capacity | awk '{print $1\"%\"}'",      30,                  0},

    {" ",    "nmcli -t -f SIGNAL device wifi list | head -n1 | awk '{print $1\"%\"}'", 10,                  0},

    {"",      "/home/thomas/software/dwmblocks/scripts/weather.sh",                     60,                  0},

	{" ",    "TZ='Europe/Lisbon' date '+%D (%a) %T'",                                  1,                   0}
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
