#!/usr/bin/awk -f

BEGIN{start="false"; num = 0}

/^N: /{print "device:",$2}
/^E: ID_VENDOR/{split($0, arr, "="); print "vendor:",arr[2]}
/^E: ID_MODE/{split($0, arr, "="); print "model:",arr[2]}
/^S:/{if(!match($2,"disk")){num ++; if(match(start, "false")){var = sprintf($2); start="true"} else {var = sprintf(var ", " $2)}}}

END{if(num > 0) print "supporting:", var}
