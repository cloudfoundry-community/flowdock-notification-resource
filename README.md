# flowdock-notification-concourse-resource
Concourse CI resource for sending notifications to Flowdock.

## Setup

* Change `.flow_token-example` to `.flow_token` and replace the psuedotoken with the flow token that was generated when you set up the source for your developer application.
* Change `.thread_id-example` to `.thread_id`. The thread ID does not need to be changed unless you do not wish to start at 1.

The purpose of the separation is to avoid thread collision where a message is posted to the wrong thread. If a thread ID is reused the original message will not be deleted, the new message will merely be placed in a potentially unrelated thread.
