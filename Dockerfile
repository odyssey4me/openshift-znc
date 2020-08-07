FROM znc:1.8.1
MAINTAINER  Jesse Pretorius "jesse@odyssey4.me"

USER root
EXPOSE 6697

LABEL io.k8s.description="Run ZNC in OpenShift" \
      io.k8s.display-name="ZNC 1.8.1" \
      io.openshift.expose-services="6697:http" \
      io.openshift.tags="znc,znc1.8.1"

# copy in a default data file
COPY znc.conf /startup-sequence/configs/

# Remove the chown script because it is not allowed
RUN rm -rf /startup-sequence/20-chown.sh

# Give the ZNC directory to root group (not root user)
# https://docs.openshift.com/container-platform/4.5/openshift_images/create-images.html#images-create-guide-openshift_create-images
RUN chgrp -R 0 /opt/znc \
  && chmod -R g=u /opt/znc

USER 1001
