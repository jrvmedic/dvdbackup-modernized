#!/bin/bash

# this assumes you have dvdbackup-0.4.2 and want dvdbackup-0.5

sed -i 's/ifo_handle_t \* ifo_file/dvd_file_t \* ifo_file/g' src/dvdbackup.c
sed -i 's/ifo_handle_t\* ifo_file/dvd_file_t\* ifo_file/g' src/dvdbackup.c
sed -i 's/ifo_file->file/ifo_file/g' src/dvdbackup.c
sed -i 's/ifoOpenBUP(device_info->dvd, title_set)/DVDOpenFile(device_info->dvd, title_set, DVD_READ_VTS_BUP)/g' src/dvdbackup.c
sed -i 's/ifoOpen(device_info->dvd, title_set)/DVDOpenFile(device_info->dvd, title_set, DVD_READ_INFO_FILE)/g' src/dvdbackup.c
sed -i 's/ifoClose(ifo_file)/DVDCloseFile(ifo_file)/g' src/dvdbackup.c

# Update the package initialization metadata to indicate your modernized fork
sed -i 's/AC_INIT(\[dvdbackup\], \[0.4.2\],/AC_INIT([dvdbackup-modernized], [0.4.3-modernized],/g' configure.ac

# Swap out the strict developer build flags to allow compilation warnings
sed -i 's/AM_INIT_AUTOMAKE(\[-Wall -Werror\])/AM_INIT_AUTOMAKE([-Wall -Wno-error])/g' configure.ac
sed -i 's/AM_INIT_AUTOMAKE(\[1.11 -Wall -Werror\])/AM_INIT_AUTOMAKE([1.11 -Wall -Wno-error])/g' configure.ac
