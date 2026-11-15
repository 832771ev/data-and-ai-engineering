FROM apache/airflow:3.4.0-python3.12

COPY requirements.txt /requirements.txt

RUN pip install --no-cache-dir \
    --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-3.4.0/constraints-3.12.txt" \
    -r /requirements.txt