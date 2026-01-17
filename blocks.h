//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/   /*Command*/                                                               /*Update Interval*/  /*Update Signal*/
    {"  ",      "/home/thomas/software/dwmblocks/scripts/cpu.sh",                         5,                   0},

    {"GPU: ",     "/home/thomas/software/dwmblocks/scripts/igpu.sh",                       5,                   0},

    {" ",       "df -h / | awk 'NR==2 {printf \"%s/%s\", $3, $2}'",                       30,                  0},

    {"Mem: ",    "free -h | awk '/^Mem/ {printf \"%s/%s\", $3, $2}' | sed 's/i//g'",       30,                  0},

    {"",         "/home/thomas/software/dwmblocks/scripts/battery.sh",                     30,                  0},

    {" ",       "nmcli -t -f SIGNAL device wifi list | head -n1 | awk '{print $1\"%\"}'", 10,                  0},

    {"",         "/home/thomas/software/dwmblocks/scripts/weather.sh",                     60,                  0},

    {"",         "/home/thomas/software/dwmblocks/scripts/sunhours.sh",                    120,                 0},

	{" ",       "TZ='Europe/Lisbon' date '+%D (%a) %T'",                                  1,                   0},

	{"󰕶 ",       "/home/thomas/software/dwmblocks/scripts/weekday.sh ",                    600,                 0},

	{"",         "/home/thomas/software/dwmblocks/scripts/bitcoin.sh",                     120,                 0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 3;
