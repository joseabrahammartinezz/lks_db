FROM python:3.10
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install --upgrade pip
#RUN apt install python3.10-dev
#RUN add-repository ppa:ubuntugis/ppa
#RUN apt update
#RUN apt install gdal-bin
#RUN apt install libgdal-dev
#RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal
#RUN export C_INCLUDE_PATH=/usr/include/gdal
#RUN pip install GDAL==3.3.2
RUN apt-get update && apt-get install -y libgdal-dev g++ --no-install-recommends && \
    apt-get clean -y
# Update C env vars so compiler can find gdal
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

RUN python -m pip install -r requirements.txt
COPY . /code/
