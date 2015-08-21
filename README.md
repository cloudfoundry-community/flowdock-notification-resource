# flowdock-concourse-notification-resource
Concourse CI resource for sending notifications to Flowdock.

## Requirements

* Flowdock account with `admin` access or a trial account for testing
 * Setup your Flowdock account for integration testing by following the [Flowdock documentation](https://www.flowdock.com/api/integration-getting-started). This test does not use OAUTH2.0.
* Vagrant version `1.6.5`
* VirtualBox version `4.3.x`
* `fly` version `0.0.1` installed (this is the Concourse CLI client)

Make sure you save your flow token, which is generated when you set up the source for your developer application, as it **cannot be recovered later**.

## Testing

### Setup

In the `test` directory, remove the `example` from the file names:

```
mv credentials{-example,}.yml
mv pipeline{-example,}.yml
mv test{-example,}.yml
```

Put your flow token in the `test.sh` and `credentials.yml` files.

Setup the test environment by using our [Concourse Tutorials](https://github.com/starkandwayne/concourse-tutorial) and following the **Getting Started** and **Target Concourse** sections, which also include instructions for how to install `fly`.

Note that you do not need to clone the tutorial - the files you need for testing are all in the `test` directory.

#### Basic Shell Test

Before proceeding please run the `test/test.sh` script to verify your flow token is working correctly.

#### Concourse Testing
