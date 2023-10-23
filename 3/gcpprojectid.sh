function gcpprojectid {
        #lastcmd=`history | tail -2 | head -1`
        lastcmd=`history | tail -1`
        if [[ "$PWD"  =~ .*"cloudshell".* ]] || [[ "$PWD" =~ .*"Devoteam".* ]]; then
        	if [[ "$lastcmd" =~ .*"gcloud config set project".* ]] || [[ "$lastcmd" =~ .*" cd ".*  ]] ; then
                        #echo "[`gcloud config get-value project`]";
                        gcpid=`gcloud config get-value project`
                        echo "[$gcpid"] > ~/.gcpid
                        #source ~/.myvar
                fi
	else
		> ~/.gcpid	
        fi
}
