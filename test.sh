export concourse_display_name="Concourse Drone [Test]"
export concourse_notify_from_email="test@example.com"
export concourse_msg_threadID=1
export concourse_avatar="http://cl.ly/image/3e1h0H3H2s0P/concourse-logo.png"
export concourse_pipeline_url="http://10.202.75.109/pipelines/microbosh-deployments"
export concourse_flow_token=$(cat .flow_token)

export concourse_msg_event="activity" # activity or discussion
export concourse_msg_status_value="Drone Test"
export concourse_msg_status_color="purple" # using purple to differentiate all test messages from "regular" msgs
export concourse_pipeline_name="Test Pipeline"
export concourse_msg_title="TESTING WITH TEST SCRIPT"
export concourse_msg_thread_title="Yet Another Test"
export concourse_msg_field_label="Status Message"
export concourse_msg_field_value="All tests passed."
export concourse_msg_body="This message is to test the Concourse FlowDrone integration."


message="{\"flow_token\": \"${concourse_flow_token}\", \"event\": \"${concourse_msg_event}\", \"author\": {\"name\": \"${concourse_display_name}\", \"avatar\": \"${concourse_avatar}\"}, \"title\": \"${concourse_msg_title}\", \"external_thread_id\": \"${concourse_msg_threadID}\", \"thread\": {\"title\": \"${concourse_msg_thread_title}\", \"fields\": [{\"label\": \"${concourse_msg_field_label}\", \"value\": \"${concourse_msg_field_value}\"}], \"body\": \"${concourse_msg_body}\", \"external_url\": \"${concourse_pipeline_url}\", \"status\": {\"color\": \"${concourse_msg_status_color}\", \"value\": \"${concourse_msg_status_value}\"}}}"

API_URL="https://api.flowdock.com/messages"

COMMAND="curl -i -X POST -H \"Content-Type: application/json\" -d '${message}' $API_URL"
#echo $COMMAND
eval $COMMAND
