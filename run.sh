# docker run \
#     -v <PATH_TO_PROJECT>:/app/airflow/dags \
#     --name airflow \
#     -p 8081:8080 \
#     -d airflow:0.1.0

CURR_DIR=$(pwd)
echo $CURR_DIR
echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env
docker run \
    -v $CURR_DIR/dags:/app/airflow/dags \
    --env-file .env \
    --name airflow-pi \
    -p 8081:8080 \
    -d airflow:0.1.0