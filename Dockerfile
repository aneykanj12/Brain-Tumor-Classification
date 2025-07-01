# Use the latest official Python image (Python 3.12+)
FROM python:3.12-slim

WORKDIR /app

COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install notebook

EXPOSE 8888
CMD ["jupyter", "notebook", "--notebook-dir=notebooks", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--ServerApp.token=''", "--ServerApp.password=''", "--ServerApp.disable_check_xsrf=True", "--ServerApp.allow_origin='*'"]


