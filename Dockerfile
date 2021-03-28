FROM amazon/aws-cli:2.1.32

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_REGION

RUN aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
RUN aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
RUN aws configure set region ${AWS_REGION}

COPY commander.sh .
RUN chmod +x commander.sh

COPY deploy.sh .
RUN chmod +x deploy.sh

COPY deploy-stack.sh .
RUN chmod +x deploy-stack.sh

COPY destroy.sh .
RUN chmod +x destroy.sh

COPY destroy-stack.sh .
RUN chmod +x destroy-stack.sh

COPY . .

ENTRYPOINT [ "./commander.sh" ] 