# Open Shift ZNC
This is for Tony James...

Create the app from a Docker image
`> oc new-app https://github.com/dudash/openshift-znc.git --name=znc-demo`

Now you can access it via the route that was automatically exposed on port 8983 and whereever your OpenShift apps route.

# References
* [Base Image for ZNC][1]
* [OpenShift Image Guidelines][2]

[1]: https://hub.docker.com/_/znc/
[2]: https://docs.openshift.com/container-platform/3.7/creating_images/guidelines.html#openshift-specific-guidelines

