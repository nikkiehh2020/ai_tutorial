# FROM nvcr.io/nvidia/pytorch:23.11-py3
FROM rocm/dev-ubuntu-20.04:latest

ENV TORCH_HOME=/usr/src/ai_tutorial/cache

WORKDIR /usr/src/ai_tutorial

COPY . .

RUN pip install --upgrade pip \
	&& apt update -y \
	# && apt -y upgrade \
	&& apt install -y\
		fonts-humor-sans \
        libjpeg-dev \
        python3-dev \
    && pip install -e .[all] \
    && pip install -r \
        requirements.txt \
	# && conda update -y conda \
	# && while read requirement; do conda install --yes ${requirement}; done < requirements_pytorch.txt \
	# Clean up
	&& rm -rf /tmp/* \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt clean -y

CMD [ "/bin/bash" ]


