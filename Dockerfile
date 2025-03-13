FROM python:3.9.21-alpine3.21

WORKDIR /usr/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ARG DISCORDTOKEN
ARG HUGGINGTOKEN
ARG TOGETHERTOKEN

ENV DISCORDTOKEN=${DISCORDTOKEN}
ENV HUGGINGTOKEN=${HUGGINGTOKEN}
ENV TOGETHERTOKEN=${TOGETHERTOKEN}

VOLUME [ "/usr/app/db" ]

CMD [ "python", "main.py" ]