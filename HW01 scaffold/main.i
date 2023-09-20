# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1
# 42 "gba.h"
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short* videoBuffer;


void waitForVBlank();
void drawHorizontalLine(int, int, int, u16);
void drawVerticalLine(int, int, int, u16);
void drawRectangle(int, int, int, int, u16);
void fillScreen(u16);
void drawMushroom(int, int, u16, u16, u16);
void drawMouth(int, int, u16, u16, u16);
void delay(int);
# 82 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 3 "main.c" 2
# 1 "main.h" 1

void initialize();
void processInputs();
void updateGame();
void drawFrame1();
void drawFrame2();
void drawFrame3();
void drawFrame4();
void cleanupArea(int x, int y, int width, int height);

void cleanupFrame1();
void cleanupFrame2();
void cleanupFrame3();
void cleanupFrame4();


unsigned short oldButtons;
unsigned short buttons;

int pY, pX;


enum CustomGameState{
    FRAME_1,
    FRAME_2,
    FRAME_3,
    FRAME_4
};
# 4 "main.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/unistd.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 1 3







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 2 3


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 1 3
# 22 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 23 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3





typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef int register_t;
# 62 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 63 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3






typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;


typedef __builtin_va_list __va_list;
# 64 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 113 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __blkcnt_t blkcnt_t;




typedef __blksize_t blksize_t;




typedef unsigned long clock_t;





typedef __int_least64_t time_t;





typedef long daddr_t;



typedef char * caddr_t;




typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;




typedef __id_t id_t;




typedef __ino_t ino_t;
# 173 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __off_t off_t;



typedef __dev_t dev_t;



typedef __uid_t uid_t;



typedef __gid_t gid_t;




typedef __pid_t pid_t;




typedef __key_t key_t;




typedef _ssize_t ssize_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __clockid_t clockid_t;





typedef __timer_t timer_t;





typedef __useconds_t useconds_t;




typedef __suseconds_t suseconds_t;



typedef __int64_t sbintime_t;


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 1 3
# 240 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/types.h" 1 3
# 241 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 2 3

# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 2 3

extern char **environ;

void _exit (int __status) __attribute__ ((__noreturn__));

int access (const char *__path, int __amode);
unsigned alarm (unsigned __secs);
int chdir (const char *__path);
int chmod (const char *__path, mode_t __mode);

int chown (const char *__path, uid_t __owner, gid_t __group);




int close (int __fildes);
# 46 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 3
int dup (int __fildes);
int dup2 (int __fildes, int __fildes2);
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 3
int execl (const char *__path, const char *, ...);
int execle (const char *__path, const char *, ...);
int execlp (const char *__file, const char *, ...);



int execv (const char *__path, char * const __argv[]);
int execve (const char *__path, char * const __argv[], char * const __envp[]);
int execvp (const char *__file, char * const __argv[]);
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 3
pid_t fork (void);
long fpathconf (int __fd, int __name);
int fsync (int __fd);






char * getcwd (char *__buf, size_t __size);







gid_t getegid (void);
uid_t geteuid (void);
gid_t getgid (void);

int getgroups (int __gidsetsize, gid_t __grouplist[]);



char * getlogin (void);
# 132 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 3
pid_t getpgrp (void);
pid_t getpid (void);
pid_t getppid (void);




uid_t getuid (void);
# 150 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 3
int isatty (int __fildes);
# 159 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 3
int link (const char *__path1, const char *__path2);







off_t lseek (int __fildes, off_t __offset, int __whence);
# 176 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 3
long pathconf (const char *__path, int __name);
int pause (void);



int pipe (int __fildes[2]);







int read (int __fd, void *__buf, size_t __nbyte);




int rmdir (const char *__path);
# 206 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 3
int setgid (gid_t __gid);







int setpgid (pid_t __pid, pid_t __pgid);







pid_t setsid (void);

int setuid (uid_t __uid);




unsigned sleep (unsigned int __seconds);



long sysconf (int __name);
pid_t tcgetpgrp (int __fildes);
int tcsetpgrp (int __fildes, pid_t __pgrp_id);
char * ttyname (int __fildes);
int ttyname_r (int, char *, size_t);
int unlink (const char *__path);






int write (int __fd, const void *__buf, size_t __nbyte);






extern char *optarg;
extern int optind, opterr, optopt;
int getopt(int, char * const [], const char *);
extern int optreset;
# 291 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/unistd.h" 3
int getdtablesize (void);
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/unistd.h" 2 3
# 5 "main.c" 2


# 6 "main.c"
enum CustomGameState currentState = FRAME_1;
enum CustomGameState prevFrame = FRAME_4;

int isLooping = 0;
int frameIncrement = 1;

