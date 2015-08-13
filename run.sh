COMMAND="curl -i -X POST -H \"Content-Type: application/json\" -d '${MESSAGE}' ${API_URL}"
#echo $COMMAND
eval $COMMAND
