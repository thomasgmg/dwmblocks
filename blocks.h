// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.
static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {"📀 ",                "df -h / | awk 'NR==2 {printf \"%s/%s\", " "$3, $2}'",                    30,                   0},
    {"  ",                "free -h | awk '/^Mem/ {printf \"%s/%s\", " "$3, $2}' | sed 's/i//g'",    30,                   0},
    {"   ",               "~/software/suckless/dwmblocks/scripts/cpu.sh",                           5,                    0},
    {"   ",               "nmcli -t -f SIGNAL device wifi list | head -n1 | awk '{print $1\"%\"}'", 10,                   0},
    {"󰢝  ",                "cat /sys/class/power_supply/BAT0/capacity | awk '{print $1\"%\"}'",      30,                   0}, /* */
    {" \U0001F4C6 ",       "TZ='Europe/Lisbon' date '+%D (%a) %T'",                                  1,                    0},
    {"",                   "~/software/suckless/dwmblocks/scripts/weather.sh",                       5,                    0},
};

// sets delimiter between status commands. NULL character ('\0') means no delimiter.

// static char delim[] = "  ";
// static char delim[] = "  ";
// static char delim[] = "  ";
// static char delim[] = "  ";
// static char delim[] = "   ";
// static char delim[] = "   ";
// static char delim[] = "   ";
// static char delim[] = "   ";
// static char delim[] = "  ";
// static char delim[] = "   ";
// static char delim[] = "   ";
// static char delim[] = "   ";
// static char delim[] = "  ";
// static char delim[] = " 🎋  ";
// static char delim[] = " 🍃  ";
// static char delim[] = " 🌱  ";
// static char delim[] = " 🌿   ";
// static char delim[] = "  ";
static char delim[] = "   ";
static unsigned int delimLen = 6;
