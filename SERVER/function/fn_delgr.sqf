{deletegroup _x} forEach (allgroups select {(count (units _x )) == 0});
del = true;