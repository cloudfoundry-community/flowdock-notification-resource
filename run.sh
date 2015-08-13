#concourse_pipeline_baseurl="http://10.202.75.109/pipelines/

COMMAND="curl -i -X POST -H \"Content-Type: application/json\" -d '${MESSAGE}' ${API_URL}"
#echo $COMMAND
eval $COMMAND
