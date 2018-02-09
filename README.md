# Open Shift ZNC
Example of wrapping the dockerhub znc container image to run in OpenShift and adding some nifty persistent volume mapping.

Create the app from a Docker image
`> oc new-app https://github.com/dudash/openshift-znc.git --name=znc-demo`

Now you can access it via the route that was automatically exposed on port 6697.

# References
* [Base Image for ZNC][1]
* [OpenShift Image Guidelines][2]
* [Consuming ConfigMaps in Volumes][3]

[1]: https://hub.docker.com/_/znc/
[2]: https://docs.openshift.com/container-platform/3.7/creating_images/guidelines.html#openshift-specific-guidelines
[3]: https://docs.openshift.com/container-platform/3.7/dev_guide/configmaps.html#configmaps-use-case-consuming-in-volumes
