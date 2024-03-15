FROM python:3.11

WORKDIR /usr/src/ai_tutorial/applications/streamlit

COPY ../applications/streamlit .

RUN pip install --upgrade pip \
	&& pip install \
        -r requirements.txt \
	&& apt update -y \
	# && apt -y upgrade \
	&& apt install -y\
		fonts-humor-sans \
        vim \
	&& rm -rf /tmp/* \
	&& rm -rf /var/lib/desktop-containerd/daemon/tmpmounts/* \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt clean -y

ENV PYTHONPATH=/usr/src/ai_tutorial

CMD ["streamlit", "run", "app.py"]
