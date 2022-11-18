@echo off & setlocal EnableDelayedExpansion
for /R %%i in (*.*) do (
	set ext=%%~xi
	if "!ext!" NEQ ".bat" if "!ext!" NEQ ".tmp" (
		certutil -hashfile "%%i" MD5|find /v ":">md5.tmp
		set /p hash=<md5.tmp
		for %%j in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do call set hash=!hash:%%j=%%j!
		ren "%%i" "!hash!!ext!"
	)
)
del md5.tmp
pause
::放在某个目录运行即可，当前目录和子目录下所有文件自动md5重命名