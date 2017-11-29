from flask import Flask
app = Flask(__name__)

@app.route('/tcp')
def hello():
   return 'Hello From TCP!\n'
if __name__ == "__main__":
   app.run()
            
