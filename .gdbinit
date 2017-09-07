
# set to 0 if you have problems with the colorized prompt - reported by Plouj with Ubuntu gdb 7.2
set $COLOREDPROMPT = 1
# color the first line of the disassembly - default is green, if you want to change it search for
# SETCOLOR1STLINE and modify it :-)
set $SETCOLOR1STLINE = 0
# set to 0 to remove display of objectivec messages (default is 1)
set $SHOWOBJECTIVEC = 1
# set to 0 to remove display of cpu registers (default is 1)
set $SHOWCPUREGISTERS = 1
# set to 1 to enable display of stack (default is 0)
set $SHOWSTACK = 0
# set to 1 to enable display of data window (default is 0)
set $SHOWDATAWIN = 0
# set to 0 to disable colored display of changed registers
set $SHOWREGCHANGES = 1
# color codes
set $BLACK = 0
set $RED = 1
set $GREEN = 2
set $YELLOW = 3
set $BLUE = 4
set $MAGENTA = 5
set $CYAN = 6
set $WHITE = 7
# CHANGME: If you want to modify the "theme" change the colors here
#          or just create a ~/.gdbinit.local and set these variables there
set $COLOR_REGNAME = $GREEN
set $COLOR_REGVAL = $BLACK
set $COLOR_REGVAL_MODIFIED  = $RED
set $COLOR_SEPARATOR = $BLUE
set $COLOR_CPUFLAGS = $RED
define color
 if $USECOLOR == 1
   # BLACK
     if $arg0 == 0
         echo \033[30m
           else
               # RED
                   if $arg0 == 1
                         echo \033[31m
                             else
                                   # GREEN
                                         if $arg0 == 2
                                                 echo \033[32m
                                                       else
                                                               # YELLOW
                                                                       if $arg0 == 3
                                                                                 echo \033[33m
                                                                                         else
                                                                                                   # BLUE
                                                                                                             if $arg0 == 4
                                                                                                                         echo \033[34m
                                                                                                                                   else
                                                                                                                                               # MAGENTA
                                                                                                                                                           if $arg0 == 5
                                                                                                                                                                         echo \033[35m
                                                                                                                                                                                     else
                                                                                                                                                                                                   # CYAN
                                                                                                                                                                                                                 if $arg0 == 6
                                                                                                                                                                                                                                 echo \033[36m
                                                                                                                                                                                                                                               else
                                                                                                                                                                                                                                                               # WHITE
                                                                                                                                                                                                                                                                               if $arg0 == 7
                                                                                                                                                                                                                                                                                                 echo \033[37m
                                                                                                                                                                                                                                                                                                                 end
                                                                                                                                                                                                                                                                                                                               end
                                                                                                                                                                                                                                                                                                                                           end
                                                                                                                                                                                                                                                                                                                                                     end
                                                                                                                                                                                                                                                                                                                                                             end
                                                                                                                                                                                                                                                                                                                                                                   end
                                                                                                                                                                                                                                                                                                                                                                       end
                                                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                                                           end
                                                                                                                                                                                                                                                                                                                                                                           end
define color_reset
  if $USECOLOR == 1
    echo \033[0m
  end
end

define color_bold
               if $USECOLOR == 1
                   echo \033[1m
                     end
                     end
                     
                     define color_underline
                       if $USECOLOR == 1
                           echo \033[4m
                             end
                             end
# can't use the color functions because we are using the set command
if $COLOREDPROMPT == 1
  set prompt \033[31mgdb$ \033[0m
end

# Initialize these variables else comparisons will fail for coloring
# we must initialize all of them at once, 32 and 64 bits, and ARM.
set $oldrax = 0
set $oldrbx = 0
set $oldrcx = 0
set $oldrdx = 0
set $oldrsi = 0
set $oldrdi = 0
set $oldrbp = 0
set $oldrsp = 0
set $oldr8  = 0
set $oldr9  = 0
set $oldr10 = 0
set $oldr11 = 0
set $oldr12 = 0
set $oldr13 = 0
set $oldr14 = 0
set $oldr15 = 0
set $oldeax = 0
set $oldebx = 0
set $oldecx = 0
set $oldedx = 0
set $oldesi = 0
set $oldedi = 0
set $oldebp = 0
set $oldesp = 0
set $oldr0  = 0
set $oldr1  = 0
set $oldr2  = 0
set $oldr3  = 0
set $oldr4  = 0
set $oldr5  = 0
set $oldr6  = 0
set $oldr7  = 0
set $oldsp  = 0
set $oldlr  = 0

set auto-load safe-path /
add-auto-load-safe-path=/home/ubuntu/lab/.gdbinit
