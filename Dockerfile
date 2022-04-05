# https://medium.com/codex/running-gui-applications-in-docker-firefox-nautilus-file-manager-5424694104ec
# https://www.cloudsavvyit.com/10520/how-to-run-gui-applications-in-a-docker-container/
FROM ubuntu:18.04
ARG DISPLAY
ARG TOKEN
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update >/dev/null 2>&1 && apt-get install -y nautilus >/dev/null 2>&1 && apt-get install xauth >/dev/null 2>&1
RUN touch ~/.Xauthority
RUN xauth add $DISPLAY . $TOKEN
RUN mkdir /root/.config
RUN mkdir /root/.config/nautilus
CMD ["nautilus", "/"]
