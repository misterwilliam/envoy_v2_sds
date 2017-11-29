from flask import Flask
app = Flask(__name__)

@app.route('/uds')
def hello():
  return 'Hello From UDS!\n'

if __name__ == "__main__":
  app.run()
