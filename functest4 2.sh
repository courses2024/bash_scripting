#!/bin/bash     
# functest4.sh : Demo globale und lokale Variablen
#date           :20180820
#version        :1.0    
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

myfunc() {
    var1=10
	var2=20
	local var3=30
}

var1=0
myfunc

echo $var1
echo $var2
echo $var3
	
