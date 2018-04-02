FROM ansibleplaybookbundle/apb-base:canary

ADD playbooks /opt/apb/actions

# Add our role into the ansible roles dir
ADD . /opt/ansible/roles/automation-broker-apb

RUN chmod -R g=u /opt/{ansible,apb}

USER apb
