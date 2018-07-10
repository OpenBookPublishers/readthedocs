FROM python:3.6

ENV RTD_VERSION 2.5.3

RUN apt-get update && apt-get -y install \
  texlive-latex-recommended \
  texlive-fonts-recommended \
  texlive-latex-extra \
  doxygen \
  dvipng \
  graphviz

WORKDIR /tmp

RUN wget https://github.com/rtfd/readthedocs.org/archive/${RTD_VERSION}.tar.gz
RUN tar -zxvf ${RTD_VERSION}.tar.gz && rm ${RTD_VERSION}.tar.gz
RUN mv ./readthedocs.org-${RTD_VERSION} /rtd

WORKDIR /rtd

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# Fix dependencies issues
RUN pip install commonmark==0.5.4
RUN pip install hiredis==0.1.4

COPY ./local_settings.py ./rtd/settings/local_settings.py
RUN python ./manage.py migrate
RUN python ./manage.py collectstatic --noinput

VOLUME /rtd

EXPOSE 80
CMD ["./manage.py", "runserver", "0.0.0.0:80"]]
