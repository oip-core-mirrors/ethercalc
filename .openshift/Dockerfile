FROM registry.redhat.io/rhoar-nodejs/nodejs-10

EXPOSE 8000

USER root

COPY .openshift/entrypoint.sh /opt/app-root/src/entrypoint.sh

RUN ls -l /opt/app-root/src/entrypoint.sh && \
    chown 1001 /opt/app-root/src/entrypoint.sh && \
    chmod ug+x /opt/app-root/src/entrypoint.sh && \
    ls -l /opt/app-root/src/entrypoint.sh

USER  1001

RUN id && \
    source /usr/libexec/s2i/env && \
    npm install ethercalc pm2 redis-cli && \
    rm -rf /usr/local/lib/node_modules/ethercalc/node_modules/nodemailer/ && \
    ln -s ../../node_modules ./node_modules/ethercalc/node_modules && \
    fix-permissions /opt/app-root

CMD ["/opt/app-root/src/entrypoint.sh"]
