export ALF=/opt/alfresco
export EXT=$ALF/tomcat/shared/classes/alfresco/extension

alias alfstart="cd $ALF; ./alfresco.sh start; cd -"
alias alfstop="cd $ALF; ./alfresco.sh stop; cd -"
alias alftail="tail -f $ALF/tomcat/logs/catalina.out"
alias psgj="ps aux | grep java"

