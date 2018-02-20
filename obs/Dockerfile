FROM python:3.6

MAINTAINER Hugo van Duijn <hugo.vanduijn@naturalis.nl>
LABEL Description="Python django OBS app, based on Python 3.6." 


ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/
FROM php:7.0-apache

