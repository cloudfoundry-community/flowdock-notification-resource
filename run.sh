#concourse_pipeline_baseurl="http://10.202.75.109/pipelines/

if [[ -z ${MESSAGE} ]]; then
  echo -e "Cannot post message to Flowdock. \n Reason: Message is unset or empty."
  exit 1
fi

if [[ -z ${API_URL} ]]; then
  echo -e "Cannot post message to Flowdock. \n Reason: API URL is unset or empty."
  exit 1
fi

COMMAND="curl -i -X POST -H \"Content-Type: application/json\" -d '${MESSAGE}' ${API_URL}"
#echo $COMMAND
eval $COMMAND
