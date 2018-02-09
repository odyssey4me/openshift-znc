# Open Shift ZNC
Example of wrapping the dockerhub znc container image to run in OpenShift

Create the app from a Docker image
`oc new-app https://github.com/dudash/openshift-znc.git --name=znc-demo`

Now you can access it via the route that was automatically exposed on port 6697.

## Setup the config to persist via a config map
 Here's a quick way to set that up.
1) Download the znc.conf from this repo or create your own
2) Turn that file into a config map by running:
`oc create configmap znc-config --from-file=./znc.conf`
3) Map the configmap to the deployment config by running:
`oc volume dc/openshift-znc --add --configmap-name=znc-config`
4) Now OCP will re-deploy and the znc.conf file is mounted in a /znc-config path on the running container

You can do all of the above with the webconsole too - it's fairly straight-forward:  Start by going the deployment, scroll down and click "Add Config Files".  Continue from there...

## Setup the config to persist via a persistent volume
You could also consume the config map data in a PV so that changes are preserved.  I'll leave this as an exercise for you to figure out.  Start by reading the details here:
* [Consuming ConfigMaps in Volumes][3]

# References
* [Base Image for ZNC][1]
* [OpenShift Image Guidelines][2]

[1]: https://hub.docker.com/_/znc/
[2]: https://docs.openshift.com/container-platform/3.7/creating_images/guidelines.html#openshift-specific-guidelines
[3]: https://docs.openshift.com/container-platform/3.7/dev_guide/configmaps.html#configmaps-use-case-consuming-in-volumes
