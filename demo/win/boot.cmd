:: π”√Cygwin
set "myvar="                                           
for /f "delims=" %%a in ('cygpath -p "%1" -a') do (                                       
  if not defined myvar set myvar=%%a                    
)
sh /home/script/WD_GetProductFile4ST_Win.sh %myvar% %*