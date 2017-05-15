#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *sayhello (char *buf,
                size_t buflen,
                const char *name);

char *sayhello (char *buf,
                size_t buflen,
                const char *name)
{
    snprintf (buf, buflen, "Hello %s!\n", name);
    return buf;
}

int main (int argc, char *argv[])
{
    char *buf = malloc (1024);
    printf ("%s", sayhello (buf, 1024, "world"));
}

/* -*- vim: set ts=4 sw=4 tw=78 ft=c: -*- */
