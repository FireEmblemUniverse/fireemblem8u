#include "textencode.h"

static size_t inputFileSize;
static char *inputFileBuffer;
static int lineNum;

struct String *gInputStrings = NULL;
int gInputStringsCount = 0;


static void add_input_string(char *ident, char *string)
{
    int index = gInputStringsCount;
    int i;

    // check if ID already exists
    for (i = 0; i < index; i++)
        if (strcmp(ident, gInputStrings[i].id) == 0)
            FATAL_ERROR("line %i: string id %s already exists\n", lineNum, ident);

    gInputStringsCount++;
    gInputStrings = realloc(gInputStrings, gInputStringsCount * sizeof(*gInputStrings));
    
    gInputStrings[index].id = ident;
    gInputStrings[index].text = string;
}

// null terminates the current line and returns a pointer to the next line
static char *split_next_line(char *line)
{
    while (*line != '\n')
    {
        if (*line == 0)
        {
            if (line == inputFileBuffer + inputFileSize)
                return NULL;  // end of file
            else
                FATAL_ERROR("line %i: unexpected NUL character\n", lineNum);
        }
        line++;
    }
    *line = 0;
    return line + 1;
}

static char *skip_whitespace(char *str)
{
    while (isspace(*str))
        str++;
    return str;
}

static int is_identifier_char(int c)
{
    return (isalnum(c) || c == '_');
}

static int hex_digit(int c)
{
    if (c >= '0' && c <= '9')
        return c - '0';
    if (c >= 'a' && c <= 'f')
        return c - 'a' + 0xA;
    if (c >= 'A' && c <= 'F')
        return c - 'A' + 0xA;
    return -1;
}

static int is_hex_digit(int c)
{
    return (hex_digit(c) != -1);
}

static int read_hex_number(char **str_)
{
    char *str = *str_;
    int val = 0;
    int i = 0;

    while (i < 2)
    {
        int digit = hex_digit(*str);
        if (digit == -1)
            break;
        val = (val << 4) | digit;
        str++;
        i++;
    }
    *str_ = str;
    return val;
}

/*
static int read_hex_number(char **str_)
{
    char *str = *str_;
    int val = 0;

    while (1)
    {
        int digit = hex_digit(*str);
        if (digit == -1)
            break;
        val = (val << 4) | digit;
        str++;
    }
    *str_ = str;
    return val;
}
*/

static void eval_escape_sequences(char *str)
{
    const uint8_t escapeTable[] =
    {
        ['a'] = 0x07,
        ['b'] = 0x08,
        ['f'] = 0x0C,
        ['n'] = 0x0A,
        ['r'] = 0x0D,
        ['t'] = 0x09,
        ['v'] = 0x0B,
        ['\\'] = '\\',
        ['"'] = '"',
    };

    char *src = str;
    char *dest = str;

    while (*src != 0)
    {
        if (*src == '\\')
        {
            src++;

            unsigned int escval = *src;
            if (escval < ARRAY_COUNT(escapeTable) && escapeTable[escval] != 0)
            {
                *dest++ = escapeTable[escval];
                src++;
            }
            else
            {
                if (escval == 'x')
                {
                    src++;
                    if (!is_hex_digit(*src))
                        FATAL_ERROR("line %i: invalid hex number\n", lineNum);
                    int val = read_hex_number(&src);
                    if (val > 0xFF)
                        FATAL_ERROR("line %i: hex value 0x%X is too large for one byte\n", lineNum, val);
                    *dest++ = val;
                    //printf("debug: hex 0x%X\n", val);
                }
                else
                {
                    FATAL_ERROR("line %i: unknown escape sequence \\%c\n", lineNum, escval);
                }
            }
        }
        else
        {
            *dest++ = *src++;
        }
    }
    *dest = 0;
}

static void parse_line(char *line)
{
    char *identStart;
    char *identEnd;
    char *stringStart;
    char *stringEnd;
    int escaped;

    line = skip_whitespace(line);

    if (*line == '#')  // comment
        return;
    if (*line == 0)  // blank line
        return;

    // read identifier
    if (!is_identifier_char(*line))
        FATAL_ERROR("line %i: invalid identifier char '%c'\n", lineNum, *line);
    identStart = line;
    while (is_identifier_char(*line))
        line++;
    identEnd = line;

    line = skip_whitespace(line);

    // read string
    if (*line != '"')
        FATAL_ERROR("line %i: expected string literal following identifier\n", lineNum);
    line++;
    stringStart = line;
    escaped = 0;
    while (*line != '"' || escaped)
    {
        if (*line == 0)
            FATAL_ERROR("line %i: unterminated string literal\n", lineNum);
        if (escaped)
            escaped = 0;
        else if (*line == '\\')
            escaped = 1;
        line++;
    }
    stringEnd = line;

    line++;
    line = skip_whitespace(line);
    if (*line != 0)
        FATAL_ERROR("line %i: junk at end of line\n", lineNum);

    *stringEnd = 0;
    *identEnd = 0;

    eval_escape_sequences(stringStart);

    add_input_string(identStart, stringStart);
}

void read_input_file(const char *filename)
{
    FILE *file;
    char *line;
    char *next;

    // open file
    file = fopen(filename, "rb");
    if (file == NULL)
        FATAL_ERROR("could not open file '%s' for reading\n", filename);
    fseek(file, 0, SEEK_END);
    inputFileSize = ftell(file);
    inputFileBuffer = malloc(inputFileSize + 1);
    fseek(file, 0, SEEK_SET);
    if (fread(inputFileBuffer, inputFileSize, 1, file) != 1)
        FATAL_ERROR("error reading data from file '%s'\n", filename);
    inputFileBuffer[inputFileSize] = 0;
    fclose(file);

    // read contents
    line = inputFileBuffer;
    lineNum = 1;
    while (line != NULL)
    {
        next = split_next_line(line);

        parse_line(line);

        line = next;
        lineNum++;
    }
}
