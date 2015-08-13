concourse_display_name="Concourse Drone [Test]"
concourse_notify_from_email="test@example.com"
concourse_msg_threadID=$(cat .thread_id)
concourse_avatar="http://cl.ly/image/3e1h0H3H2s0P/concourse-logo.png"
concourse_pipeline_url="http://10.202.75.109/pipelines/microbosh-deployments"
concourse_flow_token=$(cat .flow_token)
concourse_msg_event="activity" # activity or discussion
concourse_msg_status_value="Drone Test"
concourse_msg_status_color="purple" # using purple to differentiate all test messages from "regular" msgs
concourse_pipeline_name="Test Pipeline"
concourse_msg_title="TESTING WITH TEST SCRIPT"
concourse_msg_thread_title="Yet Another Test: ${concourse_msg_threadID}"
concourse_msg_field_label="Status Message"
concourse_msg_field_value="All tests passed."
concourse_msg_body="This message is to test the Concourse FlowDrone integration."

echo $(expr ${concourse_msg_threadID} + 1) > .thread_id


HEADER="\"flow_token\": \"${concourse_flow_token}\", \"event\": \"${concourse_msg_event}\", \"author\": {\"name\": \"${concourse_display_name}\", \"avatar\": \"${concourse_avatar}\"}"
MSGINFO="\"title\": \"${concourse_msg_title}\", \"external_thread_id\": \"${concourse_msg_threadID}\""
MSGTHREAD="\"thread\": {\"title\": \"${concourse_msg_thread_title}\", \"fields\": [{\"label\": \"${concourse_msg_field_label}\", \"value\": \"${concourse_msg_field_value}\"}], \"body\": \"${concourse_msg_body}\", \"external_url\": \"${concourse_pipeline_url}\", \"status\": {\"color\": \"${concourse_msg_status_color}\", \"value\": \"${concourse_msg_status_value}\"}}"

export MESSAGE="{${HEADER}, ${MSGINFO}, ${MSGTHREAD}}"
export API_URL="https://api.flowdock.com/messages"

./run.sh