void initialize() {
    (*(volatile unsigned short *) 0x04000000) = ((3) & 7) | (1 << 10);
    mgba_open();
    mgba_printf("%s", "Debug logs initialized!");
    pX = 10;
    pY = 10;
    fillScreen(0x7FFF);
    drawFrame1();
}
void cleanupArea(int x, int y, int width, int height) {
    drawRectangle(x, y, width, height, 0x7FFF);
}

void processInputs() {
    if ((!(~(oldButtons) & ((1 << 3))) && (~(*(volatile unsigned short *)0x04000130) & ((1 << 3))))) {
        isLooping = !isLooping;
    }

    if ((!(~(oldButtons) & ((1 << 0))) && (~(*(volatile unsigned short *)0x04000130) & ((1 << 0)))) || isLooping) {
        currentState += frameIncrement;
        currentState %= 4;
    }
    else if ((!(~(oldButtons) & ((1 << 1))) && (~(*(volatile unsigned short *)0x04000130) & ((1 << 1))))) {
        currentState -= frameIncrement;
        currentState %= 4;
    }
    if ((!(~(oldButtons) & ((1 << 2))) && (~(*(volatile unsigned short *)0x04000130) & ((1 << 2)))) && frameIncrement == 1) {
        isLooping = 1;
        frameIncrement *= -1;

    }
    else if ((!(~(oldButtons) & ((1 << 2))) && (~(*(volatile unsigned short *)0x04000130) & ((1 << 2)))) && frameIncrement == -1) {
        isLooping = 1;
        frameIncrement *= -1;
    }
    if ((!(~(oldButtons) & ((1 << 5))) && (~(*(volatile unsigned short *)0x04000130) & ((1 << 5))))) {
        currentState = 0;
    }
    if ((!(~(oldButtons) & ((1 << 4))) && (~(*(volatile unsigned short *)0x04000130) & ((1 << 4))))) {
        currentState = 3;
    }
}

void updateGame() {
    enum CustomGameState originalState = currentState;
    processInputs();
    if (originalState == currentState) {
        return;
    }
    else if (isLooping) {
        delay(100);
    }

    switch(originalState) {
        case FRAME_1:
            cleanupFrame1();
            break;
        case FRAME_2:
            cleanupFrame2();
            break;
        case FRAME_3:
            cleanupFrame3();
            break;
        case FRAME_4:
            cleanupFrame4();
            break;
    }

    switch(currentState) {
        case FRAME_1:
            drawFrame1();
            break;
        case FRAME_2:
            drawFrame2();
            break;
        case FRAME_3:
            drawFrame3();
            break;
        case FRAME_4:
            drawFrame4();
            break;
    }



}
void cleanupFrame1() {
    cleanupArea(pX - 10, pY, 55, 55);
}
void cleanupFrame2() {
    cleanupArea(pX + 50, pY, 60, 60);
}
void cleanupFrame3() {
    cleanupArea(pX + 50, pY + 30, 55, 55);
}
void cleanupFrame4() {
    cleanupArea(pX - 10, pY + 33, 55, 55);
}


void drawFrame1() {
    drawMushroom(pX, pY, 0, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)), (((31) & 31) | (((18) & 31) << 5) | (((5) & 31) << 10)));
}
void drawFrame2() {
    drawMouth(pX + 60, pY, 0, (((19) & 31) | (((5) & 31) << 5) | (((22) & 31) << 10)), (((31) & 31) | (((18) & 31) << 5) | (((5) & 31) << 10)));
    drawRectangle(pX + 61, pY +21, 3, 10, 0);
    drawRectangle(pX + 59, pY + 25, 4, 2, 0);
    drawRectangle(pX + 67, pY + 21, 3, 10, 0);
    drawRectangle(pX + 68, pY + 25, 4, 2, 0);
}
void drawFrame3() {
    drawMushroom(pX + 60, pY + 30, 0, (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)), (((31) & 31) | (((18) & 31) << 5) | (((5) & 31) << 10)));
    drawRectangle(pX + 61, pY + 51, 3, 10, 0);
    drawRectangle(pX + 59, pY + 55, 4, 2, 0);
    drawRectangle(pX + 67, pY + 51, 3, 10, 0);
    drawRectangle(pX + 68, pY + 55, 4, 2, 0);

}
void drawFrame4() {
    drawMouth(pX, pY + 33, (((19) & 31) | (((5) & 31) << 5) | (((22) & 31) << 10)), (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)), (((31) & 31) | (((18) & 31) << 5) | (((5) & 31) << 10)));

}


int main() {
    initialize();
    while (1) {
        oldButtons = buttons;
  buttons = (*(volatile unsigned short *)0x04000130);

        updateGame();
        waitForVBlank();
    }
    return 0;
}
