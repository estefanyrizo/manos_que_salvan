import os
from flask_sqlalchemy import SQLAlchemy
from datetime import date, datetime
import requests
from dotenv import load_dotenv
from flask import Flask, json, session, url_for
from flask_session import Session
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker
from flask import Flask, flash, redirect, render_template, request, session
from tempfile import mkdtemp
from werkzeug.security import check_password_hash, generate_password_hash
from helpers import login_required, subirImagen, validarDouble, validarString, subirArchivo, crearpdf
from flask import jsonify, send_file
from sqlalchemy.sql import text
import helpers
from flask_paginate import Pagination, get_page_parameter
import locale

app = Flask(__name__)

# Configure session to use filesystem
app.config["SESSION_FILE_DIR"] = mkdtemp()
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
app.config['SECRET_KEY'] = 'super secret key'

Session(app)

basedir = os.path.abspath(os.path.dirname(__file__))
app.config['SQLALCHEMY_DATABASE_URI'] = f'sqlite:///{os.path.join(basedir, "manos_que_salvan.db")}'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Inicializar la extensión SQLAlchemy
db = SQLAlchemy(app)

# Rutas de la aplicación
@app.route("/")
def home():
    return render_template("index.html")

@app.route("/register")
def register(): 
    return render_template("register.html")

@app.route("/info_mascota")
def info_mascota(): 
    return render_template("info_mascota.html")

@app.route("/nueva_mascota_adop")
@login_required
def nueva_mascota_adop(): 
    return render_template("nueva_mascota_adop.html")

@app.route("/registrar_mascota_desaparecida")
@login_required
def mascota_desap(): 
    return render_template("registrar_mascota_desaparecida.html")

@app.route("/registrar_mascota_encontrada")
@login_required
def mascota_encon(): 
    return render_template("registrar_mascota_encontrada.html")

@app.route("/registrar_maltrato_animal")
@login_required
def maltrato_animal(): 
    return render_template("maltrato_animal.html")

@app.route("/mi_cuenta")
@login_required
def mi_cuenta(): 
    return render_template("mi_cuenta.html")

@app.route("/login", methods=["GET", "POST"])
def login():

    if request.method == "POST":

        if not request.form.get("username"):
            flash("Debe ingresar un usuario", "error")
            return render_template("login.html")

        elif not request.form.get("password"):
            flash("Debe ingresar una contraseña", "error")
            return render_template("login.html")

        flash("Prueba de exito", "exito")
        return redirect("/")

    else:
        return render_template("login.html")

@app.route("/imagen", methods=["POST"])
def imagen():
    
    if request.files["file"]:
        return {"status":"200"}
    else:
        return {"status":"415"}

if __name__ == '__main__':
    with app.app_context():
        db.create_all()  # Esto creará la base de datos `manos_que_salvan.db` sin necesidad de definir modelos
    app.run(debug=True)
