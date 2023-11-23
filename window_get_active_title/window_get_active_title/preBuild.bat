@echo off
set dllPath=%~1
set solutionDir=%~2
set projectDir=%~3
set arch=%~4
set config=%~5

echo Running pre-build for %config%

where /q GmlCppExtFuncs
if %ERRORLEVEL% EQU 0 (
	echo Running GmlCppExtFuncs...
	GmlCppExtFuncs ^
	--prefix window_get_active_title^
	--cpp "%projectDir%autogen.cpp"^
	--gml "%solutionDir%window_get_active_title_23/extensions/window_get_active_title/autogen.gml"^
	%projectDir%window_get_active_title.cpp
)