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
from helpers import login_required
from flask_paginate import Pagination, get_page_parameter
import locale
from werkzeug.security import check_password_hash, generate_password_hash
import datetime
from cs50 import SQL

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
# db = SQLAlchemy(app)
db = SQL("sqlite:///manos_que_salvan.db")

# Rutas de la aplicación
@app.route("/")
def home():
    return render_template("index.html")

@app.route("/register", methods=["GET", "POST"])
def register(): 
    if request.method == "POST":

        nombre_usuario = request.form.get("nombre_usuario")
        email = request.form.get("email")
        contrasena = request.form.get("contrasena")
        confirmacion = request.form.get("confirmacion")
        nombres = request.form.get("nombres")
        apellidos = request.form.get("apellidos")
        direccion = request.form.get("direccion")
        biografia = request.form.get("biografia")
        # municipio_id = request.form.get("municipio_id")      
        
        # print(nombre_usuario)
        # print(email)
        # print(contrasena )
        # print(confirmacion)
        # print( nombres)
        # print(apellidos)
        # print(direccion )
        # print(biografia )  


        if not nombre_usuario or not email or not contrasena or not confirmacion or not nombres or not apellidos or not direccion or not biografia:
            # return apology("Llena todos los campos")
            flash('Llena todos los campos', 'error')
            return redirect("/register")

        if contrasena != confirmacion:
            # return apology("La contraseña debe ser igual a su confirmacion")
            flash('La contraseña debe ser igual a su confirmacion', 'error')
            return redirect("/register")

        verfUsuarioExistente = db.execute("SELECT nombre_usuario from usuarios WHERE (nombre_usuario = ?)", nombre_usuario)
        verfEmailExistente = db.execute("SELECT email from usuarios WHERE (email = ?)", email)

        if len(verfUsuarioExistente) != 0:
            # return apology("El nombre de usuario ya existe! :(")
            flash('El nombre de usuario ya existe', 'error')
            return redirect("/register")
        
        if len(verfEmailExistente) != 0:
            # return apology("El nombre de usuario ya existe! :(")
            flash('El email ya existe', 'error')
            return redirect("/register")

        db.execute('''
            INSERT INTO usuarios 
            (nombre_usuario, email, contrasena, nombres, apellidos, direccion, biografia, municipio_id, creado_en) 
            VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)''', nombre_usuario, email, generate_password_hash(contrasena), nombres, apellidos, direccion, biografia, '1', datetime.datetime.now())

        flash('Registado exitosamente', 'exito')
        return redirect("/register")

    else:
        return render_template("register.html")


@app.route("/login", methods=["GET", "POST"])
def login():
    """Log user in"""

    # Forget any user_id
    session.clear()

    # User reached route via POST (as by submitting a form via POST)
    if request.method == "POST":

        # Ensure username was submitted
        if not request.form.get("nombre_usuario"):
            # return apology("Debe proveer un nombre de usuario", 403)
            flash('Debe proveer un nombre de usuario')
            return redirect("/login")

        # Ensure password was submitted
        elif not request.form.get("contrasena"):
            # return apology("Debe proveer una contraseña", 403)
            flash('Debe proveer una contraseña')
            return redirect("/login")

        # Query database for username
        rows = db.execute("SELECT * FROM usuarios WHERE nombre_usuario = ? OR WHERE email = ? LIMIT 1", request.form.get("nombre_usuario"), request.form.get("nombre_usuario"))

        # Ensure username exists and password is correct
        if len(rows) != 1 or not check_password_hash(rows[0]["contrasena"], request.form.get("contrasena")):
            # return apology("Credenciales Inválidas", 403)
            flash('Credenciales Inválidas')
            return redirect("/login")

        # Remember which user has logged in
        session["user_id"] = rows[0]["id"]
        print('funciona dog ' + session["user_id"])

        # Redirect user to home page
        return redirect("/")

    # User reached route via GET (as by clicking a link or via redirect)
    else:
        return render_template("login.html")

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