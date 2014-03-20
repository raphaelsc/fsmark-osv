#ifdef __OSV__
extern long gettid();

extern "C" long __gettid()
{
	return gettid();
}
#else
#include <sys/syscall.h>

extern "C" int syscall(int);

extern "C" long __gettid()
{
	return syscall(SYS_gettid);
}
#endif
