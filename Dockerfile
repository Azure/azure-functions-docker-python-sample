ARG BASE_IMAGE=mcr.microsoft.com/azure-functions/python
ARG BASE_IMAGE_TAG=2.0

FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}-python3.6-buildenv AS builder

RUN pip3 --no-cache-dir install pipenv

ENV PYROOT=/pyroot
ENV PIP_SRC=${PYROOT}/src \
    PYTHONUSERBASE=${PYROOT}

WORKDIR /build

COPY Pipfile* ./

RUN mkdir -p ${PIP_SRC} && \
    PIP_USER=1 PIP_IGNORE_INSTALLED=1 pipenv install --system --deploy

############################################################
FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG} AS runtime

ENV PYROOT=/pyroot
ENV PIP_SRC=${PYROOT}/src \
    host__logging__fileLoggingMode=always

WORKDIR $AzureWebJobsScriptRoot

COPY --from=builder ${PYROOT}/lib/ ${PYROOT}/lib/
COPY --from=builder ${PYROOT}/src/ ${PYROOT}/src/
COPY . ./

ENV PYTHON_PACKAGES=${PYROOT}/lib/python3.6/site-packages

ENV PYTHONDONTWRITEBYTECODE=1 \
    SKIP_PYTHONPATH_UPDATE=true \
    PYTHONPATH=${PYROOT}/lib/python:${PYROOT}/lib/python3.6:${PYTHON_PACKAGES}:${PYTHONPATH}

EXPOSE 80 5678
