from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "<h1>BioGuard System: ON</h1><p>Estado: Protegido por Ciber-Fortaleza.</p>"

if __name__ == "__main__":
    # CRÍTICO: Debe ser 0.0.0.0 para que Docker lo exponga al 8443
    app.run(host='0.0.0.0', port=5000)
