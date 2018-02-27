@echo off

pushd "%~dp0"
cd ..

for /f %%a in ('dir /b /ad "%cd%" ^| findstr /v /r "^\."') do (
  echo Building %%a
  pushd %%a
  if not exist dist\ mkdir dist\ >nul
  popd
  call sass --sourcemap=none --default-encoding UTF-8 %%a/src/themefile.scss:%%a/dist/themefile.css
)

popd
exit /b