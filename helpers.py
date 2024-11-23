
import os
from flask import redirect, request, session
from functools import wraps
from flask.helpers import flash
from base64 import b64encode
from imagekitio import ImageKit
from imagekitio.models.UploadFileRequestOptions import UploadFileRequestOptions
import docraptor
import random

ik = ImageKit(private_key = 'private_Qp14eZvK/IRhm765ygkevTj6Qf0=',
    public_key = 'public_hbzaPES1Spn6HNAwv9KUELJz1ro=',
    url_endpoint = 'https://ik.imagekit.io/mi0xwh4ct')

doc_api = docraptor.DocApi()
doc_api.api_client.configuration.username = '23md2lJdruKB9SQuJ2Pj'

def login_required(f):
    """
    Decorate routes to require login.

    http://flask.pocoo.org/docs/0.12/patterns/viewdecorators/
    """
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if session.get("user_id") is None:
            return redirect("/login")
        return f(*args, **kwargs)
    return decorated_function

def validarString(dato):
    if not dato or not dato.isalpha() or dato.isspace():
        return False

    return True


def validarDouble(dato):
    if not dato or not dato.replace(".", "").isdigit() or float(dato) < 1:
        return False

    return True


def subirImagen(imagen, folderimg):

    imagen = b64encode(request.files["foto"].stream.read())
    # Al codificarla, se agrega una letra y una comilla al inicio del texto, tambien una comilla al fina
    # str(imagen)[2:len(imagen)] omito los primeros 2 caracteres y el ultimo

    imagen = str(imagen)[2:len(imagen)]

    # return f'<img src="data:image/png;base64,{imagen}">'
    # print(imagen)

    res = ik.upload(file=imagen, file_name = f"{request.form.get('nombre_mascota')} {random.randint(1,100000)}", options=UploadFileRequestOptions(folder=f"Mascotas/{folderimg}"))
    # El options es opcional de ponerlo y tiene varios parametros configurables, util como para custom_metadata = {"marca": "Gucci", "color":"rojo"}
    # print(res.url)
    # El url listo para guardar en la base de datos y mostrarlo en el html desde el link

    # print(res.response_metadata.raw)
    return res.url


def subirArchivo(archivo, nombre, folder):
    archivo = b64encode(request.files["file"].stream.read())
    # Al codificarla, se agrega una letra y una comilla al inicio del texto, tambien una comilla al fina
    # str(imagen)[2:len(imagen)] omito los primeros 2 caracteres y el ultimo

    archivo = str(archivo)[2:len(archivo)]

    # return f'<img src="data:image/png;base64,{imagen}">'
    # print(imagen)

    res = ik.upload(file=archivo, file_name=nombre, options= UploadFileRequestOptions(folder=folder))
    # El options es opcional de ponerlo y tiene varios parametros configurables, util como para custom_metadata = {"marca": "Gucci", "color":"rojo"}
    # print(res.url)
    # El url listo para guardar en la base de datos y mostrarlo en el html desde el link

    # print(res.response_metadata.raw)
    return res.url


def get_departamentos_municipios_select (db_instance):
    departamentos_municipios = db_instance.execute('''
                                              SELECT 
                                                    departamentos.id AS departamento_id,
                                                    departamentos.nombre AS departamento_nombre,
                                                    municipios.id AS municipio_id,
                                                    municipios.nombre AS municipio_nombre
                                                FROM 
                                                    departamentos
                                                INNER JOIN 
                                                    municipios 
                                                ON 
                                                departamentos.id = municipios.departamento_id;
                                              ''')
        
    departamentos_municipios_var = {}
    for row in departamentos_municipios:
        # Si el departamento no está en el diccionario, lo inicializamos con una lista vacía para 'hijos'
        if row['departamento_nombre'] not in departamentos_municipios_var:
            departamentos_municipios_var[row['departamento_nombre']] = {
                'id_padre': row['departamento_id'],
                'hijos': []  # Inicializamos 'hijos' como una lista vacía
            }
        
        # Agregar los municipios como hijos (a la lista 'hijos')
        departamentos_municipios_var[row['departamento_nombre']]['hijos'].append({
            'id_hijo': row['municipio_id'],
            'nombre_hijo': row['municipio_nombre']
        })
        
    return departamentos_municipios_var