FROM znc:1.6
MAINTAINER  Jason Dudash "jason.dudash@gmail.com"

USER root

LABEL io.k8s.description="Run ZNC search in OpenShift" \
      io.k8s.display-name="ZNC 1.6" \
      io.openshift.expose-services="6697:http" \
      io.openshift.tags="znc,solr1.6" \
      io.openshift.s2i.scripts-url="image:///${STI_SCRIPTS_PATH}"

# If we need to add files as part of every ZNC conf, they could go here
# COPY ./modules/ /znc-data/modules

# We could override the entry point to do what we want
#COPY entrypoint.sh /

# But let's just smoke the chown stuff - we don't need do do that in a script
RUN rm -rf /startup-sequence/50-chown.sh

# overwrite the launch script with our own
COPY 99-launch.sh /startup-sequence/

# copy in a default data file
COPY znc.conf /znc-data

# Give the ZNC directory to root group (not root user)
# https://docs.openshift.org/latest/creating_images/guidelines.html#openshift-origin-specific-guidelines
RUN chgrp -R 0 /opt/znc \
  && chmod -R g+rwX /opt/znc

RUN chgrp -R 0 /znc-data \
  && chmod -R g+rwX /znc-data

USER 1001
