FROM python:3.8-alpine
RUN apk add --no-cache mariadb-dev build-base pkgconf
COPY ./requrements.txt /app/requrements.txt
WORKDIR /app
RUN pip install --trusted-host pypi.python.org -r requrements
COPY . /app
ENV MYSQL_USER root
ENV MYSQL_PASSWORD secret
ENV MYSQL_DB student
ENV MYSQL_HOST <IP of azure cloud VM>
ENV MYSQLCLIENT_CFLAGS "-I/usr/include/mariadb"
ENV MYSQLCLIENT_LDFLAGS "-L/usr/lib/"
ENTRYPOINT [ "python" ]
CMD ["app.py" ]