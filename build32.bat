@set root=%~dp0
@echo %root%

@set target_all=ALL_BUILD
@set target_install=INSTALL

@mkdir %root%\build
@mkdir %root%\install
@mkdir %root%\install\bin
@mkdir %root%\install\lib
@mkdir %root%\install\include

@mkdir %root%\build\zlib
@cmake -S %root%\remote\zlib -B %root%\build\zlib --install-prefix %root%\install -G "Visual Studio 16 2019" -A Win32
@cmake --build %root%\build\zlib --target %target_all%     --config Release
@cmake --build %root%\build\zlib --target %target_install% --config Release

@mkdir %root%\build\libzip
@cmake -S %root%\remote\libzip -B %root%\build\libzip --install-prefix %root%\install -G "Visual Studio 16 2019" -A Win32 -D BUILD_SHARED_LIBS:BOOL=TRUE -D ZLIB_ROOT:PATH=%root%\install
@cmake --build %root%\build\libzip --target %target_all%     --config Release
@cmake --build %root%\build\libzip --target %target_install% --config Release

@mkdir %root%\build\ogg
@cmake -S %root%\remote\ogg -B %root%\build\ogg --install-prefix %root%\install -G "Visual Studio 16 2019" -A Win32 -D BUILD_SHARED_LIBS:BOOL=TRUE
@cmake --build %root%\build\ogg --target %target_all%     --config Release
@cmake --build %root%\build\ogg --target %target_install% --config Release

@mkdir %root%\build\vorbis
@cmake -S %root%\remote\vorbis -B %root%\build\vorbis --install-prefix %root%\install -G "Visual Studio 16 2019" -A Win32 -D BUILD_SHARED_LIBS:BOOL=TRUE -D OGG_ROOT:PATH=%root%\install
@cmake --build %root%\build\vorbis --target %target_all%     --config Release
@cmake --build %root%\build\vorbis --target %target_install% --config Release

@mkdir %root%\build\freetype
@cmake -S %root%\remote\freetype -B %root%\build\freetype --install-prefix %root%\install -G "Visual Studio 16 2019" -A Win32 -D BUILD_SHARED_LIBS:BOOL=TRUE
@cmake --build %root%\build\freetype --target %target_all%     --config Release
@cmake --build %root%\build\freetype --target %target_install% --config Release

@mkdir %root%\build\luajit
@cmake -S %root%\cmake\luajit -B %root%\build\luajit --install-prefix %root%\install -G "Visual Studio 16 2019" -A Win32
@cmake --build %root%\build\luajit --target %target_all%     --config Release
@cmake --build %root%\build\luajit --target %target_install% --config Release

@setlocal
::    @cd %root%\remote\luajit\src
::    
::    @call .\msvcbuild.bat
::    
::    @cd %root%
::    
::    @copy /Y %root%\remote\luajit\src\luajit.exe %root%\install\bin\luajit.exe
::    @copy /Y %root%\remote\luajit\src\lua51.dll  %root%\install\bin\lua51.dll
::    @copy /Y %root%\remote\luajit\src\lua51.lib  %root%\install\lib\lua51.lib
::    
::    @copy /Y %root%\remote\luajit\src\lua.h     %root%\install\include\lua.h    
::    @copy /Y %root%\remote\luajit\src\lualib.h  %root%\install\include\lualib.h 
::    @copy /Y %root%\remote\luajit\src\lauxlib.h %root%\install\include\lauxlib.h
::    @copy /Y %root%\remote\luajit\src\luaconf.h %root%\install\include\luaconf.h
::    @copy /Y %root%\remote\luajit\src\lua.hpp   %root%\install\include\lua.hpp  
::    @copy /Y %root%\remote\luajit\src\luajit.h  %root%\install\include\luajit.h 
@endlocal
