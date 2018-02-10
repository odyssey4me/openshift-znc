# OpenShift ZNC
Example of wrapping the dockerhub znc container image to run in OpenShift.

Create the app from a Docker image and expose it to webtraffic
* `oc new-app https://github.com/dudash/openshift-znc.git --name=znc-demo`
* `oc expose service znc-demo`

Now you can access it via the route that was automatically exposed on port 6697.

## Setup the config to persist via a config map
 Here's a quick way to set that up.
1) Download the znc.conf from this repo or create your own
2) Turn that file into a config map by running:
`oc create configmap znc-config --from-file=./znc.conf`
3) Pause the rollouts so we can make all our changes without rolling updates
`oc rollout pause dc/znc-demo`
4) Map the configmap to the deployment config by running:
`oc volume dc/znc-demo --add --configmap-name=znc-config --mount-path='/znc-config/configs/' --default-mode='0777'`
5) Set an ENV var to tell the scripts running in the pod to use a different config path
`oc env dc/znc-demo OVERRIDE_DATADIR='/znc-config'`
6) Resume deployments
`oc rollout resume dc/znc-demo`
7) Now OCP will re-deploy and the znc.conf file is mounted in a /znc-config/configs path on the running container


## Setup the config to persist via a persistent volume
You could also consume the config map data in a PV so that changes are preserved.  I'll leave this as an exercise for you to figure out.  Start by reading the details here:
* [Consuming ConfigMaps in Volumes][3]

# References
* [Base Image for ZNC][1]
* [OpenShift Image Guidelines][2]

[1]: https://hub.docker.com/_/znc/
[2]: https://docs.openshift.com/container-platform/3.7/creating_images/guidelines.html#openshift-specific-guidelines
[3]: https://docs.openshift.com/container-platform/3.7/dev_guide/configmaps.html#configmaps-use-case-consuming-in-volumes
