# flowdock-notification-resource
Concourse CI resource for sending notifications to Flowdock.

## Requirements

* Flowdock account with `admin` access or a trial account for testing
 * Setup your Flowdock account for integration testing by following the [Flowdock documentation](https://www.flowdock.com/api/integration-getting-started). This test does not use OAUTH2.0.
* Vagrant version `1.6.5` (not `1.7.x`)
* VirtualBox version `4.3.x` (not `5.x`)
* `fly` version `0.0.1` installed (this is the Concourse CLI client)

Make sure you save your flow token, which is generated when you set up the source for your developer application, as it **cannot be recovered later**.

## Testing

### Setup

Copy the contents of the `test` directory to the `local` directory and remove the `example` from the file names:

```
mkdir local
cp -r test/* local
cd local
mv credentials{-example,}.yml
mv pipeline{-example,}.yml
mv test{-example,}.sh
```

Note that the `local` directory is in `.gitignore`.

Put your flow token in the `test.sh` and `credentials.yml` files.

Put your Concourse URL in your `credentials.yml` file.

Setup the test environment by using our [Concourse Tutorials](https://github.com/starkandwayne/concourse-tutorial) and following the **Getting Started** and **Target Concourse** sections, which also include instructions for how to install `fly`.

Note that you do not need to clone the tutorial - all the files you need for testing are all in the `test`/`local` directory.

#### Basic Shell Test

Before proceeding please run the `local/test.sh` script to verify your flow token is working correctly.

#### Concourse Testing

From the `local` directory start the Vagrant VM if you have not already done so:

```
vagrant up
```

To verify that your version of `fly` is synced with the version in use with the Concourse pipeline, run:

```
fly -t tutorial sync
```

Go into the vagrant container modify the `workers.json` file to use the current resource Docker container.

```
vagrant ssh
sudo su -
vi /var/vcap/jobs/groundcrew/config/worker.json
monit restart beacon
```

The line you need to append to the `workers.json` file is:
```
,{"image":"docker:///starkandwayne/flowdock-notification-resource","type":"flowdock-notification"}]}
```

Exit out of the Vagrant ssh session and deploy the pipeline with:

```
fly -t tutorial c -c pipeline.yml --vf=credentials.yml flowdock
```

You may need to unpause the pipeline. To do this, go to the pipeline URL at http://192.168.100.4:8080/, click the menu in the right hand corner, and click the blue play button next to the pipline name (`flowdock` if you kep the name above). You will see the blue "pause" bar disappear when the pipeline is no longer paused.

To run the job, go into `job-hello-world` and click the (+) icon.
