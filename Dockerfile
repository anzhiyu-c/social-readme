FROM python:latest

# Install dependencies.
ADD requirements.txt /requirements.txt
RUN pip install -r requirements.txt

# Copy code.
ADD main.py /main.py
ADD social social/

CMD ["python", "/main.py"]
