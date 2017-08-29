#include <stdio.h>
#include <datawarp.h>

int main(int argc, char **argv)
{

    char *infile, *outfile;
    int stage_out;
    infile = argv[1];
    outfile = argv[2];

    stage_out = dw_stage_file_out(infile, outfile, DW_STAGE_IMMEDIATE);

    return 0;
}
